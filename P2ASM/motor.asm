    	PROCESSOR P16F887	
    	#include "p16f887.inc"

    	; CONFIG1
    	__CONFIG _CONFIG1,(_INTRC_OSC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
    	; CONFIG2
    	__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)
    
VA  	EQU 0x20			;Se sutituye la etiqueta por el registro 0x20
VB		EQU 0x21
VC  	EQU 0x22
NB		EQU	0x23
CX		EQU	0x24
    	 
    	ORG	    0x00		;Vector de restauracion
    
    	BSF	    STATUS,RP0		;Se escribe 1 el bit RP0 del registro STATUS		    1ciclo 
    	BSF	    STATUS,RP1		;Se escribe 1 el bit RP1 del registro STATUS		    1ciclo 
								;Con esto nos posicionamos en el banco 3		    1ciclo
    	CLRF    ANSEL			;Se escribe 0x00 en el registro indicado (ANSEL)	    1ciclo
    	CLRF    ANSELH			;Se escribe 0x00 en el registro indicado (ANSELH)	    1ciclo
    
    	BSF	    STATUS,RP0		;Se escribe 1 el bit RP0 del registro STATUS		    1ciclo
    	BCF	    STATUS,RP1		;Se escribe 0 el bit RP0 del registro STATUS		    1ciclo
								;Con esto nos posicionamos en el banco 1		    1ciclo
    	MOVWF   0xFF			;Escribe en el acumulador el valor 0xFF			    1ciclo
    	MOVWF   TRISA			;Mueve el valor del acumulador al registro TRISA	    1ciclo
    	CLRF    TRISB			;Limpia el registro TRISB				    1ciclo
    	CLRF    TRISC			;Limpia el registro TRISC				    1ciclo
    	CLRF    TRISD			;Limpia el registro TRISD				    1ciclo
    	CLRF    TRISE			;Limpia el registro TRISE				    1ciclo
    
    	BCF	    STATUS,RP0		;Se escribe 0 el bit RP0 del registro STATUS		    1ciclo
    	BCF	    STATUS,RP1		;Se escribe 0 el bit RP1 del registro STATUS		    1ciclo										    ;16ciclos = 16us


 CP  	MOVF    PORTA,W			;Escribe en W lo que tenga el registro PORTA		    1ciclo
    	ANDLW	0x0F	
		MOVWF	NB
		MOVLW	0x0F
		SUBWF	NB,W
		BTFSC	STATUS,Z
		GOTO 	AW01
		MOVLW	0x07
		SUBWF	NB,W
		BTFSC	STATUS,Z
		GOTO	AW02
		MOVLW	0x03
		SUBWF	NB,W
		BTFSC	STATUS,Z
		GOTO	AW04
		MOVLW	0x01
		SUBWF	NB,W
		BTFSC	STATUS,Z
		GOTO	AW08
AW16	MOVLW	0X32
		GOTO	ACX
AW08	MOVLW	0x16
		GOTO	ACX
AW04	MOVLW	0x08
		GOTO 	ACX
AW02	MOVLW	0x04
		GOTO 	ACX
AW01	MOVLW	0x01
ACX		MOVWF	CX

DIR		BTFSC	PORTA,RA7
		GOTO 	SINV
		MOVLW	0X08
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X04
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X02
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X01
		MOVWF	PORTB
		CALL 	RET
		GOTO	CP

SINV	MOVLW	0X01
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X02
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X04
		MOVWF	PORTB
		CALL 	RET
		MOVLW	0X08
		MOVWF	PORTB
		CALL 	RET
		GOTO	CP

;Función de retardo utilizando ciclos for.
RET		MOVF	CX,W
		MOVWF	VC	
CVC		MOVLW	0x01
		MOVWF	VB
CVB		MOVLW	0x07	
		MOVWF	VA
CVA		NOP
		DECFSZ	VA,F
		GOTO	CVA
		DECFSZ	VB,F
		GOTO	CVB
		DECFSZ	VC,F	
		GOTO 	CVC
		RETURN
		END

;Función de retardo utilizando el Timer0

R_1ms	MOVLW	0xC3
		MOVWF	TMR0
E_D		BTFSS	INTCON,T0IF
		GOTO	E_D	
		BCF		INTCON,T0IF
		RETURN

R_XMS	CALL	R_1ms
		DECFSZ	CX,F
		GOTO	R_XMS
		RETURN
