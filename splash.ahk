;#If WinActive("OpenOSRS")
#SingleInstance Force
#NoEnv
SetWorkingDir %A_ScriptDir%

determineAntiban2() {
	pickSide := rand3(1,5,7)
	addAntiban := rand3(1,5,6)
	if (pickSide <= 4) {
		sendSpace()
	}
	else {
		sendBackspace()
	}

	if (addAntiban <= 3) {
		startingSleep := rand3(20000,32500,60000)
		sleep startingSleep
		arrowRotator()
	}
}

determineSleep() {
	betweenAntiban := rand3(300000,500000,600000)
	sleep betweenAntiban
}

sendBackspace() {
	SendInput {backspace}
	random, doubleClick, 1, 7
	if (doubleClick = 1) { ;hit backspace a second time
		microSleep := rand3(10,30,99)
		sleep microSleep
		SendInput {backspace}
	}
	else if (doubleClick = 7) { ;hit backspace for a second and third time
		loop 2 { ;hit backspace for a second and third time
			microSleep := rand3(10,30,99)
			sleep microSleep
			SendInput {backspace}
		}
	}
}

sendSpace() {
	SendInput {space}
	random, doubleClick, 1, 15
	if (doubleClick <= 2) { ;triple send space
		loop 2 {
			microSleep := rand3(30,111,300)
			sleep microSleep
			SendInput {space}
		}
	}
	else if (doubleClick <= 5) { ;send space twice
		microSleep := rand3(20,81,130)
		sleep microSleep
		SendInput {space}
	}
}

arrowRotator() {
	random, orderOfOp, 1, 2
	if (orderOfOp = 1){
		Send {Left down}
		determineDown := rand3(120,355,555)
		sleep determineDown
		Send {Left up}
	}
	else if (orderOfOp = 2) {
		Send {right down}
		determineDown := rand3(222,315,667)
		sleep determineDown
		Send {right up}
	}
}


rand3(x,y,z) {
	random, value1, x, y
	random, value2, y, z
	random, value3, value1, value2
	return value3
}

2::
	loop {
		sleep 1000
		determineAntiban2()
		determineSleep()
	}

9::reload
0::exitapp