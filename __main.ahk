#NoEnv
#Warn
#SingleInstance force

; Workaround to enable window resizing
Run ".\Scripts\Imported\EasyWindowDrag.ahk"

SendMode Input
SetWorkingDir %A_ScriptDir%

; add icon someday
I_Icon = __icon.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
Else
  ; Set icon to "double window"
  Menu, Tray, Icon, imageres.dll, 262

#Include Scripts/CapsDelete.ahk
#Include Scripts/Hide Desktop Icons.ahk
#Include Scripts/Virtual Desktop Switcher.ahk
#Include Scripts/Application Opener.ahk
