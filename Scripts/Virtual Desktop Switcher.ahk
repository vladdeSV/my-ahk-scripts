; Switch virtual desktops with mouse buttons

#RButton:: ; windows key + right mouse button => switch to next desktop
  KeyWait LAlt, T0.5
  SendInput #^{Right}
  Return

#LButton:: ; windows key + left mouse button => switch to previous desktop
  KeyWait LCtrl, T0.5
  SendInput #^{Left}
  Return
