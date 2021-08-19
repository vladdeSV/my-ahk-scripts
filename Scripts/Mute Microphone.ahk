#SingleInstance force
#Warn

!F22::{

    options := [
        ['Discord.exe', '{Ctrl down}{Shift down}{NumpadMult}{Shift up}{Ctrl up}'],
        ['Teams.exe', '{Ctrl down}{Shift down}m{Shift up}{Ctrl up}', true],
    ]

    Mute(options)
}

/**
 * @var options [string, string, integer][]
 */
Mute(options) {

    windowIds := WinGetList()

    outer:
    for (windowId in windowIds) {

        windowExecutableName := WinGetProcessName(windowId)

        for (option in options) {
            windowExecutabe := option[1]
            commands := option[2]
            activateWindow := option.has(3) ? option[3] : false

            if(windowExecutableName != windowExecutabe) {
                continue
            }

            if (activateWindow) {
                WinActivate("ahk_id " . windowId)
            }

            SendInput(commands)
            break outer
        }
    }
}
