#Requires AutoHotkey v2.0

; Easy Window Dragging and Resizing -- by Jonny, then TaranVH, then vladdeSV (updated to AHKv2)
; Original script: https://autohotkey.com/docs/scripts/EasyWindowDrag_(KDE).htm

; Known issue (TaranVH): does NOT work properly on systems with varying UI scaling from one monitor to the next. it just keep enlargening the window indefinitely as soon as it touches the dofferently scaled monitor. i have no idea how to fix this... further reading... https://www.autohotkey.com/boards/viewtopic.php?f=14&t=13810

#SingleInstance force

; Set delay after "windowing commands", see https://lexikos.github.io/v2/docs/commands/SetWinDelay.htm
SetWinDelay 5 ; Adding this here fixed including external window resize and reposition script
; Sets "coordinate mode", see https://lexikos.github.io/v2/docs/commands/CoordMode.htm
CoordMode "Mouse", "Screen"
; Gui -DPIScale
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
; Set icon to "double window"
TraySetIcon("SHELL32.dll", 160, 1)

RestoreWindow(windowId) {

  x := 0, y := 0, width := 0, height := 0
  ahkWindowId := "ahk_id " . windowId

  ; Get the fullscreen's position and size
  WinGetPos(&x, &y, &width, &height, ahkWindowId)

  ; Exit fullscreen state
  WinRestore(ahkWindowId)

  ; Set window size to which ever size it was before.
  WinMove(x, y, width, height, ahkWindowId)
}

; Move window
Xbutton2:: {

  ; If pressing the other button, stop
  if (GetKeyState("Xbutton1", "P") == true) {
    return
  }

  ; Get the initial mouse position and window id, and abort if the window is maximized
  cursorX1 := 0, cursorY1 := 0, windowUnderCursorId := ""
  MouseGetPos(&cursorX1, &cursorY1, &windowUnderCursorId)
  windowId := "ahk_id " . windowUnderCursorId

  RestoreWindow(windowUnderCursorId)
  WinActivate(windowId)

  isCurrentWindoMaximized := WinGetMinMax(windowId)
  if (isCurrentWindoMaximized) {
    return
  }

  ; Get the initial window position.
  windowX1 := 0, windowY1 := 0
  WinGetPos(&windowX1, &windowY1, , , windowId)
  loop {
    ; Fullscreen application if other mouse button is pressed
    if (GetKeyState("Xbutton1", "P") == true) {
      ; Get the window id under the cursor
      WinMaximize(windowId)
      return
    }

    ; Break if button has been released
    if (GetKeyState(A_thishotkey, "P") == false) {
      return
    }

    MouseGetPos(&cursorX2, &cursorY2) ; Get the current mouse position
    cursorX2 -= cursorX1 ; Obtain an offset from the initial mouse position
    cursorY2 -= cursorY1
    windowX2 := (windowX1 + cursorX2) ; Apply this offset to the window position
    windowY2 := (windowY1 + cursorY2)

    if (!WinExist(windowId)) {
      return
    }

    WinMove(windowX2, windowY2, , , windowId) ; Move the window to the new position
  }
}

; Resize window
Xbutton1:: {

  ; If pressing the other button, stop
  if (GetKeyState("Xbutton2", "P") == true) {
    return
  }

  ; Get the initial mouse position and window id, and abort if the window is maximized
  cursorX1 := 0, cursorY1 := 0, windowUnderCursorId := ""
  MouseGetPos(&cursorX1, &cursorY1, &windowUnderCursorId)
  windowId := "ahk_id " . windowUnderCursorId

  RestoreWindow(windowUnderCursorId)
  WinActivate(windowId)

  isCurrentWindoMaximized := WinGetMinMax(windowId)
  if (isCurrentWindoMaximized) {
    return
  }

  ; Get the initial window position and size
  windowX1 := 0, windowY1 := 0, windowW := 0, windowH := 0
  WinGetPos(&windowX1, &windowY1, &windowW, &windowH, windowId)

  ; Define the window region the mouse is currently in
  ; The four regions are Up and Left, Up and Right, Down and Left, Down and Right
  if (cursorX1 < windowX1 + windowW / 2) {
    windowLeft := 1
  } else {
    windowLeft := -1
  }

  if (cursorY1 < windowY1 + windowH / 2) {
    windowUp := 1
  } else {
    windowUp := -1
  }

  loop {

    ; Break if button has been released
    if (GetKeyState(A_thishotkey, "P") == false) {
      return
    }

    MouseGetPos(&cursorX2, &cursorY2) ; Get the current mouse position

    ; Get the current window position and size
    WinGetPos(&windowX1, &windowY1, &windowW, &windowH, windowId)
    cursorX2 -= cursorX1 ; Obtain an offset from the initial mouse position
    cursorY2 -= cursorY1

    if (!WinExist(windowId)) {
      return
    }

    ; Then, act according to the defined region
    WinMove(
      windowX1 + (windowLeft + 1) / 2 * cursorX2,
      windowY1 + (windowUp + 1) / 2 * cursorY2,
      windowW - windowLeft * cursorX2,
      windowH - windowUp * cursorY2,
      windowId
    )

    ; Reset the initial position for the next iteration
    cursorX1 := (cursorX2 + cursorX1)
    cursorY1 := (cursorY2 + cursorY1)
  }
}
