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
	M=1    // i=1

(LOOP)
	@KBM
	D=M    // D=keyboard input
	@LOOP2
	D;JGT  // If(keyboard input) goto LOOP2

(LOOP2)
	@i
	D=M    // D=i
	@pixels // number of pixels on a screen (256x512)
	A=131072
	@pixels
	D=D-A  // D=i-number of pixels
	@LOOP
	D;JGT  // If(i-R1) > 0 goto LOOP
	@SCREEN
	M=i    // Color each pixel black
	@i
	M=M+1  // i=i+1
	@LOOP2
	0;JMP  // Goto LOOP2