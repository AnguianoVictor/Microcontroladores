opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 9453"

opt pagewidth 120

	opt lm

	processor	16F887
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 5 "C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	psect config,class=CONFIG,delta=2 ;#
# 5 "C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	dw 0xFFFC & 0xFFF7 & 0xFFFF & 0xFFDF & 0xFFFF & 0xFFFF & 0xFCFF & 0xFBFF & 0xF7FF & 0xEFFF & 0xFFFF ;#
# 6 "C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	psect config,class=CONFIG,delta=2 ;#
# 6 "C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	dw 0xFFFF & 0xFFFF ;#
	FNCALL	_main,_lcd_init
	FNCALL	_main,_lcd_clear
	FNCALL	_main,_lcd_puts
	FNCALL	_main,_pause
	FNCALL	_main,_lcd_goto
	FNCALL	_main,_lcd_putch
	FNCALL	_lcd_init,_pause
	FNCALL	_lcd_init,_lcd_write
	FNCALL	_lcd_init,_lcd_clear
	FNCALL	_lcd_putch,_lcd_write
	FNCALL	_lcd_goto,_lcd_write
	FNCALL	_lcd_puts,_lcd_write
	FNCALL	_lcd_clear,_lcd_write
	FNCALL	_lcd_clear,_pause
	FNCALL	_lcd_write,_pause
	FNCALL	_pause,_msecbase
	FNROOT	_main
	global	_fila
psect	strings,class=STRING,delta=2
global __pstrings
__pstrings:
;	global	stringdir,stringtab,__stringbase
stringtab:
;	String table - string pointers are 1 byte each
stringcode:stringdir:
movlw high(stringdir)
movwf pclath
movf fsr,w
incf fsr
	addwf pc
__stringbase:
	retlw	0
psect	strings
	file	"C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	line	11
_fila:
	retlw	080h
	retlw	0
	retlw	0
	retlw	0

	retlw	081h
	retlw	0
	retlw	0
	retlw	0

	retlw	082h
	retlw	0
	retlw	0
	retlw	0

	retlw	083h
	retlw	0
	retlw	0
	retlw	0

	retlw	084h
	retlw	0
	retlw	0
	retlw	0

	retlw	085h
	retlw	0
	retlw	0
	retlw	0

	retlw	086h
	retlw	0
	retlw	0
	retlw	0

	retlw	087h
	retlw	0
	retlw	0
	retlw	0

	retlw	088h
	retlw	0
	retlw	0
	retlw	0

	retlw	089h
	retlw	0
	retlw	0
	retlw	0

	retlw	08Ah
	retlw	0
	retlw	0
	retlw	0

	retlw	08Bh
	retlw	0
	retlw	0
	retlw	0

	retlw	08Ch
	retlw	0
	retlw	0
	retlw	0

	retlw	08Dh
	retlw	0
	retlw	0
	retlw	0

	retlw	08Eh
	retlw	0
	retlw	0
	retlw	0

	retlw	08Fh
	retlw	0
	retlw	0
	retlw	0

	retlw	0C0h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C1h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C2h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C3h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C4h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C5h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C6h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C7h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C8h
	retlw	0
	retlw	0
	retlw	0

	retlw	0C9h
	retlw	0
	retlw	0
	retlw	0

	retlw	0CAh
	retlw	0
	retlw	0
	retlw	0

	retlw	0CBh
	retlw	0
	retlw	0
	retlw	0

	retlw	0CCh
	retlw	0
	retlw	0
	retlw	0

	retlw	0CDh
	retlw	0
	retlw	0
	retlw	0

	retlw	0CEh
	retlw	0
	retlw	0
	retlw	0

	retlw	0CFh
	retlw	0
	retlw	0
	retlw	0

	global	_fila
	global	_PORTD
_PORTD	set	8
	global	_TMR0
_TMR0	set	1
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA4
_RA4	set	44
	global	_T0IF
_T0IF	set	90
	global	_OPTION_REG
_OPTION_REG	set	129
	global	_OSCCON
_OSCCON	set	143
	global	_TRISA
_TRISA	set	133
	global	_TRISC
_TRISC	set	135
	global	_TRISD
_TRISD	set	136
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_ANSEL
_ANSEL	set	392
	global	_ANSELH
_ANSELH	set	393
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	
STR_1:	
	retlw	73	;'I'
	retlw	110	;'n'
	retlw	105	;'i'
	retlw	99	;'c'
	retlw	105	;'i'
	retlw	108	;'l'
	retlw	105	;'i'
	retlw	122	;'z'
	retlw	97	;'a'
	retlw	110	;'n'
	retlw	100	;'d'
	retlw	111	;'o'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	46	;'.'
	retlw	0
psect	strings
	file	"Fig.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_lcd_init
?_lcd_init:	; 0 bytes @ 0x0
	global	?_lcd_clear
?_lcd_clear:	; 0 bytes @ 0x0
	global	?_lcd_puts
?_lcd_puts:	; 0 bytes @ 0x0
	global	?_pause
?_pause:	; 0 bytes @ 0x0
	global	?_lcd_goto
?_lcd_goto:	; 0 bytes @ 0x0
	global	?_lcd_putch
?_lcd_putch:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_lcd_write
?_lcd_write:	; 0 bytes @ 0x0
	global	?_msecbase
?_msecbase:	; 0 bytes @ 0x0
	global	??_msecbase
??_msecbase:	; 0 bytes @ 0x0
	global	pause@usvalue
pause@usvalue:	; 2 bytes @ 0x0
	ds	2
	global	??_pause
??_pause:	; 0 bytes @ 0x2
	global	pause@x
pause@x:	; 2 bytes @ 0x2
	ds	2
	global	??_lcd_write
??_lcd_write:	; 0 bytes @ 0x4
	ds	1
	global	lcd_write@c
lcd_write@c:	; 1 bytes @ 0x5
	ds	1
	global	??_lcd_init
??_lcd_init:	; 0 bytes @ 0x6
	global	??_lcd_clear
??_lcd_clear:	; 0 bytes @ 0x6
	global	??_lcd_puts
??_lcd_puts:	; 0 bytes @ 0x6
	global	??_lcd_goto
??_lcd_goto:	; 0 bytes @ 0x6
	global	??_lcd_putch
??_lcd_putch:	; 0 bytes @ 0x6
	global	lcd_putch@c
lcd_putch@c:	; 1 bytes @ 0x6
	global	lcd_goto@pos
lcd_goto@pos:	; 1 bytes @ 0x6
	ds	1
	global	lcd_puts@s
lcd_puts@s:	; 1 bytes @ 0x7
	global	lcd_init@init_value
lcd_init@init_value:	; 1 bytes @ 0x7
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x8
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x9
	ds	1
;;Data sizes: Strings 16, constant 128, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     10      10
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; lcd_puts@s	PTR const unsigned char  size(1) Largest target is 16
;;		 -> STR_1(CODE[16]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_lcd_init
;;   _main->_lcd_puts
;;   _lcd_init->_lcd_write
;;   _lcd_putch->_lcd_write
;;   _lcd_goto->_lcd_write
;;   _lcd_puts->_lcd_write
;;   _lcd_clear->_lcd_write
;;   _lcd_write->_pause
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     645
;;                                              8 COMMON     2     2      0
;;                           _lcd_init
;;                          _lcd_clear
;;                           _lcd_puts
;;                              _pause
;;                           _lcd_goto
;;                          _lcd_putch
;; ---------------------------------------------------------------------------------
;; (1) _lcd_init                                             2     2      0     195
;;                                              6 COMMON     2     2      0
;;                              _pause
;;                          _lcd_write
;;                          _lcd_clear
;; ---------------------------------------------------------------------------------
;; (1) _lcd_putch                                            1     1      0      75
;;                                              6 COMMON     1     1      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_goto                                             1     1      0      75
;;                                              6 COMMON     1     1      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_puts                                             2     2      0      90
;;                                              6 COMMON     2     2      0
;;                          _lcd_write
;; ---------------------------------------------------------------------------------
;; (1) _lcd_clear                                            0     0      0      90
;;                          _lcd_write
;;                              _pause
;; ---------------------------------------------------------------------------------
;; (2) _lcd_write                                            2     2      0      60
;;                                              4 COMMON     2     2      0
;;                              _pause
;; ---------------------------------------------------------------------------------
;; (3) _pause                                                4     2      2      30
;;                                              0 COMMON     4     2      2
;;                           _msecbase
;; ---------------------------------------------------------------------------------
;; (4) _msecbase                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _lcd_init
;;     _pause
;;       _msecbase
;;     _lcd_write
;;       _pause
;;         _msecbase
;;     _lcd_clear
;;       _lcd_write
;;         _pause
;;           _msecbase
;;       _pause
;;         _msecbase
;;   _lcd_clear
;;     _lcd_write
;;       _pause
;;         _msecbase
;;     _pause
;;       _msecbase
;;   _lcd_puts
;;     _lcd_write
;;       _pause
;;         _msecbase
;;   _pause
;;     _msecbase
;;   _lcd_goto
;;     _lcd_write
;;       _pause
;;         _msecbase
;;   _lcd_putch
;;     _lcd_write
;;       _pause
;;         _msecbase
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      A       A       1       71.4%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       5       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 14 in file "C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    9[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_lcd_init
;;		_lcd_clear
;;		_lcd_puts
;;		_pause
;;		_lcd_goto
;;		_lcd_putch
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\PIC_PROGS\Microcontroladores\C\Figuras\Figuras.c"
	line	14
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	15
	
l6256:	
;Figuras.c: 15: OSCCON = 0x60;
	movlw	(060h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(143)^080h	;volatile
	line	17
	
l6258:	
;Figuras.c: 17: ANSEL = 0x00;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	clrf	(392)^0180h	;volatile
	line	18
	
l6260:	
;Figuras.c: 18: ANSELH = 0x00;
	clrf	(393)^0180h	;volatile
	line	19
	
l6262:	
;Figuras.c: 19: TRISD = 0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	20
	
l6264:	
;Figuras.c: 20: TRISA = 0x00;
	clrf	(133)^080h	;volatile
	line	21
	
l6266:	
;Figuras.c: 21: lcd_init();
	fcall	_lcd_init
	line	22
	
l6268:	
;Figuras.c: 22: lcd_clear();
	fcall	_lcd_clear
	line	23
	
l6270:	
;Figuras.c: 23: lcd_puts("Inicilizando...");
	movlw	((STR_1-__stringbase))&0ffh
	fcall	_lcd_puts
	line	24
	
l6272:	
;Figuras.c: 24: pause(500);
	movlw	low(01F4h)
	movwf	(?_pause)
	movlw	high(01F4h)
	movwf	((?_pause))+1
	fcall	_pause
	line	25
	
l6274:	
;Figuras.c: 25: lcd_clear();
	fcall	_lcd_clear
	goto	l6276
	line	27
;Figuras.c: 27: while (1)
	
l1039:	
	line	30
	
l6276:	
;Figuras.c: 28: {
;Figuras.c: 29: char i;
;Figuras.c: 30: for(i = 0;i <= 32;i++)
	clrf	(main@i)
	
l6278:	
	movlw	(021h)
	subwf	(main@i),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l6282
u2260:
	goto	l1041
	
l6280:	
	goto	l1041
	line	31
	
l1040:	
	line	32
	
l6282:	
;Figuras.c: 31: {
;Figuras.c: 32: lcd_goto(fila[i]);
	movf	(main@i),w
	movwf	(??_main+0)+0
	movlw	(02h)-1
u2275:
	clrc
	rlf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2275
	clrc
	rlf	(??_main+0)+0,w
	addlw	low((_fila-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_goto
	line	33
	
l6284:	
;Figuras.c: 33: lcd_putch(219);
	movlw	(0DBh)
	fcall	_lcd_putch
	line	34
	
l6286:	
;Figuras.c: 34: pause(250);
	movlw	low(0FAh)
	movwf	(?_pause)
	movlw	high(0FAh)
	movwf	((?_pause))+1
	fcall	_pause
	line	30
	
l6288:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l6290:	
	movlw	(021h)
	subwf	(main@i),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l6282
u2280:
	
l1041:	
	line	37
;Figuras.c: 35: }
;Figuras.c: 37: for(i = 0;i <= 32;i++)
	clrf	(main@i)
	
l6292:	
	movlw	(021h)
	subwf	(main@i),w
	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l6296
u2290:
	goto	l6276
	
l6294:	
	goto	l6276
	line	38
	
l1042:	
	line	39
	
l6296:	
;Figuras.c: 38: {
;Figuras.c: 39: lcd_goto(fila[i]);
	movf	(main@i),w
	movwf	(??_main+0)+0
	movlw	(02h)-1
u2305:
	clrc
	rlf	(??_main+0)+0,f
	addlw	-1
	skipz
	goto	u2305
	clrc
	rlf	(??_main+0)+0,w
	addlw	low((_fila-__stringbase))
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_goto
	line	40
	
l6298:	
;Figuras.c: 40: lcd_putch(32);
	movlw	(020h)
	fcall	_lcd_putch
	line	41
	
l6300:	
;Figuras.c: 41: pause(250);
	movlw	low(0FAh)
	movwf	(?_pause)
	movlw	high(0FAh)
	movwf	((?_pause))+1
	fcall	_pause
	line	37
	
l6302:	
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l6304:	
	movlw	(021h)
	subwf	(main@i),w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l6296
u2310:
	goto	l6276
	
l1043:	
	goto	l6276
	line	44
	
l1044:	
	line	27
	goto	l6276
	
l1045:	
	line	45
	
l1046:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_lcd_init
psect	text155,local,class=CODE,delta=2
global __ptext155
__ptext155:

;; *************** function _lcd_init *****************
;; Defined at:
;;		line 89 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  init_value      1    7[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_pause
;;		_lcd_write
;;		_lcd_clear
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text155
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	89
	global	__size_of_lcd_init
	__size_of_lcd_init	equ	__end_of_lcd_init-_lcd_init
	
_lcd_init:	
	opt	stack 3
; Regs used in _lcd_init: [wreg+status,2+status,0+pclath+cstack]
	line	94
	
l6214:	
;lcd.c: 90: char init_value;
;lcd.c: 94: init_value = 0x3;
	movlw	(03h)
	movwf	(??_lcd_init+0)+0
	movf	(??_lcd_init+0)+0,w
	movwf	(lcd_init@init_value)
	line	95
	
l6216:	
;lcd.c: 95: TRISA=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(133)^080h	;volatile
	line	96
	
l6218:	
;lcd.c: 96: TRISC=0;
	clrf	(135)^080h	;volatile
	line	97
	
l6220:	
;lcd.c: 97: RA2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
	line	98
	
l6222:	
;lcd.c: 98: RA1 = 0;
	bcf	(41/8),(41)&7
	line	99
	
l6224:	
;lcd.c: 99: RA4 = 0;
	bcf	(44/8),(44)&7
	line	101
	
l6226:	
;lcd.c: 101: pause (15);
	movlw	low(0Fh)
	movwf	(?_pause)
	movlw	high(0Fh)
	movwf	((?_pause))+1
	fcall	_pause
	line	102
	
l6228:	
;lcd.c: 102: PORTD = init_value;
	movf	(lcd_init@init_value),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	103
	
l6230:	
;lcd.c: 103: ((RA1 = 1),(RA1=0));
	bsf	(41/8),(41)&7
	
l6232:	
	bcf	(41/8),(41)&7
	line	104
;lcd.c: 104: pause(10);
	movlw	low(0Ah)
	movwf	(?_pause)
	movlw	high(0Ah)
	movwf	((?_pause))+1
	fcall	_pause
	line	105
	
l6234:	
;lcd.c: 105: ((RA1 = 1),(RA1=0));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	
l6236:	
	bcf	(41/8),(41)&7
	line	106
;lcd.c: 106: pause(10);
	movlw	low(0Ah)
	movwf	(?_pause)
	movlw	high(0Ah)
	movwf	((?_pause))+1
	fcall	_pause
	line	107
	
l6238:	
;lcd.c: 107: ((RA1 = 1),(RA1=0));
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	
l6240:	
	bcf	(41/8),(41)&7
	line	108
;lcd.c: 108: pause(10);
	movlw	low(0Ah)
	movwf	(?_pause)
	movlw	high(0Ah)
	movwf	((?_pause))+1
	fcall	_pause
	line	109
	
l6242:	
;lcd.c: 109: PORTD = 2;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	110
	
l6244:	
;lcd.c: 110: ((RA1 = 1),(RA1=0));
	bsf	(41/8),(41)&7
	
l6246:	
	bcf	(41/8),(41)&7
	line	112
	
l6248:	
;lcd.c: 112: lcd_write(0x28);
	movlw	(028h)
	fcall	_lcd_write
	line	113
	
l6250:	
;lcd.c: 113: lcd_write(0xC);
	movlw	(0Ch)
	fcall	_lcd_write
	line	115
	
l6252:	
;lcd.c: 115: lcd_clear();
	fcall	_lcd_clear
	line	116
	
l6254:	
;lcd.c: 116: lcd_write(0x6);
	movlw	(06h)
	fcall	_lcd_write
	line	117
	
l1901:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_init
	__end_of_lcd_init:
;; =============== function _lcd_init ends ============

	signat	_lcd_init,88
	global	_lcd_putch
psect	text156,local,class=CODE,delta=2
global __ptext156
__ptext156:

;; *************** function _lcd_putch *****************
;; Defined at:
;;		line 69 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text156
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	69
	global	__size_of_lcd_putch
	__size_of_lcd_putch	equ	__end_of_lcd_putch-_lcd_putch
	
_lcd_putch:	
	opt	stack 4
; Regs used in _lcd_putch: [wreg+status,2+status,0+pclath+cstack]
;lcd_putch@c stored from wreg
	movwf	(lcd_putch@c)
	line	70
	
l6210:	
;lcd.c: 70: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	71
	
l6212:	
;lcd.c: 71: lcd_write( c );
	movf	(lcd_putch@c),w
	fcall	_lcd_write
	line	72
	
l1895:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_putch
	__end_of_lcd_putch:
;; =============== function _lcd_putch ends ============

	signat	_lcd_putch,4216
	global	_lcd_goto
psect	text157,local,class=CODE,delta=2
global __ptext157
__ptext157:

;; *************** function _lcd_goto *****************
;; Defined at:
;;		line 81 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;  pos             1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  pos             1    6[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text157
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	81
	global	__size_of_lcd_goto
	__size_of_lcd_goto	equ	__end_of_lcd_goto-_lcd_goto
	
_lcd_goto:	
	opt	stack 4
; Regs used in _lcd_goto: [wreg+status,2+status,0+pclath+cstack]
;lcd_goto@pos stored from wreg
	movwf	(lcd_goto@pos)
	line	82
	
l6206:	
;lcd.c: 82: RA2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
	line	83
	
l6208:	
;lcd.c: 83: lcd_write(pos);
	movf	(lcd_goto@pos),w
	fcall	_lcd_write
	line	84
	
l1898:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_goto
	__end_of_lcd_goto:
;; =============== function _lcd_goto ends ============

	signat	_lcd_goto,4216
	global	_lcd_puts
psect	text158,local,class=CODE,delta=2
global __ptext158
__ptext158:

;; *************** function _lcd_puts *****************
;; Defined at:
;;		line 59 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;  s               1    wreg     PTR const unsigned char 
;;		 -> STR_1(16), 
;; Auto vars:     Size  Location     Type
;;  s               1    7[COMMON] PTR const unsigned char 
;;		 -> STR_1(16), 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text158
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	59
	global	__size_of_lcd_puts
	__size_of_lcd_puts	equ	__end_of_lcd_puts-_lcd_puts
	
_lcd_puts:	
	opt	stack 4
; Regs used in _lcd_puts: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;lcd_puts@s stored from wreg
	movwf	(lcd_puts@s)
	line	60
	
l6198:	
;lcd.c: 60: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	61
;lcd.c: 61: while(*s)
	goto	l6204
	
l1890:	
	line	62
	
l6200:	
;lcd.c: 62: lcd_write(*s++);
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	fcall	_lcd_write
	
l6202:	
	movlw	(01h)
	movwf	(??_lcd_puts+0)+0
	movf	(??_lcd_puts+0)+0,w
	addwf	(lcd_puts@s),f
	goto	l6204
	
l1889:	
	line	61
	
l6204:	
	movf	(lcd_puts@s),w
	movwf	fsr0
	fcall	stringdir
	iorlw	0
	skipz
	goto	u2251
	goto	u2250
u2251:
	goto	l6200
u2250:
	goto	l1892
	
l1891:	
	line	63
	
l1892:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_puts
	__end_of_lcd_puts:
;; =============== function _lcd_puts ends ============

	signat	_lcd_puts,4216
	global	_lcd_clear
psect	text159,local,class=CODE,delta=2
global __ptext159
__ptext159:

;; *************** function _lcd_clear *****************
;; Defined at:
;;		line 49 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_lcd_write
;;		_pause
;; This function is called by:
;;		_main
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text159
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	49
	global	__size_of_lcd_clear
	__size_of_lcd_clear	equ	__end_of_lcd_clear-_lcd_clear
	
_lcd_clear:	
	opt	stack 4
; Regs used in _lcd_clear: [wreg+status,2+status,0+pclath+cstack]
	line	50
	
l6194:	
;lcd.c: 50: RA2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(42/8),(42)&7
	line	51
	
l6196:	
;lcd.c: 51: lcd_write(0x1);
	movlw	(01h)
	fcall	_lcd_write
	line	52
;lcd.c: 52: pause (2);
	movlw	low(02h)
	movwf	(?_pause)
	movlw	high(02h)
	movwf	((?_pause))+1
	fcall	_pause
	line	53
	
l1886:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_clear
	__end_of_lcd_clear:
;; =============== function _lcd_clear ends ============

	signat	_lcd_clear,88
	global	_lcd_write
psect	text160,local,class=CODE,delta=2
global __ptext160
__ptext160:

;; *************** function _lcd_write *****************
;; Defined at:
;;		line 34 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
;; Parameters:    Size  Location     Type
;;  c               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  c               1    5[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_pause
;; This function is called by:
;;		_lcd_clear
;;		_lcd_puts
;;		_lcd_putch
;;		_lcd_goto
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text160
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\lcd.c"
	line	34
	global	__size_of_lcd_write
	__size_of_lcd_write	equ	__end_of_lcd_write-_lcd_write
	
_lcd_write:	
	opt	stack 4
; Regs used in _lcd_write: [wreg+status,2+status,0+pclath+cstack]
;lcd_write@c stored from wreg
	movwf	(lcd_write@c)
	line	35
	
l6180:	
;lcd.c: 35: pause (1);
	movlw	low(01h)
	movwf	(?_pause)
	movlw	high(01h)
	movwf	((?_pause))+1
	fcall	_pause
	line	36
	
l6182:	
;lcd.c: 36: PORTD = ( ( c >> 4 ) & 0x0F );
	movf	(lcd_write@c),w
	movwf	(??_lcd_write+0)+0
	movlw	04h
u2245:
	clrc
	rrf	(??_lcd_write+0)+0,f
	addlw	-1
	skipz
	goto	u2245
	movf	0+(??_lcd_write+0)+0,w
	andlw	0Fh
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(8)	;volatile
	line	37
	
l6184:	
;lcd.c: 37: ((RA1 = 1),(RA1=0));
	bsf	(41/8),(41)&7
	
l6186:	
	bcf	(41/8),(41)&7
	line	38
	
l6188:	
;lcd.c: 38: PORTD = ( c & 0x0F );
	movf	(lcd_write@c),w
	andlw	0Fh
	movwf	(8)	;volatile
	line	39
	
l6190:	
;lcd.c: 39: ((RA1 = 1),(RA1=0));
	bsf	(41/8),(41)&7
	
l6192:	
	bcf	(41/8),(41)&7
	line	41
	
l1883:	
	return
	opt stack 0
GLOBAL	__end_of_lcd_write
	__end_of_lcd_write:
;; =============== function _lcd_write ends ============

	signat	_lcd_write,4216
	global	_pause
psect	text161,local,class=CODE,delta=2
global __ptext161
__ptext161:

;; *************** function _pause *****************
;; Defined at:
;;		line 10 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\pause.c"
;; Parameters:    Size  Location     Type
;;  usvalue         2    0[COMMON] unsigned short 
;; Auto vars:     Size  Location     Type
;;  x               2    2[COMMON] unsigned short 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_msecbase
;; This function is called by:
;;		_main
;;		_lcd_write
;;		_lcd_clear
;;		_lcd_init
;; This function uses a non-reentrant model
;;
psect	text161
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\pause.c"
	line	10
	global	__size_of_pause
	__size_of_pause	equ	__end_of_pause-_pause
	
_pause:	
	opt	stack 4
; Regs used in _pause: [wreg+status,2+status,0+pclath+cstack]
	line	13
	
l6172:	
;pause.c: 11: unsigned short x;
;pause.c: 13: for (x=0; x<=usvalue; x++)
	clrf	(pause@x)
	clrf	(pause@x+1)
	goto	l6178
	line	14
	
l3957:	
	line	15
	
l6174:	
;pause.c: 14: {
;pause.c: 15: msecbase();
	fcall	_msecbase
	line	13
	
l6176:	
	movlw	low(01h)
	addwf	(pause@x),f
	skipnc
	incf	(pause@x+1),f
	movlw	high(01h)
	addwf	(pause@x+1),f
	goto	l6178
	
l3956:	
	
l6178:	
	movf	(pause@x+1),w
	subwf	(pause@usvalue+1),w
	skipz
	goto	u2235
	movf	(pause@x),w
	subwf	(pause@usvalue),w
u2235:
	skipnc
	goto	u2231
	goto	u2230
u2231:
	goto	l6174
u2230:
	goto	l3959
	
l3958:	
	line	17
	
l3959:	
	return
	opt stack 0
GLOBAL	__end_of_pause
	__end_of_pause:
;; =============== function _pause ends ============

	signat	_pause,4216
	global	_msecbase
psect	text162,local,class=CODE,delta=2
global __ptext162
__ptext162:

;; *************** function _msecbase *****************
;; Defined at:
;;		line 24 in file "C:\PIC_PROGS\Microcontroladores\C\PWM\msecbase.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_pause
;; This function uses a non-reentrant model
;;
psect	text162
	file	"C:\PIC_PROGS\Microcontroladores\C\PWM\msecbase.c"
	line	24
	global	__size_of_msecbase
	__size_of_msecbase	equ	__end_of_msecbase-_msecbase
	
_msecbase:	
	opt	stack 4
; Regs used in _msecbase: [wreg]
	line	25
	
l5312:	
;msecbase.c: 25: OPTION_REG = 0b00000001;
	movlw	(01h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(129)^080h	;volatile
	line	26
;msecbase.c: 26: TMR0 = 0xD;
	movlw	(0Dh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(1)	;volatile
	line	27
;msecbase.c: 27: while(!T0IF);
	goto	l2926
	
l2927:	
	
l2926:	
	btfss	(90/8),(90)&7
	goto	u11
	goto	u10
u11:
	goto	l2926
u10:
	
l2928:	
	line	28
;msecbase.c: 28: T0IF = 0;
	bcf	(90/8),(90)&7
	line	29
	
l2929:	
	return
	opt stack 0
GLOBAL	__end_of_msecbase
	__end_of_msecbase:
;; =============== function _msecbase ends ============

	signat	_msecbase,88
psect	text163,local,class=CODE,delta=2
global __ptext163
__ptext163:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
