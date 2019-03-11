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

CT0				EQU	0x33
Cuenta 			EQU	0x34

    			ORG	    0x00		;Vector de restauracion
    	
    			BANKSEL	ANSEL		;Banco 3
									
				BSF		ANSEL,ANS5		;Selecci?n de entrada analogica para activar
    			CLRF    ANSELH			;Se escribe 0x00 en el registro indi cado (ANSELH)	    1ciclo
    	
    			BANKSEL	ADCON1			;Banco 1
				;MOVLW	0x80			;Justificaci?n a la derecha. 
				;MOVWF	ADCON1
				MOVLW	0xFF
				MOVWF	TRISA	
    			CLRF    TRISB			;Limpia el registro TRISB				    1ciclo
    			CLRF    TRISC			;Limpia el registro TRISC				    1ciclo
    			CLRF    TRISD			;Limpia el registro TRISD				    1ciclo
    			BSF	    TRISE,TRISE0	;eL PIN RE0  se configura como entrada analogica
				MOVLW	0xD7
				MOVWF	OPTION_REG
				
				BANKSEL ADCON0				
				;MOVLW	0xD5			;Encendido de ADC, GO apagado, Seleccion AN5, Clock interno. 
				;MOVWF	ADCON0
				
				
MAIN:			CALL	COLORROJO
				CALL	SENSOR
				GOTO 	MAIN
				

SampleTime:		NOP
				NOP
				NOP
				NOP
				RETURN


COLORROJO:		MOVLW	d'1'
				MOVWF	PasosR
LOOPROJO:		MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosR,1
				GOTO	LOOPROJO
				CALL	STOP
				RETURN

COLORNARANJA	MOVLW	d'2'
				MOVWF	PasosN
LOOPNARANJA		MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosN,1
				GOTO	LOOPNARANJA
				CALL	STOP
				RETURN

COLORAMARILLO	MOVLW	d'3'
				MOVWF	PasosAm
LOOPAMARILLO	MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosAm,1
				GOTO	LOOPAMARILLO
				CALL	STOP
				RETURN

COLORVERDE		MOVLW	d'4'
				MOVWF	PasosV
LOOPVERDE		MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosV,1
				GOTO	LOOPVERDE
				CALL	STOP
				RETURN

COLORAZUL:		MOVLW	d'5'
				MOVWF	PasosA
LOOPAZUL		MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosA,1
				GOTO	LOOPAZUL
				CALL	STOP
				RETURN

COLORMORADO		MOVLW	d'6'
				MOVWF	PasosM
LOOPMORADO		MOVLW	0X08
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				DECFSZ	PasosM,1
				GOTO	LOOPMORADO
				CALL	STOP
				RETURN

SENSOR			MOVLW	0X00
				MOVWF	PORTB
				MOVLW	0X01
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X02
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X04
				MOVWF	PORTB
				CALL 	R_Xms
				MOVLW	0X08
				MOVWF	PORTB
				CALL 	FINAL
Sen				MOVF	PORTA,W
				MOVWF	Sensor
				ADDLW	0x00
				BTFSC	Sensor,7
				GOTO 	SENSOR
				RETURN



STOP:		MOVLW	0X00
			MOVWF	PORTB
			CALL 	FINAL
			RETURN

TIEMPO		CLRF	TMR0
EV64		BTFSS	TMR0,5
			GOTO	EV64
			RETURN

RT01S		MOVLW	0x7A
			MOVWF	CT0
CT08		CLRF	TMR0	
E64I		BTFSS	TMR0,5
			GOTO	E64I
			DECFSZ	CT0,F
			GOTO	CT08
			RETURN


R_Xms		MOVLW	0XB0		; cargo w con 216
			MOVWF	TMR0		; lo paso a TMR0
NADA		BTFSC	TMR0,7		; me quedo haciendo nada
			GOTO	NADA		; hasta que TMR0 desborde, y entonces
			RETURN 				; volveré a cargar TMR0

FINAL		CLRF	TMR0
			MOVLW	0X55
			MOVWF	Cuenta
CT64		CLRF	TMR0			; lo paso a TMR0
DESB		BTFSS	TMR0,5		; me quedo haciendo nada
			GOTO	DESB
			DECFSZ	Cuenta,F
			GOTO	CT64		; hasta que TMR0 desborde, y entonces
			RETURN 				; volveré a cargar TMR0
		
			END