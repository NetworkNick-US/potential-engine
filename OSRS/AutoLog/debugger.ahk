debug(msgs) {
    FileAppend, %A_TickCount% %msgs% %debug_value% `n, D:\Documents\AHK Scripts\Debug\logout.txt
}