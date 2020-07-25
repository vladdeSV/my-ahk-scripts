IconFileName := "__icon.ico"
if (FileExist(IconFileName)) {
  TraySetIcon(IconFileName, 0, 1)
} else {
  ; Set icon to "double window"
  TraySetIcon("imageres.dll", 262, 1)
}
