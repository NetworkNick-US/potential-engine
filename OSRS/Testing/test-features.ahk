random_three_call(x,y,z) {
	random, Random1, x, y
	random, Random2, y, z
	random, Random3, Random1, Random2
	return Random3
}

1::
;
;ActiveHwnd := WinExist("A")
;MsgBox, %ActiveHwnd%
;WinActivate, ahk_id %ActiveHwnd%
;WinGetPos,X,Y,Width,Height
;MsgBox, The active window is at %X%, %Y%, with a width/height of %Width%,%Height%
WinActivate, ahk_exe OpenOSRS.exe
    WinGetPos, X, Y, Width, Height, ahk_exe OpenOSRS.exe
    MsgBox, OSRS is at %X%, %Y%, with a width/height of %Width%,%Height%
    new_x := random_three_call(10, Width-500, Width-60)
    new_y := random_three_call(11, Height-260, Height-59)
    MouseMove, new_x, new_y
return
2::reload
3::exitapp