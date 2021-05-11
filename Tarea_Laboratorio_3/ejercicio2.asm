org 100h

section .text

        XOR AX, AX
        XOR CX, CX
        MOV AL, 1d
        MOV CL, 5d 
        CMP CL, 00       
        JZ jump

condic      MUL CX 
        LOOP condic 

jump       MOV [020Bh], CL

        int 20h