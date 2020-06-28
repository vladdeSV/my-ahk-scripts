^Numpad1::
Run, explorer.exe
return

^Numpad2::
OpenApplication("Mailbird.exe", "C:\Program Files\Mailbird\")
return

^Numpad3::
OpenApplication("voicemeeter8.exe", "C:\Program Files (x86)\VB\Voicemeeter\")
return

^Numpad4::
OpenApplication("Spotify.exe", "C:\Users\Vladimirs Nordholm\AppData\Roaming\Spotify\")
return

^Numpad5::
;OpenApplicationExtra("Discord.exe", "C:\Users\Vladimirs Nordholm\AppData\Local\Discord\Update.exe --processStart Discord.exe")
Run, C:\Users\Vladimirs Nordholm\AppData\Local\Discord\Update.exe --processStart Discord.exe
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
