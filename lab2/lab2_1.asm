; реализуем функцию x_1 | !(x_2 & x_3 & !x_4)
$mod52

ORG 0h

MAIN:
	MOV	A,P0 ; берем аргументы из младшей тетрады P0
	MOV	R0,A ;x1
	RR	A ;сдвиг вправо на один бит
	MOV	R1,A ;x2
	RR	A
	MOV	R2,A ;x3
	RR	A
	MOV	R3,A ;x4
; реализуем функцию x_1 | !(x_2 & x_3 & !x_4)
	MOV A,R2 ;x3
	ANL A,R1 ;x_2 & x_3
	MOV R4, A
	
	MOV A,R3 ;x4
	CPL A ;!x4
	ANL A,R4 ;x_2 & x_3 & !x_4
	CPL A ; !(x_2 & x_3 & !x_4)
	ORL A,R0 ; x_1 | !(x_2 & x_3 & !x_4)
	
	RRC		A ;сдвигает восемь бит аккумулятора и 
	;флаг переноса на один бит вправо. Содержимое флага переноса помещается
    ;на место бита 7 аккумулятора, а содержимое бита 0 аккумулятора переписывается 
	;во флаг переноса. На остальные флаги команда не воздействует.
	JC		RESULT1 ;(J)ump if (C)arry flag
	JMP		RESULT0

RESULT1:
	MOV P1, #0FFh
	JMP FINAL

RESULT0:
	MOV P1, #0b

FINAL:
	JMP MAIN

END