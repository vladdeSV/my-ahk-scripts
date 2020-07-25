; Discord
^Numpad1::{
	if (WinExist("ahk_exe Discord.exe")) {
		WinShow "ahk_exe Discord.exe"
	} else {
		Run A_AppData . "\..\Local\Discord\Update.exe --processStart Discord.exe"
	}

	WinWait "ahk_exe Discord.exe"
	WinActivate "ahk_exe Discord.exe"
}

; Mailbird
^Numpad2::{
	OpenApplication("Mailbird.exe", "C:\Program Files\Mailbird\")
}

; Spotify
^Numpad3::{
	OpenApplication("Spotify.exe", A_AppData . "\Spotify\")
}

; VoiceMeeter Potato
^Numpad4::{
	OpenApplication("voicemeeter8.exe", "C:\Program Files (x86)\VB\Voicemeeter\")
}

; Explorer
^Numpad5::{
	Run "explorer.exe"
}

OpenApplication(exe, fileDirectory)
{
	ahkExe := "ahk_exe " . exe

	if (WinExist(ahkExe)) {
		WinActivate ahkExe
	} else {
		Run fileDirectory . exe
	}

	WinWait ahkExe
	WinActivate ahkExe
	WinWaitActive ahkExe
}
