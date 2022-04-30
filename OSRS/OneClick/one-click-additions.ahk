#SingleInstance force
#include Debugger.ahk

global original_app, debugVALUE


main() {
    ;get original active window/mouse position
    original_app := WinExist("A")
    MouseGetPos, original_x, original_y

    ;open the game client
    WinActivate, ahk_exe OpenOSRS.exe

    ;move the mouse somewhere on the client window
    WinGetPos, X, Y, Width, Height, ahk_exe OpenOSRS.exe
    new_x := random_three_call(10, Width-500, Width-60)
    new_y := random_three_call(11, Height-260, Height-59)
    MouseMove, new_x, new_y

    ;Sleep a short/random period of time and click
    sleep random_three_call(129,233,591)
    Click

    sleep random_three_call(66,155,399)
    ;open the original window that was active and return the mouse back to it's original location
    WinActivate, ahk_id %original_app%
    MouseMove, original_x, original_y
}


random_three_call(x,y,z) {
	random, Random1, x, y
	random, Random2, y, z
	random, Random3, Random1, Random2
	return Random3
}


F3::
main()
return
F8::reload
F9::exitapp