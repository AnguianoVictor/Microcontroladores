DATOS			ADDWF		PCL,F

				;-------V
				RETLW		0x00
				RETLW		0x70
				RETLW		0x08
				RETLW		0x04
				RETLW		0x02
				RETLW		0x04
				RETLW		0x08
				RETLW		0x70

				;-------I
				RETLW		0X00
				RETLW		0X42
				RETLW		0x42
				RETLW		0x7E
				RETLW		0x7E
				RETLW		0x42
				RETLW		0X42
				RETLW		0X00

				;-------C
				RETLW		0X00 ;CUENTA DESDE AQUI, GUIANDOTE DE LA ENUMERACION
				RETLW		0X7E ;PERO RESTA LO QUE ESTA COMENTADO TIPO: ;-----R
				RETLW		0X42
				RETLW		0X42
				RETLW		0X42
				RETLW		0X42
				RETLW		0X00
				RETLW		0X00  

				;-------T
				RETLW		0X00
				RETLW		0X40
				RETLW		0X40
				RETLW		0X7E
				RETLW		0X7E
				RETLW		0X40
				RETLW		0X40
				RETLW		0X00

				;-------O
				RETLW		0X00
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X42
				RETLW		0X42
				RETLW		0X7E
				RETLW		0X00
				RETLW		0X00

				;-------R
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X48
				RETLW		0X54
				RETLW		0X22
				RETLW		0X00
				RETLW		0X00
				RETLW		0X00


				RETLW		0X00    ;CUATRO ESPACIO DESPUES DE UN NOMBRE
				RETLW		0X00
				RETLW		0X00
				RETLW		0X00

				;-------R
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X48
				RETLW		0X54
				RETLW		0X22
				RETLW		0X00

				;-------A
				RETLW		0X00
				RETLW		0X00
				RETLW		0X3E
				RETLW		0X48
				RETLW		0X48
				RETLW		0X3E
				RETLW		0x00
				RETLW		0x00

				;-------M
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X60
				RETLW		0X10
				RETLW		0X60
				RETLW		0X7E
				RETLW		0x00
				RETLW		0x00

				;-------I
				RETLW		0X00
				RETLW		0X42
				RETLW		0x42
				RETLW		0x7E
				RETLW		0x7E
				RETLW		0x42
				RETLW		0X42
				RETLW		0X00

				;-------R
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X48
				RETLW		0X54
				RETLW		0X22
				RETLW		0X00
				RETLW		0X00

				;-------E
				RETLW		0X00
				RETLW		0X7E
				RETLW		0X5A
				RETLW		0X5A
				RETLW		0X42
				RETLW		0X42
				RETLW		0X00
				RETLW		0X00

				;-------Z
				RETLW		0X00
				RETLW		0X46
				RETLW		0X4A
				RETLW		0X52
				RETLW		0X62
				RETLW		0X00
				RETLW		0X00	
				
				;DOS ESPACIOS

	
				;EN ESTE CASO SON 160 LINEAS
				; 160- (19 COMENTARIOS + 1(ADDWF		PCL,F))
				;PUSE 140 EN EL CODIGO PRINCIPAL
