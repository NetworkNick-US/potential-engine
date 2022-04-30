#SingleInstance Force


main() {
    SendInput U
    sleep random_three_call(66,126,190)
    SendInput Y
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
F5::reload
F6::exitapp