#Requires AutoHotkey v2.0
#SingleInstance force
#Warn

; Set application icon
#Include "__icon.ahk"

; Include scripts
#Include "Scripts\Application Opener - Sidewinder X4.ahk"
#Include "Scripts\Hotstrings.ahk"
#Include "Scripts\Window Maximizer.ahk"

; Workaround to enable window resizing
Run "Scripts\EasyWindowDrag.ahk"
