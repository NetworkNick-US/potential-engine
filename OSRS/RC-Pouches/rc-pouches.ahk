#If WinActive("RuneLite")
#SingleInstance force
#include Debugger.ahk

global StartTime, debugVALUE, mouseX, mouseY, ElapsedTime

main() {
  MouseGetPos, mouseX, mouseY

  loop 3 {
    ;move to inventory slot #1 1248,1123... x variation can't exceed 14, y variation can't exceed 12
    newX := random_three_call(1248-11, 1248, 1248+10)
    newY := random_three_call(1123-10, 1123, 1123+10)
    move_mouse(newX,newY)
    Click

    ;set starting time after clicking pouch
    StartTime := A_TickCount

    ;move back to stored mouse position (altar) +/- 10 px and click
    returnX := random_three_call(mouseX-60, mouseX, mouseX+60)
    returnY := random_three_call(mouseY-47, mouseY, mouseY+47)
    move_mouse(returnX,returnY)
    Click

    ;make sure to wait at least 600ms since StartTime was defined
    tick_timer()
  }

  sleep random_three_call(311,599,891)
}

move_mouse(NX, NY, Dev:=1){
    ;Complex movement to add subtle variation to the exact location to be clicked
    Loop
    {
        Random, X, -1.0, 1.0
        Random, Y, -1.0, 1.0
        W := X ** 2 + Y ** 2
	} Until W < 1
	W := Sqrt((-2 * Log(W)) / W)
	X := Dev * X * W
	Y := Dev * Y * W

    X := X + NX
    Y := Y + NY
    MouseMove X, Y
    return
}

random_three_call(x,y,z) {
	random, Rando1, x, y
	random, Rando2, y, z
	random, Rando3, Rando1, Rando2
	return Rando3
}

tick_timer() {
    ElapsedTime := A_TickCount - StartTime
    NeedSleep := 600 - ElapsedTime
    sleep random_three_call(NeedSleep+40,NeedSleep+151,NeedSleep+212)
    StartTime := A_TickCount
}

q::
main()
return
F8::reload
F9::exitapp