			
MUESTRA
			MOVLW		.50
			MOVWF		VER
AQUI
			MOVLW		0X01
			MOVWF		PORTB
			MOVF		C1,W
			MOVWF		PORTC
			CALL		RETARDO

			MOVLW		0X02  
			MOVWF		PORTB
			MOVF		C2,W
			MOVWF		PORTC
			CALL		RETARDO

			MOVLW		0X04
			MOVWF		PORTB
			MOVF		C3,W
			MOVWF		PORTC
			CALL		RETARDO

			MOVLW		0X08
			MOVWF		PORTB
			MOVF		C4,W
			MOVWF		PORTC
			CALL		RETARDO


			MOVLW		0X10
			MOVWF		PORTB
			MOVF		C5,W
			MOVWF		PORTC
			CALL		RETARDO

			MOVLW		0X20
			MOVWF		PORTB
			MOVF		C6,W
			MOVWF		PORTC
			CALL		RETARDO


			MOVLW		0X40
			MOVWF		PORTB
			MOVF		C7,W
			MOVWF		PORTC
			CALL		RETARDO

			MOVLW		0X80
			MOVWF		PORTB
			MOVF		C8,W
			MOVWF		PORTC
			CALL		RETARDO

			DECFSZ		VER,F
			GOTO		AQUI

			RETURN