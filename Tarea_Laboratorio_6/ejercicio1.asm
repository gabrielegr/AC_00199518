
		org 	100h

		section	.text

	
		mov 	DX, startmsg
		call  	EscribirCadena

		call  	LeerCadena

		call 	Comparar

		int 	20h

	section	.data

startmsg	db	"Ingrese la contrasenia ", "$"
msgcorrect 	db 	"Correcto", "$"
msgwrong 	db 	"Incorrecto", "$"	
pass		db  "passw", "$"


EsperarTecla:
        mov     AH, 01h         
        int     21h
        ret

LeerCadena:
        xor     SI, SI          
while:  
        call    EsperarTecla    
        cmp     AL, 0x0D        
        je      exit            
        mov     [BP+SI], AL   	
        inc     SI              
        jmp     while      

exit:
		mov 	byte [BP+SI], "$"		
    	ret


EscribirCadena:
        mov 	AH, 09h
		int 	21h
		ret

Comparar:
		xor     SI, SI 
whileCompare:		
		call    EsperarTecla  
		mov 	AL, [BP+SI]
        cmp     [pass+SI], AL        
        jne     Escribirincorrecto              
		cmp 	SI, 4
		je  	Escribircorrecto
        inc     SI              
        jmp     whileCompare

Escribircorrecto: 
		mov 	DX, msgcorrect
		call	EscribirCadena
		ret

Escribirincorrecto: 
		mov 	DX, msgwrong
		call 	EscribirCadena	
		ret
		