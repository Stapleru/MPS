$mod52
ORG 0h

START:

	MOV A, P0 ; заносим входные данные в акк
	ANL A,#0FH ; обрезаем старший тетраэдр
	MOV DPTR, #table ; указываем на таблицу
	MOVC A, @A+DPTR ; берем данные по адресу таблицы со сдвигом

	MOV P1,A ; вывод результата в П1
	JMP START ; цикл

table:
	DB 0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,000H,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH,0FFH

END