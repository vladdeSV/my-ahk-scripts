; Switch virtual desktops with mouse buttons

; windows key + right mouse button => switch to next desktop
#RButton::{
  KeyWait "LAlt", "T0.5"
  SendInput "#^{Right}"
}

; windows key + left mouse button => switch to previous desktop
#LButton::{
  KeyWait "LCtrl", "T0.5"
  SendInput "#^{Left}"
}
