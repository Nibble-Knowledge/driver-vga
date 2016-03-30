INCL vgadriver.s

#This program tests both the driver and the screen
#If the first line works, but things break after, the problem is
#the newline driver.
#If the second line works too, but things go weirdly wrong after,
#the problem is the screen clearing function.



Start:

MOVADDR AReturn INTO VGA_DRIVER.Exit[1]
MOV8 Zero INTO Count

FirstLoop:

MOV8 AChar INTO VGA_DRIVER.Char
LOD N_[0]
JMP VGA_DRIVER.Entry

AReturn:
INC8 Count
JMPL8 Count Sixteen TO FirstLoop

MOVADDR HReturn INTO VGA_DRIVER.Exit[1]

SecondLoop:
MOV8 HChar INTO VGA_DRIVER.Char
LOD N_[0]
JMP VGA_DRIVER.Entry

HReturn:
INC8 Count
JMPL8 Count TwentyFour TO SecondLoop

MOVADDR LReturn INTO VGA_DRIVER.Exit[1]
LOD N_[0]
JMP VGA_DRIVER.EntryNewline

LReturn:

MOVADDR SReturn INTO VGA_DRIVER.Exit[1]
MOV8 Slug INTO VGA_DRIVER.Char
LOD N_[0]
JMP VGA_DRIVER.Entry

SReturn:

MOVADDR CReturn INTO VGA_DRIVER.Exit[1]
LOD N_[0]
JMP VGA_DRIVER.EntryClearScreen

CReturn:
JMP Start



Count:	.data 2 0x00

Sixteen:	.data 2 0x10
TwentyFour:		.data 2 0x18
Zero:         .data 2 0x00

AChar:	.data 2 0x41
HChar:	.data 2 0x48
Slug:	.ascii '!'
