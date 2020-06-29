#NoEnv
#Warn
#SingleInstance force

SendMode Input
SetWorkingDir %A_ScriptDir%

; add icon someday
I_Icon = __icon.ico
IfExist, %I_Icon%
  Menu, Tray, Icon, %I_Icon%
Else
  ; Set icon to "double window"
  Menu, Tray, Icon, imageres.dll, 262

; Set delay after "windowing commands", see https://www.autohotkey.com/docs/commands/SetWinDelay.htm
SetWinDelay, 5 ; Adding this here fixed including external window resize and reposition script

#Include Scripts/CapsDelete.ahk
#Include Scripts/Hide Desktop Icons.ahk
#Include Scripts/Virtual Desktop Switcher.ahk
#Include Scripts/Application Opener.ahk
; Disabled until reposition Firefox works #Include Scripts/Imported/EasyWindowDrag.ahk
