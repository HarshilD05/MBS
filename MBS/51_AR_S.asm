; Summation of numbers in an array
.MODEL small
.data
arr db 80H,56H,23H,07,16H
count db 5

.code
MOV AX, @data
MOV DS, AX

MOV CL, count	; getting count in CL reg
LEA SI, arr	; getting base address of arr
MOV BL, 0	; clearing BL to store sum

r : MOV AL, [SI]	; moving arr value to AL
ADD BL, AL	; Sumation

INC SI
DEC CL
JNZ rep

; code to print in terminal
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
 