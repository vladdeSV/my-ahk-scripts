#NoEnv
#Warn
SendMode Input
SetWorkingDir %A_ScriptDir%

; add icon someday
I_Icon = __icon.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

#Include CapsDelete.ahk
#Include Hide Desktop Icons.ahk
#Include Virtual Desktop Switcher.ahk