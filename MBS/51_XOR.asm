.Model small
.data
a db 18H	;0001 1000
b db 02H	;0000 0010 

.code
MOV AX,@data
MOV DS, AX

MOV AL, a
MOV BL, b
XOR BL,AL

MOV CH, 02
MOV CL, 04

I2 : 	ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE I4
ADD DL, 07

I4 : ADD DL, 30H

; Interrupt to print in terminal
MOV AH, 02
INT 21H

DEC CH
JNZ I2

; Interrupt to terminate Program
MOV AH, 4CH
INT 21H

end