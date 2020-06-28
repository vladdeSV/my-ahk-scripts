^Numpad1::
Run, explorer.exe
return

^Numpad2::
OpenApplication(Mailbird.exe, "C:\Program Files\Mailbird\Mailbird.exe")
return

^Numpad5::
OpenApplication(Discord.exe, "C:\Users\Vladimirs Nordholm\AppData\Local\Discord\Update.exe --processStart Discord.exe")
return

OpenApplication(ahkExe, fileLocation)
{
	IfWinExist ahk_exe ahkExe
		WinActivate ahk_exe ahkExe 
	Else
		Run, %fileLocation%
	WinWait ahk_exe ahkExe
	WinActivate ahk_exe ahkExe
	WinWaitActive ahk_exe ahkExe
}
