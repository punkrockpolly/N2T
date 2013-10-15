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
	@pixel 
	M=D    // D is current pixel (starts at SCREEN, then iterates each loop)
	@8192  // number of pixels on a screen divided by 16-bit address (256 x 512 / 16)
	D=A    // D = total number of pixels
	@lastpixel
	M=D    // assigns lastpixel with value of num pixels

(LOOP)
	@i     // i refers to some mem. location
	M=0    // i=0
	@KBD
	D=M    // D=keyboard input
	@color
	M=0
	@COLORLOOP
	D;JEQ  // if no keyboard input, then skip to COLORLOOP
	@color
	M=-1   // otherwise, change color to black (-1)

(COLORLOOP)
	@lastpixel
	D=M    // D is the last pixel
	@i
	D=D-M  // D is lastpixel - iteration
	@LOOP
	D;JLE  // If(run out of pixels): < = 0 goto LOOP		
	
	@i
	M=M+1  // i=i+1 - iterates each loop
	D=M
	@pixel
	M=M+1  // iterates pixel

	@color
	D=M
	@WHITE
	D;JEQ  // If color is white, jump to WHITE
	@BLACK
	D;JNE  // otherwise, jump to BLACK

(BLACK)
	@pixel
	D=M    // D is current pixel (starts at SCREEN, then iterates each loop)
	A=D    // address = D
	M=-1   // sets current address equal to -1 (black)
	@LOOP
	0;JMP  // Goto LOOP

(WHITE)
	@pixel
	D=M    // D is current pixel (starts at SCREEN, then iterates each loop)
	A=D    // address = D
	M=-1   // sets current address equal to 0 (white)
	@LOOP
	0;JMP  // Goto LOOP

