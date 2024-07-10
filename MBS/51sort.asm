; Program to implement Bubble sort in 8086 ascending order

.MODEL small
.data 
arr db 04, 03, 07, 02
count db 04
temp_count db 04

str1 db 'Sorted Array : $'

.code 
; Initialize data segment
MOV AX, @data
MOV DS, AX

;Counter
MOV CH, count	; number of parses

parse : 
MOV CL, CH	
DEC CL	; number of itterations in 1 parse
LEA SI, arr

top : 
MOV AL, [SI]	; stroring arr[i] in AL
MOV BX, SI
INC BX
MOV AH, [BX]	; Storing arr[i+1] in AH

CMP AL, AH		
JBE lesser		; if AL smaller than AH dont change
; for descending change above line to JAE since this will not exchange if AL >= AH
XCHG [SI],[BX]

lesser : 

INC SI
DEC CL
JNZ top

DEC CH
JNZ parse



; Printing Sorted Array
LEA DX, str1
MOV AH, 09	; Printing String
INT 21H

; Printing Values
LEA SI, arr

nxtdata : 
MOV CL, 04	; bits in nibble
MOV CH, 02	; nibbles in BYTE


MOV BL, [SI]

nxtnib : 
ROL BL, CL
MOV DL, BL
AND DL, 0FH
CMP DL, 09

JBE char
ADD DL, 07
char : 
ADD DL, 30H

MOV AH, 02	; printing data in DL
INT 21H

DEC CH
JNZ nxtnib

; Priniting Space
MOV DL, 20H	
MOV AH, 02
INT 21H

; Going to next data value
MOV CL, temp_count
DEC CL
MOV temp_count, CL
INC SI
CMP CL, 0
JNZ nxtdata

; Terminataing Program
MOV AH, 4CH
INT 21H

end