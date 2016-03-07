#To print a character to the screen

MOVADDR return INTO VGA_DRIVER.Exit[1]
MOV8 $char INTO VGA_DRIVER.Char
LOD N_[0]
JMP VGA_DRIVER.Entry
return:
NOP 0


#To "print a newline", i.e. fill the rest of the line with spaces:
MOVADDR return INTO VGA_DRIVER.Exit[1]
LOD N_[0]
JMP VGA_DRIVER.EntryNewLine
return:
NOP 0


#To clear the screen (may be very slow)
MOVADDR return INTO VGA_DRIVER.Exit[1]
LOD N_[0]
JMP VGA_DRIVER.EntryClearScreen
return:
NOP 0
