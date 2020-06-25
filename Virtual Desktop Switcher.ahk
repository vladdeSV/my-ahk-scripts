; Switch virtual desktops with mouse buttons
;
; Mouse 4 opens a overview of all windows (Windows equivalent of macOS Mission Control)
; Mouse 5 + Left/Right mouse button switches one virtual desktop left and right respectively

XButton2 & RButton:: ; switch to next desktop with Windows key + Left Alt key
  KeyWait LAlt, T0.5
  SendInput #^{Right}
  Return

XButton2 & LButton:: ; switch to previous desktop with Windows key + Left CTRL key
  KeyWait LCtrl, T0.5
  SendInput #^{Left}
  Return

XButton1::
	SendInput #{Tab}