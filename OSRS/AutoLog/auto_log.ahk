#If WinActive("RuneLite")
#SingleInstance force
#include Debugger.ahk
#NoEnv
SetWorkingDir %A_ScriptDir%

main() {
    SendInput {f5}
    sleep_tiny()
    move_your_mouse()
    Click
}

move_your_mouse() {
    X := random_three(1270,1313,1360)
    Y := random_three(1317,1326,1343)
    MouseMove, X, Y
}

random_three(x,y,z) {
	random, Rando1, x, y
	random, Rando2, y, z
	random, Rando3, Rando1, Rando2
	return Rando3
}

sleep_tiny() {
    sleep random_three(40,60,99)
}

XButton1::
  main()
  return

XButton2::
  main()
  return

8::reload
9::exitapp