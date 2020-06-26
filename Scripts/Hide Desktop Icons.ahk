; Toggle icons on desktop hidden.
; Causes warning message on first use. Unsure how to fix this, as simply assigning the variable does not work

^+F1::
DesktopIconToggle := not DesktopIconToggle  ;Flip boolean

If (DesktopIconToggle)
	Control, Hide,, SysListView321, ahk_class WorkerW
else
	Control, Show,, SysListView321, ahk_class WorkerW
return