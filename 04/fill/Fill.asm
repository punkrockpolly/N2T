// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.

	@i     // i refers to some mem. location
	M=1    // i=0

(LOOP)
	@i
	D=M    // D=i
	@KBM
	D=M    // D=keyboard input

	@SCREEN


	@LOOP
	0;JMP  // Goto LOOP