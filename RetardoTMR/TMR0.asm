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
CT0		EQU	0X25
    	 
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
		
	MOVLW	0xD6	    	;Configuraci?n del Option Register D6 = 128
	MOVWF	OPTION_REG
    	
    	BCF	    STATUS,RP0		;Se escribe 0 el bit RP0 del registro STATUS		    1ciclo
    	BCF	    STATUS,RP1		;Se escribe 0 el bit RP1 del registro STATUS		    1ciclo										    ;16ciclos = 16us



CP		CALL	RT08
		CALL	RT012
		CALL	RT0M
		CALL	RT01S
		GOTO	CP
		

RT0M	CLRF	TMR0	
EDT0	BTFSS	INTCON,T0IF
		GOTO	EDT0
		BCF		INTCON,T0IF
		RETURN

RT08	CLRF	TMR0
EV64	BTFSS	TMR0,6
		GOTO	EV64
		RETURN

RT012	MOVLW	0x9D	
		MOVWF	TMR0
EDT02	BTFSS	INTCON,T0IF
		GOTO	EDT0
		BCF		INTCON,T0IF
		RETURN

RT01S	MOVLW	0x7A
		MOVWF	CT0
CT08	CLRF	TMR0	
E64I	BTFSS	TMR0,6
		GOTO	E64I
		DECFSZ	CT0,F
		GOTO	CT08
		RETURN
		END