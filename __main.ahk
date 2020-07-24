#Warn
#SingleInstance force

SetWorkingDir A_ScriptDir

; Set application icon
#Include "Scripts\__icon.ahk"

; Include scripts
#Include "Scripts\CapsDelete.ahk"
#Include "Scripts\Virtual Desktop Switcher.ahk"
#Include "Scripts\Application Opener.ahk"

; Workaround to enable window resizing
Run "Scripts\Imported\EasyWindowDrag.ahk"
