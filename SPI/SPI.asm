		PROCESSOR P16F887
		INCLUDE <P16F887.INC>
		__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
		__CONFIG _CONFIG2, (_WRT_OFF &_BOR40V)

DCounter1 EQU 0X0C
DCounter2 EQU 0X0D
DatosOut  EQU 0x21
DatosIn	  EQU 0x22

		ORG			0x00
		;-----MAESTRO
		BANKSEL		ANSEL
		;MOVLW		0x01		;Configurando ADC AN0
		CLRF		ANSEL
		CLRF		ANSELH
		
		;BANCO 1
		BANKSEL		TRISA
		;MOVLW		0x70
		;MOVWF		OSCCON		;Cambiar la frecuencia PWM
		;CLRF		ADCON1		;Justificacion izquierda ADC
		;MOVLW		0xBF
		;MOVWF		PR2			;Periodo de PWM
		;MOVLW		b'00000000'	;Entrada AN0, Salida SPI-SS
		CLRF		TRISA
		CLRF		TRISB		;Salida de LEDS
		;MOVLW		b'00000000'	;Salida PWM, Configuracion pines SPI
		;MOVWF		TRISC
		BCF			TRISC,3          ;CLK is output
   		BCF 		TRISC,5          ;SDO is output
		MOVLW		0xFF
		MOVWF		TRISD
		CLRF		TRISE
		MOVLW		0x00
		MOVWF		SSPCON2
		MOVLW		0xC0
		MOVWF		SSPSTAT------------------------BANCO 0-------------------------
		MOVLW		0x
		MOVLW		0x10
		MOVWF		SSPCON
        BSF     	PORTA,RA5

C_P     CALL		R10MS
		MOVF	 	PORTD,W			;Lectura de puertoD
		;MOVLW		0x43
		MOVWF		DatosOut
		CALL		SEND
		MOVF		DatosIn,W
		MOVWF		PORTB			;Lectura de 
		GOTO		C_P
		
SEND	BCF			PORTA,RA5
		MOVF		DatosOut,W
		MOVWF		SSPBUF
		BANKSEL		TRISA
ENV		BTFSS		SSPSTAT,BF
		GOTO		ENV
		BANKSEL		PORTA
		MOVF		SSPBUF,W
		MOVWF		DatosIn
		BSF			PORTA,RA5
		CALL		R10MS
		RETURN
		
		
R10MS
		MOVLW 0Xfa
		MOVWF DCounter1
		MOVLW 0X0d
		MOVWF DCounter2
LOOP
		DECFSZ DCounter1, 1
		GOTO LOOP
		DECFSZ DCounter2, 1
		GOTO LOOP
		RETURN	
		END
