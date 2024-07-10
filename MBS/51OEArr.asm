; Program to Segregate Odd and even number of an array 
.MODEL small
.data
arr db 01, 02, 04, 07, 09
count db 5

str1 db 'Odd Array : $'
odd_arr db 5 DUP[0]
odd_size dw 0

str2 db 'Even Array : $'
eve_arr db 5 DUP[0]
eve_size dw 0

.code
; Initialize data segment
MOV AX, @data
MOV DS, AX
MOV ES, DS		; Making ES and DS same so that SI and DI can work in data segment

; Loading SI with aray
LEA SI, arr

top : 
MOV AL, [SI]
MOV DL, AL
AND DL, 01	; extracting last bit of the number
JZ eve		; if 0 then even else Odd

; Adding number to Odd aray
LEA DI, odd_arr	; getting Odd Array in DI
MOV CX, odd_size
ADD DI, CX		; Adjusting offset
MOV [DI], AL		; Stoing odd number
INC CX
MOV odd_size, CX	; counter for odd array updated
JMP nxtElement

eve : 	; Adding number to evne Array
LEA DI, eve_arr	; Getting even array in DI
MOV CX, eve_size	
ADD DI, CX		; Adjusting Offset
MOV [DI], AL		; Moving data
INC CX
MOV eve_size, CX	; counter for even array updated

nxtElement : 
INC SI
MOV CL, count
DEC CL
MOV count, CL
CMP CL, 0
JNZ top



; printing Odd Array
LEA DX, str1
MOV AH, 09	; priniting string
INT 21H

LEA SI, odd_arr	; loading odd array in SI

pODD : 
MOV BL, [SI]
MOV CL, 04	; bits in nibble
MOV CH, 02	; nibbles in BYTE

back1 : 
ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE char1
ADD DL, 07
char1 : 
ADD DL, 30H

MOV AH, 02	; Printing DL nibble
INT 21H

DEC CH
JNZ back1

; printing Space
MOV DL, 20H
MOV AH, 02
INT 21H

; Checking odd Counter
INC SI
MOV CX, odd_size
DEC CX
MOV odd_size, CX
CMP CX, 0
JNZ pODD


; Printing Even Array
MOV DL, 0AH		; Printing a new line
MOV AH, 02
INT 21H

LEA DX, str2
MOV AH, 09	; printing string
INT 21H

LEA SI, eve_arr	; Loading even array in SI
pEVE : 

MOV BL, [SI]
MOV CL, 04	; bits in nibble
MOV CH, 02	; nibbles in BYTE

back2 : 
ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE char2
ADD DL, 07
char2 : 
ADD DL, 30H

MOV AH, 02	; Printing DL nibble
INT 21H

DEC CH
JNZ back2

; printing Space
MOV DL, 20H
MOV AH, 02
INT 21H


; Checking evenCounter
INC SI
MOV CX, eve_size
DEC CX
MOV eve_size, CX
CMP CX, 0
JNZ pEVE




; Terminating Program
MOV AH, 4CH
INT 21H

end