    		;Programa que lee realiza una lectura analogica en el puerto AN5(RE0) de un trimpot 
			PROCESSOR P16F887	
    		#include "p16f887.inc"
	
    		; CONFIG1
    		__CONFIG _CONFIG1,(_INTRC_OSC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
    		; CONFIG2
    		__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)

NA			EQU		0x21
NB			EQU		0x22
SELEC		EQU		0x23
MA			EQU		0x24
ME			EQU		0x25
RX			EQU		0x26
VLPA		EQU		0x27

    		ORG	    0x00		;Vector de restauracion
    	
    		BANKSEL	ANSEL		;Banco 3
									
			CLRF	ANSEL		;Selecci?n de entrada analogica para activar
    		CLRF    ANSELH			;Se escribe 0x00 en el registro indicado (ANSELH)	    1ciclo
    	
    		BANKSEL	ADCON1		;Banco 1
			MOVWF	0xFF
			MOVWF	TRISA		;Puerto A como entrada
    		CLRF    TRISB		;Puerto B como salida
			MOVF	0X01,W		;Pin PC0 como entrada
			MOVWF	TRISC		
    		CLRF    TRISD		
    		CLRF	TRISE
			
			BANKSEL	ADCON0
			CLRF	PORTB    

MAIN:		CLRF	RX
			MOVF	PORTA,W
			MOVWF	VLPA
			ANDLW	0X0F
			MOVWF	NB
			MOVF	VLPA,W
			ANDLW	0XF0
			MOVWF	NA
			SWAPF	NA,F
CERO:		MOVF	NA,F		;Sirve para revisar si es cero
			BTFSC	STATUS,Z
			GOTO	MOSTRAR
			MOVF	NB,F
			BTFSC	STATUS,Z
			GOTO	MOSTRAR

SELECTOR	BTFSC	PORTC,RC0
			GOTO	DIV

MAYOR		MOVF	NB,W
			SUBWF	NA,W
			BTFSC	STATUS,C
			GOTO	NA_M
			MOVF	NB,W
			MOVWF	MA
			MOVF	NA,W
			MOVWF	ME
			GOTO	MUL
NA_M		MOVF	NA,W
			MOVWF	MA
			MOVF	NB,W
			MOVWF	ME

MUL:		MOVF	MA,W
			ADDWF	RX,F
			DECFSZ	ME,F
			GOTO	MUL
			GOTO	MOSTRAR

DIV:		MOVF	NB,W
			SUBWF	NA,F
			BTFSS	STATUS,C
			GOTO	MOSTRAR
			INCF	RX,F
			GOTO	DIV

MOSTRAR		MOVF	RX,W
			MOVWF	PORTB
			GOTO	MAIN

			END
			
			
			