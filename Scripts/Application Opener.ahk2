; Discord
F13::OpenApplicationRaw("ahk_exe Discord.exe", A_AppData . "\..\Local\Discord\Update.exe --processStart Discord.exe")
; Mailbird
F14::OpenApplication("Mailbird.exe", A_ProgramFiles . "\Mailbird\")
; Spotify
F15::OpenApplication("Spotify.exe", A_AppData . "\Spotify\")
; VoiceMeeter Potato
F16::OpenApplication("voicemeeter8.exe", EnvGet("ProgramFiles(x86)") . "\VB\Voicemeeter\")
; Explorer
F17::Run "explorer.exe"
; Visual Studio Code
F18::OpenApplication("Code.exe", A_AppData . "\..\Local\Programs\Microsoft VS Code\")
; Sublime Merge
F19::OpenApplication("sublime_merge.exe", A_ProgramFiles . "\Sublime Merge\")
; Sublime Text
F20::OpenApplication("sublime_text.exe", A_ProgramFiles . "\Sublime Text 3\")
; Task Manager
F21::OpenApplication("Taskmgr.exe", A_WinDir . "\System32\")
; Slack
F22::OpenApplication("slack.exe", A_AppData . "\..\Local\slack\")
; Edge
F23::OpenApplication("msedge.exe", EnvGet("ProgramFiles(x86)") . "\Microsoft\Edge\Application\")
; Windows Terminal
F24::OpenApplicationRaw("ahk_exe WindowsTerminal.exe", "wt")

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
