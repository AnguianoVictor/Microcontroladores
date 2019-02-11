    
    ; PIC16F887 Configuration Bit Settings

    ; Assembly source line config statements

    #include "p16f887.inc"

    ; CONFIG1
    ; __config 0x27F4
    __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF
    ; CONFIG2
    ; __config 0x3FFF
    __CONFIG _CONFIG2, _BOR40V & _WRT_OFF
    ORG	    0x00
    
    BSF	    STATUS,RP0		;Se escribe 1 el bit RP0 del registro STATUS		    1ciclo 
    BSF	    STATUS,RP1		;Se escribe 1 el bit RP1 del registro STATUS		    1ciclo 
				;Con esto nos posicionamos en el banco 3		    1ciclo
    CLRF    ANSEL		;Se escribe 0x00 en el registro indicado (ANSEL)	    1ciclo
    CLRF    ANSELH		;Se escribe 0x00 en el registro indicado (ANSELH)	    1ciclo
    
    BSF	    STATUS,RP0		;Se escribe 1 el bit RP0 del registro STATUS		    1ciclo
    BCF	    STATUS,RP1		;Se escribe 0 el bit RP0 del registro STATUS		    1ciclo
				;Con esto nos posicionamos en el banco 1		    1ciclo
    MOVWF   0xFF		;Escribe en el acumulador el valor 0xFF			    1ciclo
    MOVWF   TRISA		;Mueve el valor del acumulador al registro TRISA	    1ciclo
    CLRF    TRISB		;Limpia el registro TRISB				    1ciclo
    CLRF    TRISC		;Limpia el registro TRISC				    1ciclo
    CLRF    TRISD		;Limpia el registro TRISD				    1ciclo
    CLRF    TRISE		;Limpia el registro TRISE				    1ciclo
    
    BCF	    STATUS,RP0		;Se escribe 0 el bit RP0 del registro STATUS		    1ciclo
    BCF	    STATUS,RP1		;Se escribe 0 el bit RP1 del registro STATUS		    1ciclo
											    ;16ciclos = 16us
CP  MOVF    PORTA,W		;Escribe en W lo que tenga el registro PORTA		    1ciclo
    MOVWF   PORTB		;Lee el registro W y lo escribe en el registro (PORTB)	    1ciclo
    GOTO CP			;Regresa a la etiqueta CP				    2ciclo
    
    BANKSEL PORTA
    END											    


