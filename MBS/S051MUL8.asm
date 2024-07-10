.MODEL small
.data
a db 05H
b db 07H

.code
MOV AX, @data
MOV DS, AX

MOV AX, 0000H

MOV AL, a
MOV BL, b
MUL BL

; Code to display in Terminal
MOV CL, 04H
MOV CH, 02H
MOV BH, AL

I2: 
ROL BH, CL
MOV DL, BH
AND DL, 0FH
CMP DL, 09
JBE I4
ADD DL, 07H

I4 : 
ADD DL, 30H

; Interupt to Display in Terminal
MOV AH, 02H
INT 21H

DEC CH
JNZ I2

; Interupt to Terminate Program
MOV AH, 4CH
INT 21H

end




