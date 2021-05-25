        org     100h

        section .text

        XOR SI, SI                          
        XOR DI, DI
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX
        XOR AX, AX

        MOV     BP, array     
        CALL    movediv        

        int     20h

        section .data

array db      05,03,04,08,05,04,03,01,02,10    
len     equ     $-array   
divisor equ        02

movediv:
        MOV     BL, divisor       
for:  
        CMP     SI,len
        JE      end

        MOV     AL, [BP+SI]
        MOV     BH,AL
        DIV     BL
        INC     SI

        CMP     AH, 0
        JE      is_even
        JNE     is_odd
        

is_even:
        MOV     DI, CX    
        MOV     [300h+ DI], BH
        INC     DI
        MOV     CX, DI   
        jmp     for

is_odd:
        MOV     DI, DX    
        MOV     [320h+DI], BH
        INC     DI
        MOV     DX, DI   
        jmp     for

end:    
        ret  

        