^Numpad1::
	IfWinExist ahk_exe Discord.exe
		WinShow ahk_exe Discord.exe
	Else
		Run, %A_AppData%\..\Local\Discord\Update.exe --processStart Discord.exe

	WinWait ahk_exe Discord.exe
	WinActivate ahk_exe Discord.exe
	return

^Numpad2::
	OpenApplication("Mailbird.exe", "C:\Program Files\Mailbird\")
	return

^Numpad3::
	OpenApplication("Spotify.exe", "C:\Users\Vladimirs Nordholm\AppData\Roaming\Spotify\")
	return

^Numpad4::
	OpenApplication("voicemeeter8.exe", "C:\Program Files (x86)\VB\Voicemeeter\")
	return

^Numpad5::
	MsgBox, , , No application bound yet,
	return

^Numpad6::
	Run, explorer.exe
	return

OpenApplication(ahkExe, fileDirectory)
{
	IfWinExist ahk_exe %ahkExe%
		WinActivate ahk_exe %ahkExe%
	Else
		Run, %fileDirectory%%ahkExe%

	WinWait ahk_exe %ahkExe%
	WinActivate ahk_exe %ahkExe%
	WinWaitActive ahk_exe %ahkExe%
}
