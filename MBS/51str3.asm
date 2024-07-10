; Exchanging Blocks Using String Instruction

.MODEL small
.data
arr1 db 01, 02, 03, 04, 05
str1 db 'Array1 : $'
arr2 db 06, 07, 08, 09, 02
str2 db 'Array2 : $'
count dw 0005
tempCount db 05

tempBlock db 5 DUP(0)

.code
; Initialise data and extra segment
MOV AX, @data
MOV DS, AX
MOV ES, AX	; ES = DS
CLD	; Auto Increment

; Initialise pointers to move data from 
; Array 1 to tempBlock
LEA SI, arr1
LEA DI, tempBlock
MOV CX, count
rep MOVSB

; SET Pointers to move data from 
; Array2 to Array 1
LEA SI, arr2
LEA DI, arr1
MOV CX, count
rep MOVSB

; set pointers to move data from 
;tempBlock to Array2
LEA SI, tempBlock
LEA DI, arr2
MOV CX, count
rep MOVSB




; Printing Array 1
LEA DX, str1
MOV AH, 09	; Printing String
INT 21H

; Pritnting Data values
LEA SI, arr1

top1 : MOV BL, [SI]
MOV CL, 04 	; bits in nibble
MOV CH, 02	; nibbles in BYTE

back1 : ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE char1
ADD DL, 07
char1 : ADD DL, 30H

MOV AH, 02 	; Printing DL data
INT 21H

DEC CH	; For next nibble
JNZ back1

MOV DL, 20H	; printing Space
INT 21H

; Next Element
MOV CL, tempCount
DEC CL
MOV tempCount, CL  ; Updating counter for remaining elements
INC SI
CMP CL, 0
JNZ top1


; Printing Array 2
MOV DL, 0AH	; printing new line
MOV AH, 02
INT 21H

LEA DX, str2
MOV AH, 09	; Printing String
INT 21H

; refreshing Counter
MOV CX, count
MOV tempCount, CL

; Pritnting Data values
LEA SI, arr2

top2 : MOV BL, [SI]
MOV CL, 04 	; bits in nibble
MOV CH, 02	; nibbles in BYTE

back2 : ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09
JBE char2
ADD DL, 07
char2 : ADD DL, 30H

MOV AH, 02 	; Printing DL data
INT 21H

DEC CH	; For next nibble
JNZ back2

MOV DL, 20H	; printing Space
INT 21H

; Next Element
MOV CL, tempCount
DEC CL
MOV tempCount, CL  ; Updating counter for remaining elements
INC SI
CMP CL, 0
JNZ top2



; Terminating Program
MOV AH, 4CH
INT 21H
end 