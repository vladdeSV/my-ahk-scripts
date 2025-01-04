#Requires AutoHotkey v2.0

^+Enter::
{
    window := WinExist("A")
    if WinGetMinMax(window) = 1
        WinRestore(window)
    else
        WinMaximize(window)
}
