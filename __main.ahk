#NoEnv
#Warn
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

; add icon someday
I_Icon = __icon.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%

#Include Scripts/CapsDelete.ahk
#Include Scripts/Hide Desktop Icons.ahk
#Include Scripts/Virtual Desktop Switcher.ahk
#Include Scripts/Application Opener.ahk
#Include Scripts/Imported/EasyWindowDrag.ahk
