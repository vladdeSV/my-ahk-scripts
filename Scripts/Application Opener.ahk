; Discord
F13::{
  if (WinExist("ahk_exe Discord.exe")) {
    WinShow "ahk_exe Discord.exe"
  } else {
    Run A_AppData . "\..\Local\Discord\Update.exe --processStart Discord.exe"
  }

  WinWait "ahk_exe Discord.exe"
  WinActivate "ahk_exe Discord.exe"
}

; Mailbird
F14::{
  OpenApplication("Mailbird.exe", "C:\Program Files\Mailbird\")
}

; Spotify
F15::{
  OpenApplication("Spotify.exe", A_AppData . "\Spotify\")
}

; VoiceMeeter Potato
F16::{
  OpenApplication("voicemeeter8.exe", "C:\Program Files (x86)\VB\Voicemeeter\")
}

; Explorer
F17::{
  Run "explorer.exe"
}

; Visual Studio Code
F18::{
  OpenApplication("Code.exe", A_AppData . "\..\Local\Programs\Microsoft VS Code\")
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
