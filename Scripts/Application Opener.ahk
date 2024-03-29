#Requires AutoHotkey v2.0-beta.1

; Discord
F13::OpenApplicationRaw("ahk_exe Discord.exe", A_AppData . "\..\Local\Discord\Update.exe --processStart Discord.exe")
; Mailbird
F14::OpenApplication("Mailbird.exe", A_ProgramFiles . "\Mailbird\")
; Spotify
F15::OpenApplication("Spotify.exe", A_AppData . "\Spotify\")
; VoiceMeeter Potato
F16::OpenApplication("voicemeeter8.exe", EnvGet("ProgramFiles(x86)") . "\VB\Voicemeeter\")
; Explorer
F17::OpenApplicationRaw("ahk_class CabinetWClass", "explorer.exe")
; Visual Studio Code
F18::OpenApplication("Code.exe", A_AppData . "\..\Local\Programs\Microsoft VS Code\")
; Sublime Merge
F19::OpenApplication("sublime_merge.exe", A_ProgramFiles . "\Sublime Merge\")
; Sublime Text
F20::OpenApplication("sublime_text.exe", A_ProgramFiles . "\Sublime Text\")
; Task Manager
F21::OpenApplication("Taskmgr.exe", A_WinDir . "\System32\")
; Slack
F22::OpenApplication("slack.exe", A_AppData . "\..\Local\slack\")
; Edge
F23::OpenApplication("msedge.exe", EnvGet("ProgramFiles(x86)") . "\Microsoft\Edge\Application\")
; Windows Terminal
F24::OpenApplicationRaw("ahk_exe WindowsTerminal.exe", "wt")
; Remote Desktop Connection
!F13::OpenApplication("mstsc.exe", A_ProgramFiles . "\..\Windows\System32\")
; iCUE
!F14::OpenApplication("iCUE.exe", A_ProgramFiles . "\Corsair\CORSAIR iCUE 4 Software\")
; Calculator
!F15::OpenApplicationRaw("Calculator", "calc.exe")
; Affinity Photo
!F16::OpenApplication("Photo.exe", A_ProgramFiles . "\Affinity\Photo\")
; Affinity Designer
!F17::OpenApplication("Designer.exe", A_ProgramFiles . "\Affinity\Designer\")
; Affinity Publisher
!F18::OpenApplication("Publisher.exe", A_ProgramFiles . "\Affinity\Publisher\")
; DaVinci Resolve
!F19::OpenApplication("Resolve.exe", A_ProgramFiles . "\Blackmagic Design\DaVinci Resolve\")
; FL Studio
!F20::OpenApplication("FL64.exe", A_ProgramFiles . "\Image-Line\FL Studio 20\")
; Teams
!F21::OpenApplicationRaw("ahk_exe Teams.exe", A_AppData . "\..\Local\Microsoft\Teams\Update.exe --processStart Teams.exe")
; Mute
;!F22:: <already in use by mute>
; Insomnia
!F23::OpenApplication("Insomnia.exe", A_AppData . "\..\Local\insomnia\")

OpenApplication(exe, fileDirectory)
{
  OpenApplicationRaw("ahk_exe " . exe, fileDirectory . exe)
}

OpenApplicationRaw(identifier, runCommand)
{
  windowHandleIds := WinGetList(identifier)
  if (windowHandleIds.length !== 0) {

    ; select second window in list ...
    selectWindowIndex := 2

    ; ... unless any of application's windows are not in focus, then select the first window
    if (!WinActive(identifier)) {
      selectWindowIndex := 1
    }

    ; ... unless there is only 1 window in the list, then select the first (and only) window
    if (windowHandleIds.length == 1) {
      selectWindowIndex := 1
    }

    WinActivate("ahk_id " . windowHandleIds[selectWindowIndex])
  } else {
    Run(runCommand)
    WinWait(identifier)
    WinActivate(identifier)
  }
}
