			PROCESSOR P16F887
			INCLUDE <P16F887.INC>

		__CONFIG _CONFIG1, (_INTRC_OSC_NOCLKOUT & _WDT_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOR_OFF & _IESO_OFF & _FCMEN_OFF & _LVP_OFF & _DEBUG_OFF)
		__CONFIG _CONFIG2, (_WRT_OFF &_BOR40V)

	
A	 	EQU 		0x21
VX		EQU 		0x22
VY 		EQU			0x23
		
		ORG 		0x00
		BANKSEL		ANSEL
		MOVLW		0xE0
		MOVWF		ANSEL
		CLRF		ANSELH
		
		BANKSEL 	TRISA
		MOVLW		0xFF
		MOVWF 		TRISA
		CLRF		TRISB	
		CLRF		TRISC
		CLRF		TRISD	
		MOVLW		0x07
		MOVWF		TRISE
		CLRF		ADCON1
		
		BANKSEL 	PORTA
		MOVLW		0x01
		MOVWF		PORTC


C_P		MOVLW		0xD8
		MOVWF		ADCON0
		BSF			ADCON0,ADON
		BSF			ADCON0,GO_DONE	
EC5		BTFSC		ADCON0,GO_DONE
		GOTO		EC5
		MOVF		ADRESH,W
		CALL		COOR
		MOVWF		PORTB
		CALL		RET
		BCF			ADCON0,ADON

		MOVLW		0xDC
		MOVWF		ADCON0
		BSF			ADCON0,ADON
		BSF			ADCON0,GO_DONE	
EC6		BTFSC		ADCON0,GO_DONE
		GOTO		EC6
		MOVF		ADRESH,W
		CALL		COOR
		MOVWF		PORTC
		CALL		RET
		BCF			ADCON0, ADON
		GOTO		C_P
		
COOR	MOVWF		VX
		MOVF		VX,W
		SUBLW		0X20
		BTFSC		STATUS,C
		GOTO		R_1
		
		MOVF		VX,W
		SUBLW		0X40
		BTFSC		STATUS,C
		GOTO		R_2
		
		MOVF		VX,W
		SUBLW		0X60
		BTFSC		STATUS,C
		GOTO		R_3
		
		MOVF		VX,W
		SUBLW		0X80
		BTFSC		STATUS,C
		GOTO		R_4
		
		MOVF		VX,W
		SUBLW		0XA0
		BTFSC		STATUS,C
		GOTO		R_5
		
		MOVF		VX,W
		SUBLW		0XC0
		BTFSC		STATUS,C
		GOTO		R_6
		
		MOVF		VX,W
		SUBLW		0XE0
		BTFSC		STATUS,C
		GOTO		R_7
		
		
R_8		RETLW		0X80
R_7		RETLW		0X40
R_6		RETLW		0X20
R_5		RETLW		0X10
R_4		RETLW		0X08
R_3		RETLW		0X04
R_2		RETLW		0X02
R_1		RETLW		0X01
		

RET		MOVLW	D'300'
		MOVWF	A	
JL		MOVWF	VY	
KL		DECFSZ	VY,f	
		GOTO	KL
		DECFSZ	A,f	
		GOTO	JL
		RETURN
		
		END