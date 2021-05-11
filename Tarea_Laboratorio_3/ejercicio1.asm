org 100h

section .text

        XOR AX, AX
        XOR BX, BX
        XOR SI, SI
        MOV BL, 8D           
        MOV word CX, 8D      
        MOV SI, 00       
        MOV byte [0200h], 00  
        MOV byte [0201h], 00
        MOV byte [0202h], 01
        MOV byte [0203h], 09
        MOV byte [0204h], 09
        MOV byte [0205h], 05
        MOV byte [0206h], 01
        MOV byte [0207h], 08                        

        jmp iterate          


iterate:
        ADD AL, [0200h + SI]
        INC SI
        LOOP iterate
divide:
        DIV BL
        MOV [020Ah], AL
        jmp exit

exit:
        int 20h
