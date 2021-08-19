; Toggle maximized
LAlt & Xbutton1::{
  ; Get the window id under the cursor
  MouseGetPos ,, WindowId
  AhkWindowId := "ahk_id " . WindowId

  IsMaximied := (WinGetMinMax(AhkWindowId) == 1)
  if (IsMaximied) {
    ; Restore to unmaximized
    WinRestore AhkWindowId
  } else {
    WinMaximize AhkWindowId
  }
}
