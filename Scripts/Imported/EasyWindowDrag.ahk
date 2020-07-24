; Easy Window Dragging and Resizing -- by Jonny, then TaranVH
; Original script: https://autohotkey.com/docs/scripts/EasyWindowDrag_(KDE).htm

; Known issue (TaranVH): does NOT work properly on systems with varying UI scaling from one monitor to the next. it just keep enlargening the window indefinitely as soon as it touches the dofferently scaled monitor. i have no idea how to fix this... further reading... https://www.autohotkey.com/boards/viewtopic.php?f=14&t=13810

#InstallKeybdHook
#KeyHistory 500
#SingleInstance force

; Set delay after "windowing commands", see https://www.autohotkey.com/docs/commands/SetWinDelay.htm
SetWinDelay, 5 ; Adding this here fixed including external window resize and reposition script
; Set delay after "windowing commands", see https://www.autohotkey.com/docs/commands/SetWinDelay.htm
SetWinDelay, 5
; Sets "coordinate mode", see https://www.autohotkey.com/docs/commands/CoordMode.htm
CoordMode, Mouse, Screen
; Gui -DPIScale
DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")

If (A_AhkVersion < "1.0.39.00")
{
    MsgBox, 20, , "'Easy Window Dragging and Resizing' may not work properly with your version of AutoHotkey. Continue?"
    IfMsgBox, No
    ExitApp
}

exitFullscreenForApplicationUnderMouse()
{
    MouseGetPos, , , id, control
    WinGetTitle, title, ahk_id %id%
    WinGetClass, class, ahk_id %id%
    WinRestore, %title%
}

Xbutton2::
{
    exitFullscreenForApplicationUnderMouse()

    currentHotkey = %A_thishotkey%

    ; Get the initial mouse position and window id, and abort if the window is maximized
    MouseGetPos, KDE_X1, KDE_Y1, KDE_id
    WinGet, KDE_Win, MinMax, ahk_id %KDE_id%
    If KDE_Win
        return
    
    ; Get the initial window position.
    WinGetPos, KDE_WinX1, KDE_WinY1, , , ahk_id %KDE_id%
    Loop
    {
        GetKeyState, KDE_Button, %currentHotkey%, P ; Break if button has been released
        If KDE_Button = U
            break
        
        MouseGetPos, KDE_X2, KDE_Y2 ; Get the current mouse position
        KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position
        KDE_Y2 -= KDE_Y1
        KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; Apply this offset to the window position
        KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
        WinMove,ahk_id %KDE_id%, , %KDE_WinX2%, %KDE_WinY2% ; Move the window to the new position
    }
}

Xbutton1::
{
    exitFullscreenForApplicationUnderMouse()

    currentHotkey = %A_thishotkey%

    ; Get the initial mouse position and window id, and abort if the window is maximized
    MouseGetPos, KDE_X1, KDE_Y1, KDE_id
    WinGet, KDE_Win, MinMax, ahk_id %KDE_id%
    If KDE_Win
        return
    
    ; Get the initial window position and size
    WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %KDE_id%

    ; Define the window region the mouse is currently in
    ; The four regions are Up and Left, Up and Right, Down and Left, Down and Right
    If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
        KDE_WinLeft := 1
    Else
        KDE_WinLeft := -1
    
    If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
        KDE_WinUp := 1
    Else
        KDE_WinUp := -1
    
    Loop
    {
        GetKeyState, KDE_Button, %currentHotkey%, P ; Break if button has been released
        If KDE_Button = U
            break
        
        MouseGetPos, KDE_X2, KDE_Y2 ; Get the current mouse position

        ; Get the current window position and size
        WinGetPos, KDE_WinX1, KDE_WinY1, KDE_WinW, KDE_WinH, ahk_id %KDE_id%
        KDE_X2 -= KDE_X1 ; Obtain an offset from the initial mouse position
        KDE_Y2 -= KDE_Y1

        ; Then, act according to the defined region
        WinMove, ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft + 1) / 2 * KDE_X2  ; X of resized window
                                 , KDE_WinY1 +   (KDE_WinUp + 1) / 2 * KDE_Y2  ; Y of resized window
                                 , KDE_WinW  -           KDE_WinLeft * KDE_X2  ; W of resized window
                                 , KDE_WinH  -             KDE_WinUp * KDE_Y2  ; H of resized window
        
        KDE_X1 := (KDE_X2 + KDE_X1) ; Reset the initial position for the next iteration
        KDE_Y1 := (KDE_Y2 + KDE_Y1)
    }
}
