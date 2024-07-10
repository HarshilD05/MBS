; Code to Search an element from an array and returning index
.MODEL small
.data
arr db 03, 05, 07, 0AH, 11
n db 5
x db 1
str1 db "Number Not Found...$"
str2 db "Number found at Pos : $"

.code
MOV AX, @data
MOV DS, AX

; Setup
LEA SI, arr
MOV CL, n	; Counter
MOV CH, 0	; index
MOV DL, x	; number to search


; Searching
loop : MOV AL, [SI]
CMP DL, AL
JZ found
DEC CL
INC CH
INC SI
JNZ loop

; If not found printing str1
LEA DX, str1
MOV AH, 09	; Interrupt to print string
INT 21H
JMP fin	; goto end

found : 
; Printing index if number found
MOV DX, str2
MOV AH, 09	; printing string
INT 21H

; Printing index value
MOV BL, CH	; moving data to BL
MOV CL, 04	; Number of bits in nibble
MOV CH, 02	; number of nibbles in 1 byte

I2 : ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE I4
ADD DL, 07

I4 : ADD DL, 30H
; Interput to print digit
MOV AH, 02
INT 21H

DEC CH
JNZ I2 



fin : 
; terminating program
MOV AH, 4CH
INT 21H

end
