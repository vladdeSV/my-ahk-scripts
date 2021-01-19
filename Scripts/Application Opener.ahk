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

; Sublime Merge
F19::{
  OpenApplication("sublime_merge.exe", "C:\Program Files\Sublime Merge\")
}

; Sublime Text
F20::{
  OpenApplication("sublime_text.exe", "C:\Program Files\Sublime Text 3\")
}

; Task Manager
F21::{
  OpenApplication("Taskmgr.exe", "C:\Windows\System32\")
}

; Slack
F22::{
  OpenApplication("slack.exe", A_AppData . "\..\Local\slack\")
}

; Edge
F23::{
  OpenApplication("msedge.exe", "C:\Program Files (x86)\Microsoft\Edge\Application\")
}

OpenApplication(exe, fileDirectory)
{
  OpenApplicationRaw("ahk_exe " . exe, fileDirectory . exe)
}

OpenApplicationRaw(ahkExe, runCommand)
{
  if (WinExist(ahkExe)) {
    WinActivate ahkExe
  } else {
    Run runCommand
  }

  WinWait ahkExe
  WinActivate ahkExe
  WinWaitActive ahkExe
}
