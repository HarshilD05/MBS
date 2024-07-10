; 2's Compliment
.MODEL small
.data 
x db 5CH

.code
;Initialise data Segment
MOV AX,@data
MOV DS,AX

MOV AL, a
NOT AL
ADD AL, 1

; Code to Print in Terminal
MOV BL, AL
MOV CL, 04	;NUmber of bits in nibble
MOV CH, 02	; number of nibbles in 1 byte

I2 : ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE I4
ADD DL, 07

I4 : ADD DL, 30H

;Interrupt to display in terminal
MOV AH, 02
INT 21H

DEC CH
JNZ I2

;interrupt to terminate program
MOV AH, 4CH
INT 21H

end