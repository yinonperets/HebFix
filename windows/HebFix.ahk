#Requires AutoHotkey v2.0
#SingleInstance Force
; HebFix for Windows: select text, press Ctrl+Alt+H. EN<->HE (standard Hebrew layout).

en := "qwertyuiopasdfghjkl;'zxcvbnm,./"
he := "/'קראטוןםפשדגכעיחלךף,זסבהנמצתץ."
toHe := Map(), toEn := Map()
Loop StrLen(en) {
    toHe[SubStr(en, A_Index, 1)] := SubStr(he, A_Index, 1)
    toEn[SubStr(he, A_Index, 1)] := SubStr(en, A_Index, 1)
}

Convert(s) {
    m := RegExMatch(s, "[\x{05D0}-\x{05EA}]") ? toEn : toHe
    out := ""
    Loop Parse s
        out .= m.Has(A_LoopField) ? m[A_LoopField] : A_LoopField
    return out
}

A_IconTip := "HebFix (Ctrl+Alt+H)"

^!h:: {
    KeyWait "Ctrl"
    KeyWait "Alt"
    saved := ClipboardAll()
    A_Clipboard := ""
    Send "^c"
    if !ClipWait(0.5) {
        A_Clipboard := saved
        return
    }
    A_Clipboard := Convert(A_Clipboard)
    Send "^v"
    Sleep 300
    A_Clipboard := saved
}
