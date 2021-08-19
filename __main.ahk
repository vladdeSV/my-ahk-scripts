#SingleInstance force
#Warn

; Set application icon
#Include "__icon.ahk"

; Include scripts
#Include "Scripts\Application Opener.ahk"
#Include "Scripts\Hotstrings.ahk"
#Include "Scripts\Mute Microphone.ahk"

; Workaround to enable window resizing
Run "Scripts\EasyWindowDrag.ahk"
