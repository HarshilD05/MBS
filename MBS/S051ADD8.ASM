.MODEL small
.data
a db 05H
b db 07H

.code
MOV AX, @data
MOV DS, AX

MOV AL, a
MOV BL, b
ADD AL, BL

; Code to display in Terminal
MOV CL, 04H
MOV CH, 02H ; number of nibbles in 1 byte
MOV BH, AL

I2: 
ROL BH, CL
MOV DL, BH
AND DL, 0FH
CMP DL, 09
JBE I4
ADD DL, 07H ; if it a char(A,B,C)

I4 : 
ADD DL, 30H ; it is a number

; Interupt to Display in Terminal
MOV AH, 02H
INT 21H

DEC CH 
JNZ I2

; Interupt to Terminate Program
MOV AH, 4CH
INT 21H

end




