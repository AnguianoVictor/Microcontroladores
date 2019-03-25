    		;Programa que lee realiza una lectura analogica en el puerto AN5(RE0) de un trimpot 
			PROCESSOR P16F887	
    		#include "p16f887.inc"
	
    		; CONFIG1
    		__CONFIG _CONFIG1,(_INTRC_OSC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
    		; CONFIG2
    		__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)
 
PasosR			Equ 0x20
PasosN			EQU 0x21
PasosAm			Equ 0x22
PasosV			EQU 0x23
PasosA			Equ 0x24
PasosM			EQU 0x25
Sensor			EQU 0x26
Dato			EQU	0x27
PasosB			EQU	0x28

CT0				EQU	0x33
Cuenta 			EQU	0x34

    			ORG	    0x00		;Vector de restauracion
    	
    			BANKSEL	ANSEL		;Banco 3
									
				BSF		ANSEL,ANS5		;Selecci?n de entrada analogica para activar
    			CLRF    ANSELH			;Se escribe 0x00 en el registro indi cado (ANSELH)	    1ciclo
    	
    			BANKSEL	ADCON1			;Banco 1
				MOVLW	0x80			;Justificaci?n a la derecha. 
				MOVWF	ADCON1
				MOVLW	0xFF
				MOVWF	TRISA	
    			CLRF    TRISB			;Limpia el registro TRISB				    1ciclo
    			CLRF    TRISC			;Limpia el registro TRISC				    1ciclo
    			CLRF    TRISD			;Limpia el registro TRISD				    1ciclo
    			BSF	    TRISE,TRISE0	;eL PIN RE0  se configura como entrada analogica
				MOVLW	0xD7
				MOVWF	OPTION_REG
				
				BANKSEL ADCON0				
				MOVLW	0xD5			;Encendido de ADC, GO apagado, Seleccion AN5, Clock interno. 
				MOVWF	ADCON0
				
				
MAIN:			CALL	SampleTime
				BSF		ADCON0,GO
				BTFSC	ADCON0,GO
				GOTO	$-1
				BANKSEL	ADRESL
				MOVF	ADRESL,W
				BANKSEL	ADRESH
				MOVWF	PORTB
				CALL	COMPARACION
				CALL	SENSOR
				CALL 	FINAL
				GOTO 	MAIN

;------------------COMPARACION--------------------------------

COMPARACION		MOVF	0xE9,W				;---- 233
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORVERDE
				MOVF	0xBA,W				;-----186					
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORNARANJA
				MOVF	0xA0,W				;----160
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORAZUL
				MOVF	0x8A,W				;----138
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORNEGRO
				MOVF	0x61,W				;----97
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORBLANCO
				MOVF	0x5B,W				;----91
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORAMARILLO
				MOVF	0x38,W				;-------56
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORMORADO
				MOVF	0x18,W				;------24
				SUBLW	Dato
				BTFSC	STATUS,C
				GOTO	COLORROJO
				RETURN



;------------------MOVIMIENTOS---------------------------------
COLORNEGRO		CALL	STOP
				GOTO	MAIN

COLORBLANCO:	MOVLW	d'9'
				MOVWF	PasosB
LOOPBLANCO:		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosB,1
				GOTO	LOOPBLANCO
				CALL	STOP
				GOTO 	MAIN

COLORROJO:		MOVLW	d'1'
				MOVWF	PasosR
LOOPROJO:		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosR,1
				GOTO	LOOPROJO
				CALL	STOP
				GOTO 	MAIN

COLORNARANJA	MOVLW	d'2'
				MOVWF	PasosN
LOOPNARANJA		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosN,1
				GOTO	LOOPNARANJA
				CALL	STOP
				GOTO 	MAIN

COLORAMARILLO	MOVLW	d'3'
				MOVWF	PasosAm
LOOPAMARILLO	MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosAm,1
				GOTO	LOOPAMARILLO
				CALL	STOP
				GOTO 	MAIN

COLORVERDE		MOVLW	d'4'
				MOVWF	PasosV
LOOPVERDE		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosV,1
				GOTO	LOOPVERDE
				CALL	STOP
				GOTO 	MAIN

COLORAZUL:		MOVLW	d'5'
				MOVWF	PasosA
LOOPAZUL		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosA,1
				GOTO	LOOPAZUL
				CALL	STOP
				GOTO 	MAIN

COLORMORADO		MOVLW	d'6'
				MOVWF	PasosM
LOOPMORADO		MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				DECFSZ	PasosM,1
				GOTO	LOOPMORADO
				CALL	STOP
				GOTO 	MAIN

SENSOR			MOVLW	0X00
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTC
				CALL 	R_Xms
				MOVLW	0X08
				MOVWF	PORTC
				CALL 	R_Xms
Sen				MOVF	PORTA,W
				MOVWF	Sensor
				ADDLW	0x00
				BTFSC	Sensor,7
				GOTO 	SENSOR
				CALL 	FINAL
				GOTO 	MAIN



STOP:			MOVLW	0X00
				MOVWF	PORTC
				CALL 	FINAL
				RETURN



;--------------------------- Tiempos-----------------------------------


R_Xms		MOVLW	0XC9		; cargo w con 216
			MOVWF	TMR0		; lo paso a TMR0
NADA		BTFSC	TMR0,7		; me quedo haciendo nada
			GOTO	NADA		; hasta que TMR0 desborde, y entonces
			RETURN 				; volveré a cargar TMR0

FINAL		CLRF	TMR0
			MOVLW	0X40
			MOVWF	Cuenta
CT64		CLRF	TMR0			; lo paso a TMR0
DESB		BTFSS	TMR0,5		; me quedo haciendo nada
			GOTO	DESB
			DECFSZ	Cuenta,F
			GOTO	CT64		; hasta que TMR0 desborde, y entonces
			RETURN 				; volveré a cargar TMR0

SampleTime:		NOP
				NOP
				NOP
				NOP
				RETURN
		
			END