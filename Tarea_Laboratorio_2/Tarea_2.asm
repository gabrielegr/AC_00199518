	org    200h

	section    .text

	;Asignando caracteres 
	mov     byte[200h], "G"
	mov     byte[201h], "E"
	mov     byte[202h], "G"
	mov     byte[203h], "R"

	;Copiando valor de 200h a AX usando direccionamiento directo.
	mov        AX, [200h]

	;Copiando valor de 201h a CX usando direccionamiento indirecto por registro.
	mov     BX, [201h]
	mov     CX, BX

	;Copiando valor de 202h a DX usando direccionamiento indirecto base más índice.
	mov     BP, 200h
	mov     SI, 002h
	mov     DX, [BP+SI]

	;Copiando valor de 203h a DI usando direccionamiento relativo por registro.
	mov     DI, [BP+003h]

	int    20h