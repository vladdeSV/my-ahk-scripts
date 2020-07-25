; Easy Window Dragging and Resizing -- by Jonny, then TaranVH, then vladdeSV (updated to AHKv2)
; Original script: https://autohotkey.com/docs/scripts/EasyWindowDrag_(KDE).htm

; Known issue (TaranVH): does NOT work properly on systems with varying UI scaling from one monitor to the next. it just keep enlargening the window indefinitely as soon as it touches the dofferently scaled monitor. i have no idea how to fix this... further reading... https://www.autohotkey.com/boards/viewtopic.php?f=14&t=13810

#InstallKeybdHook
#KeyHistory 500
#SingleInstance force

; Set delay after "windowing commands", see https://lexikos.github.io/v2/docs/commands/SetWinDelay.htm
SetWinDelay 5 ; Adding this here fixed including external window resize and reposition script
; Sets "coordinate mode", see https://lexikos.github.io/v2/docs/commands/CoordMode.htm
CoordMode "Mouse", "Screen"
; Gui -DPIScale
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

restoreWindowUnderCursor()
{
  ; Get the window id under the cursor
  MouseGetPos ,, WindowId
  AhkWindowId := "ahk_id " . WindowId

  ; Get the fullscreen's position and size
  WinGetClientPos X, Y, Width, Height, AhkWindowId

  ; Exit fullscreen state
  WinRestore AhkWindowId

  ; Set window size to which ever size it was before.
  WinMove X, Y , Width, Height, AhkWindowId
}

Xbutton2::
{
  restoreWindowUnderCursor()

  ; Get the initial mouse position and window id, and abort if the window is maximized
  MouseGetPos CursorX1, CursorY1, WindowUnderCursorId
  IsCurrentWindoMaximized := WinGetMinMax("ahk_id " . WindowUnderCursorId)
  if (IsCurrentWindoMaximized) {
    return
  }
  
  ; Get the initial window position.
  WinGetPos WindowX1, WindowY1, , , "ahk_id " . WindowUnderCursorId
  loop
  {
    ; Break if button has been released
    if (GetKeyState(A_thishotkey, "P") == false) {
      break
    }
    
    MouseGetPos CursorX2, CursorY2 ; Get the current mouse position
    CursorX2 -= CursorX1 ; Obtain an offset from the initial mouse position
    CursorY2 -= CursorY1
    WindowX2 := (WindowX1 + CursorX2) ; Apply this offset to the window position
    WindowY2 := (WindowY1 + CursorY2)
    WinMove(WindowX2, WindowY2, , , "ahk_id " . WindowUnderCursorId) ; Move the window to the new position
  }
}

Xbutton1::
{
  restoreWindowUnderCursor()

  ; Get the initial mouse position and window id, and abort if the window is maximized
  MouseGetPos CursorX1, CursorY1, WindowUnderCursorId
  IsCurrentWindoMaximized := WinGetMinMax("ahk_id " . WindowUnderCursorId)
  if (IsCurrentWindoMaximized) {
      return
  }
  
  ; Get the initial window position and size
  WinGetPos WindowX1, WindowY1, WindowW, WindowH, "ahk_id " . WindowUnderCursorId

  ; Define the window region the mouse is currently in
  ; The four regions are Up and Left, Up and Right, Down and Left, Down and Right
  if (CursorX1 < WindowX1 + WindowW / 2) {
    WindowLeft := 1
  } else {
    WindowLeft := -1
  }
  
  if (CursorY1 < WindowY1 + WindowH / 2) {
    WindowUp := 1
  } else {
    WindowUp := -1
  }
  
  loop
  {
    ; Break if button has been released
    if (GetKeyState(A_thishotkey, "P") == false) {
      break
    }
    
    MouseGetPos CursorX2, CursorY2 ; Get the current mouse position

    ; Get the current window position and size
    WinGetPos WindowX1, WindowY1, WindowW, WindowH, "ahk_id " . WindowUnderCursorId
    CursorX2 -= CursorX1 ; Obtain an offset from the initial mouse position
    CursorY2 -= CursorY1

    ; Then, act according to the defined region
    WinMove(
      WindowX1 + (WindowLeft + 1) / 2 * CursorX2, ; X of resized window
      WindowY1 + (WindowUp + 1) / 2 * CursorY2, ; Y of resized window
      WindowW - WindowLeft * CursorX2, ; W of resized window
      WindowH - WindowUp * CursorY2, ; H of resized window
      "ahk_id " . WindowUnderCursorId
    )
    
    CursorX1 := (CursorX2 + CursorX1) ; Reset the initial position for the next iteration
    CursorY1 := (CursorY2 + CursorY1)
  }
}
