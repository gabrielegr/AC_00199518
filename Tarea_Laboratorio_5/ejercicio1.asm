org 100h

    section .data

    name DB 'Gabriel Enrique Gonzalez Rodriguez'

    section .text

    
    XOR SI, SI
    XOR DI, DI
    XOR AH, AH
    XOR AL, AL
    XOR BH, BH
    XOR BL, BL
    XOR CX, CX
    XOR DH, DH
    XOR DL, DL
    XOR CL, CL
    MOV DL, 4
   

    call videomode

    firstname: 
        MOV DH, 2
        call writechar
        CMP SI, 8 
        JB firstname
        call enter
        jmp secondname


    secondname:
        MOV DH, 4 
        call writechar
        CMP SI,8 
        JB secondname
        call enter
        jmp firstlastname


    firstlastname:
        MOV DH, 6 
        call writechar
        CMP SI,9 
        JB firstlastname
        call enter
        jmp secondlastname

    secondlastname:
        MOV DH, 8 
        call writechar
        CMP SI,10  
        JB secondlastname
        call enter
        MOV AH, 00h 
        INT 16h
        INT 20h


    videomode: 
        MOV AH, 00h  
        MOV AL, 03h  
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

    