#Requires AutoHotkey v2.0

F13:: OpenApplicationRaw("ahk_exe Discord.exe", A_AppData . "\..\Local\Discord\Update.exe --processStart Discord.exe")
F14::^+m ;mute discord
F15:: OpenApplication("Spotify.exe", A_AppData . "\Spotify\")
F16:: OpenApplicationRaw("ahk_exe WindowsTerminal.exe", "wt")
F17:: OpenApplication("Taskmgr.exe", A_WinDir . "\System32\")
F18:: OpenApplication("Code.exe", A_AppData . "\..\Local\Programs\Microsoft VS Code\")

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
