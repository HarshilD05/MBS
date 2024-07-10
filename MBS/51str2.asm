; Program to Implement String Instruction 
; Searching in an array

.MODEL small
.data
arr db 01, 03, 05, 07, 09
count dw 0005
x db 04
str1 db 'NOT Found! $'
str2 db 'Found at Index : $'


.code
; Initialise data segment
MOV AX, @data
MOV DS, AX
MOV ES, AX	; ES = DS

; Initialising Pointers and counters
LEA DI, arr
MOV CX, count
CLD	; auto Increment

MOV AL, x	; number to search
repne SCASB	; repeat till not equal

DEC DI
MOV AH, [DI]
CMP AH, AL
JZ found


; if not found
LEA DX, str1
MOV AH, 09	; printing  string
INT 21H
JMP finish


; If found
found : 
LEA DX, str2
MOV AH, 09	; printing string
INT 21H

MOV DX, count
SUB DX, CX
DEC DX		; indexing from 0 onwards

; print DL Value
MOV BL, DL
MOV CL, 04	; bits in nibble
MOV CH, 02	; nibbles in BYTE

back : 
ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE char
ADD DL, 07
char : ADD DL, 30H

MOV AH, 02	; printing DL nibble
INT 21H

DEC CH
JNZ back



finish : 
; Terminating Program
MOV AH, 4CH
INT 21H

end