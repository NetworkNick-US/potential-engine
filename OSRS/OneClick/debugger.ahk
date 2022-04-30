debug(msgs) {
    FileAppend, %A_TickCount% %msgs% %debugVALUE% `n, D:\Documents\AHK Scripts\Debug\RC-DEBUG.txt
}