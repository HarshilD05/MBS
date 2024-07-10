.Model small
.data
a dw 753AH
b dw 27BCH

.code
MOV AX,@data
MOV DS, AX

MOV AX, a
MOV BX, b
ADD BX,AX

MOV CH, 04
MOV CL, 04

I2 : 	ROL BX, CL
MOV DX, BX
AND DX, 000FH
CMP DX, 09
JBE I4
ADD DX, 07

I4 : ADD DX, 30H

; Interrupt to print in terminal
MOV AH, 02
INT 21H

DEC CH
JNZ I2

; Interrupt to terminate Program
MOV AH, 4CH
INT 21H

end