#SingleInstance force
#Warn

; Set application icon
#Include "__icon.ahk"

; Include scripts
#Include "Scripts\CapsDelete.ahk"
#Include "Scripts\Application Opener.ahk"
#Include "Scripts\Toggle Maximized.ahk"

; Workaround to enable window resizing
Run "Scripts\EasyWindowDrag.ahk"
