// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[3], respectively.)

// Put your code here.

// M refers to the memory location addressed by A, namely, to Memory[A]
// @3 D=M means D=Memory[3]

	@i     // i refers to some mem. location
	M=1    // i=0
	@R2
	M=0    //R2=0

(LOOP)
// loop will increment i until R1 = i
// each loop, R2 will increment by the value of R0
// by the end of the loops, R2 will equal R1 * R0

	@i
	D=M    // D=i
	@R1
	D=D-M  // D=i-value of R1
	@END
	D;JGT  // If(i-R1) > 0 goto END
	@R0
	D=M    // D=R0
	@R2
	M=D+M  // R2=R0+R2 (adds R0)
	@i
	M=M+1  // i=i+1
	@LOOP
	0;JMP  // Goto LOOP

(END)
	@END
	0;JMP  // Infinite loop