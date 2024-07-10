; Program to implement string Instructions
; Moving data block

.MODEL small
.data
arr db 01, 02, 03, 05, 09
count dw 0005
dest db 5 DUP(0)


.code
; Initialising data segment
MOV AX, @data
MOV DS, AX
MOV ES, AX	; ES = DS

; Initialising Pointer and Counter
LEA SI, arr
LEA DI, dest
MOV CX, count
CLD	; Auto Increment

rep MOVSB


; Printing Destination
LEA SI, dest

element : 
MOV BL, [SI]
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

; printing space
MOV DL, 20H
INT 21H

; Next element
INC SI
MOV CX, count
DEC CX
MOV count, CX	;Updating array counter for remaining elements
CMP CX, 0
JNZ element



; Treminating Program
MOV AH, 4CH
INT 21H

end