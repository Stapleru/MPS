
; CSEG - внешняя память программы
; DSEG - резидентная память данных
; Пересылка DPH, DPL, TH0, TL0, TH1, TL1 в DSEG (банк 3) по адресам 18h-1Dh (18, 19, 1A, 1B, 1C, 1D)

$mod52

    ORG 0h ; Начальный адрес программы (если нет прерываний)
START:
    MOV DPH, #1h
    MOV DPL, #2h
    MOV TH0, #3h
    MOV TL0, #4h
    MOV TH1, #5h
    MOV TL1, #6h

    MOV R0, #18h

    MOV @R0, DPH
    INC R0
    MOV @R0, DPL
    INC R0
    MOV @R0, TH0
    INC R0
    MOV @R0, TL0
    INC R0
    MOV @R0, TH1
    INC R0
    MOV @R0, TL1
    INC R0

    JMP START

    END
