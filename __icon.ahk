iconFileName := "__icon.ico"
if (FileExist(iconFileName)) {
  TraySetIcon(iconFileName, 0, 1)
  return
}

; fallback
; set icon to "toolbox"
TraySetIcon("SHELL32.dll", 36, 1)
