; Switch virtual desktops with mouse buttons

#RButton:: ; switch to next desktop with Windows key + Left Alt key
  KeyWait LAlt, T0.5
  SendInput #^{Right}
  Return

#LButton:: ; switch to previous desktop with Windows key + Left CTRL key
  KeyWait LCtrl, T0.5
  SendInput #^{Left}
  Return
