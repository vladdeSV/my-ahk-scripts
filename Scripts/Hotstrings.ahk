#Requires AutoHotkey v2.0-beta.1

:O:brg::Best regards,`nVladimirs Nordholm
:O:mvh::Med vänliga hälsningar,`nVladimirs Nordholm ; "Best regards" in Swedish
:O:_shrug::¯\_(ツ)_/¯
::_date::{
    Send A_YYYY "-" A_MM "-" A_DD
}

:::+1::👍
!.::Send("…") ; ellipsis
!-::Send("–") ; en dash
!+-::Send("—") ; em dash

; arrows
!NumpadUp::Send("↑")
!NumpadDown::Send("↓")
!NumpadLeft::Send("←")
!NumpadRight::Send("→")
