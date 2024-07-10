; program to determine Odd or Even Number
.MODEL small
.data
n db 0CH
str1 db 'Odd Number...$'
str2 db 'Even Number...$'

.code
; Initialize data segment
MOV AX, @data
MOV DS, AX

; getting the number in D register
MOV DL, n

; getting only the LSB of the data
AND DL, 01

; if Zero Flag set then even else odd
JZ eve

; odd Number 
MOV DX, offset str1
JMP print

eve : 
; Even Number
MOV DX, offset str2

print : 
; Printing string
MOV AH, 09
INT 21H

; Interrupt to terminate Program
MOV AH, 4CH
INT 21H

end
