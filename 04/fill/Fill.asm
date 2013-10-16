// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

// Put your code here.
	@8192  // number of pixels on a screen divided by 16-bit address (256 x 512 / 16)
	D=A    // D = total number of pixels
	@lastpixel
	M=D    // assigns lastpixel with value of num pixels

(LOOP)
	@SCREEN
	D=A
	@pixel 
	M=D    // D is current pixel (starts at SCREEN, then iterates each loop)
	@i     // i refers to some mem. location
	M=0    // i=0
	@KBD
	D=M    // D=keyboard input
	@COLORWHITE
	D;JEQ  // if no keyboard input, then skip to COLORWHITE

(COLORBLACK)	
	@color
	M=-1   // change color to black (-1)

	@pixel
	D=M    // D is current pixel (starts at SCREEN, then iterates each loop)
	A=D    // address = D
	M=-1   // sets current address equal to -1 (black)
	@pixel
	M=M+1  // current pixel will iterate by i
	
	@i
	M=M+1  // i=i+1 - iterates each loop
	D=M
	@lastpixel
	D=M-D  // D is difference between lastpixel and i
	@LOOP
	D;JLE  // If(run out of pixels): < = 0 goto LOOP 
	
	@KBD
	D=M    // D=keyboard input
	@COLORBLACK
	D;JGT  // if keyboard input, goto COLORBLACK

// this code only gets executed when switching from Black to White	
	@SCREEN 
	D=A
	@pixel // reset pixel
	M=D    // D is current pixel (starts at SCREEN, then iterates each loop)

(COLORWHITE)
	@color
	M=0    // sets current color equal to 0 (white)
	
	@pixel
	D=M    // D is current pixel (starts at SCREEN, then iterates each loop)
	A=D    // address = D
	M=0    // sets current address equal to 0 (white)	
	@pixel
	M=M+1  // current pixel will iterate by i

	@i
	M=M+1  // i=i+1 - iterates each loop
	D=M
	@lastpixel
	D=M-D  // D is difference between lastpixel and i
	@LOOP
	D;JLE  // If(run out of pixels): < = 0 goto LOOP 
	
	@KBD
	D=M    // D=keyboard input
	@LOOP
	D;JNE  // if keyboard input, goto LOOP
	@COLORWHITE
	0;JMP  // Goto COLORBLACK
