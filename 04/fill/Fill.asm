// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
	@SCREEN
	D=A
	@addr
	M=D

(LOOP)
	@i     // i refers to some mem. location
	M=0    // i=0
	@KBD
	D=M    // D=keyboard input
	@COLORLOOP
	D;JGT  // If(keyboard input) goto COLORLOOP
	@LOOP
	0;JMP  // Goto LOOP

(COLORLOOP)	
	@i
	D=M    // D=i
	@8192  // number of pixels on a screen divided by 16-bit address (256 x 512 / 16)
	D=D-A  // D=i-number of pixels
	@LOOP
	D;JGT  // If(i-R1) > 0 goto LOOP	
	@SCREEN
	D=A
	@i
	D=D+M
	@addr
	A=M
	M=D
	M=-1   // Color each pixel black
	
	@i
	M=M+1  // i=i+1 - iterate during keyboard input
	@KBD
	D=M    // D=keyboard input
	@COLORLOOP
	D;JGT  // If(keyboard input) goto COLORLOOP
	
	@LOOP
	0;JMP  // Goto LOOP
