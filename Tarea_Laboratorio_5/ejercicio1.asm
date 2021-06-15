org 100h

    section .text

    xor AX, AX
    xor SI, SI
    xor BX, BX
    XOR CX, CX
    xor DX, DX
    XOR CL, CL
    MOV SI, 0
    MOV DI, 0
    MOV DH, 2
    MOV DL, 4
    MOV byte[200h], 4
    MOV byte[201h], 6
    MOV byte[202h], 8

    call videomode

    firstname: 
        call writechar
        CMP SI, 8 
        JB firstname
        call enter
        jmp secondname


    secondname:
        MOV DH, [200h] 
        call writechar
        CMP SI,8 
        JB secondname
        call enter
        jmp firstlastname


    firstlastname:
        MOV DH, [201h] 
        call writechar
        CMP SI,9 
        JB firstlastname
        call enter
        jmp secondlastname

    secondlastname:
        MOV DH, [202h] 
        call writechar
        CMP SI,10  
        JB secondlastname
        call enter
        MOV AH, 00h 
        INT 16h
        INT 20h


    videomode: 
        MOV AH, 00h  
        MOV AL, 00h  
        INT 10h
        RET

    writechar:
        MOV AH, 02h 
        MOV BH, 0h 
        MOV CL, [name+DI]
        INT 10h
        MOV AH, 0Ah 
        MOV AL, CL 
        MOV BH, 0h 
        MOV CX, 1h 
        INT 10h
        INC DI 
        INC DL 
        INC SI
        RET

    enter:
        MOV SI,0
        MOV DL,4
        RET    

    section .data

    name DB 'Gabriel Enrique Gonzalez Rodriguez'
