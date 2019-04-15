		PROCESSOR P16F887
		INCLUDE <P16F887.INC>
		
		__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
		__CONFIG _CONFIG2, (_WRT_OFF & _BOR40V)

;---------------------
XM		EQU		0x20
XC		EQU		0x21
XD		EQU		0x22
XU		EQU		0x23
CX		EQU		0x24
VA		EQU		0x25
VB		EQU		0X26
		
;---------------------
		ORG		0x00
		BANKSEL ANSEL
		CLRF	ANSEL
		CLRF 	ANSELH
		
		BANKSEL	TRISA		
		CLRF 	TRISA
		CLRF	TRISB
		;MOVLW	0xF0
		;MOVWF	TRISC		
		CLRF	TRISC
		CLRF	TRISD
		CLRF	TRISE
;--------------------
		BANKSEL	PORTA
C_M		CLRF	XM
C_C		CLRF	XC
C_D		CLRF	XD
C_U		CLRF	XU
C_PX	MOVLW	0x08
		MOVWF	CX
;------------------
C_P		MOVF	XU,W
		CALL	T7S
		MOVWF	PORTA
		MOVLW	0x01
		MOVWF	PORTD
		CALL	R4MS

		MOVF	XD,W
		CALL	T7S
		MOVWF	PORTA
		MOVLW	0x02
		MOVWF	PORTD
		CALL	R4MS

		MOVF	XC,W
		CALL	T7S
		MOVWF	PORTA
		MOVLW	0x04
		MOVWF	PORTD
		CALL	R4MS
	
		MOVF	XM,W
		CALL	T7S
		MOVWF	PORTA
		MOVLW	0x08
		MOVWF	PORTD
		CALL	R4MS
;------------------
		DECFSZ	CX,F
		GOTO	C_P

		INCF	XU,F
		MOVLW	0x0A
		SUBWF	XU,W
		BTFSS	STATUS,Z
		GOTO	C_PX

		INCF	XD,F
		MOVLW	0x0A
		SUBWF	XD,W
		BTFSS	STATUS,Z
		GOTO	C_U;

		INCF	XC,F
		MOVLW	0x0A
		SUBWF	XC,W
		BTFSS	STATUS,Z
		GOTO	C_D;

		INCF	XM,F
		MOVLW	0x08
		SUBWF	XM,W
		BTFSS	STATUS,Z
		GOTO	C_C;
		GOTO	C8P

C8P		
        DECF	XM,F

		MOVLW	0x06
		SUBWF	XC,W
		BTFSS	STATUS,Z
		GOTO	C_D;
		
		DECF	XC,F

		MOVLW	0x04
		SUBWF	XD,W
		BTFSS	STATUS,Z
		GOTO	C_U;
		
		DECF	XD,F
		
		MOVLW	0x02
		SUBWF	XU,W
		BTFSS	STATUS,Z
		GOTO	C_P
			;
		
;-----------------------
	

;-------------------------
T7S		ADDWF	PCL,F
		RETLW	0x67
		RETLW	0x7F
		RETLW	0x07
		RETLW	0x7D
		RETLW	0x6D
		RETLW	0x66
		RETLW	0x4F
		RETLW	0x5B
		RETLW	0x06		
		RETLW	0x3F

;----------------------------------
R4MS		MOVLW	0x03;
			MOVWF   VB
	CI_B	MOVLW 	0xF9;
			MOVWF	VA
	CI_A	NOP
			DECFSZ  VA,F
			GOTO	CI_A
			DECFSZ	VB,F
			GOTO	CI_B
			
			RETURN

END