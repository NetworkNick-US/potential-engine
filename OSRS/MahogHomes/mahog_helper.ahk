#If WinActive("RuneLite")
#SingleInstance force
#include Debugger.ahk
#NoEnv
SetWorkingDir %A_ScriptDir%

global debug_value

main() {
    loop {
        what_are_we_doing()
        sleep_a_tick()
    }
}

what_are_we_doing() {
    ;check to see if we are trying to get a contract
    ImageSearch, imageX, imageY, 131, 1200, 392, 1355, *75 contract.png
	if (ErrorLevel = 0) {
		hit_three()
	}
	;check to see if we should hit continue
	ImageSearch, imageX, imageY, 1, 1234, 526, 1387, *75 continue.png
	if (ErrorLevel = 0) {
		hit_space()
	}
	;check to see if we should hit a different continue line
	ImageSearch, imageX, imageY, 1, 1234, 526, 1387, *75 continue2.png
	if (ErrorLevel = 0) {
		hit_space()
	}
	;check for the cup of tea message
	ImageSearch, imageX, imageY, 1, 1234, 526, 1387, *75 cup_of_tea.png
	if (ErrorLevel = 0) {
		hit_space()
	}
	;check if we should take the tea
	ImageSearch, imageX, imageY, 1, 1234, 526, 1387, *75 take_tea.png
	if (ErrorLevel = 0) {
		hit_one()
	}
    ;check if we should be building
	ImageSearch, imageX, imageY, 260, 328, 968, 980, *75 build.png
	if (ErrorLevel = 0) {
		hit_three()
		sleep random_three(1020,1320,1444)
	}
}

hit_three() {
    debug_value = 3
    debug("hitting 3")
    SendInput {3}
    sleep random_three(199,299,390)
}

hit_one() {
    debug_value = 1
    debug("hitting 1")
    SendInput {1}
}

hit_space() {
    debug_value = 777
    debug("hitting space")
    SendInput {space}
}

random_three(x,y,z) {
	random, Rando1, x, y
	random, Rando2, y, z
	random, Rando3, Rando1, Rando2
	return Rando3
}

sleep_a_tick() {
    sleep random_three(40,78,133)
}

7::
    main()
    return

8::reload
9::exitapp