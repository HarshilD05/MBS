; Code to add inflamation of 20% to array values

.MODEL small
.data
arr db 56H,05,07,08
count db 4

.code
MOV AX, @data
MOV DS, AX

LEA SI, arr
MOV DH, count
MOV BL, 0

r : MOV BL, [SI]
MOV AL, BL
MOV AH, 0

MOV BH, 05
DIV BH
ADD BL, AL

MOV [SI], BL

;Code to print in terminal
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

;printing space after number
MOV DL, 20H
MOV AH, 02
INT 21H

;looping through array
INC SI
DEC DH
JNZ r

; Interrupt to terminate Program
MOV AH, 4CH
INT 21H

end

