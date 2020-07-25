#Warn
#SingleInstance force

SetWorkingDir A_ScriptDir

; Set application icon
#Include "__icon.ahk"

; Include scripts
#Include "Scripts\CapsDelete.ahk"
#Include "Scripts\Virtual Desktop Switcher.ahk"
#Include "Scripts\Application Opener.ahk"
#Include "Scripts\Quick Task View.ahk"
#Include "Scripts\Toggle Maximized.ahk"

; Workaround to enable window resizing
Run "Scripts\EasyWindowDrag.ahk"
