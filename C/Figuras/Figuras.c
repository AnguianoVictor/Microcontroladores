#include <htc.h>
#include <stdio.h>
#include "lcd.h"

__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause( unsigned short usvalue );
void msecbase(void);

const long int fila[] = {0x80,0x81,0x82,0x83,0x84,0x85,0x86,0x87,0x88,0x89,0x8A,0x8B,0x8C,0x8D,0x8E,0x8F,0xC0,0xC1,0xC2,0xC3,0xC4,0xC5,0xC6,0xC7,0xC8,0xC9,0xCA,0xCB,0xCC,0xCD,0xCE,0xCF};

void main(void)
{
	OSCCON = 0x60;	//OSCILADOR INTERNO 8MHZ 

	ANSEL = 0x00;
    ANSELH = 0x00;
	TRISD = 0x00;
	TRISA = 0x00;	
    lcd_init();		
    lcd_clear();
	lcd_puts("Inicilizando...");
	pause(500);
	lcd_clear();
	
	while (1)			//C_P
	{
		char i;
		for(i = 0;i <= 32;i++)
		{
			lcd_goto(fila[i]);
			lcd_putch(219);
			pause(250);
		}
		
		for(i = 0;i <= 32;i++)
		{
			lcd_goto(fila[i]);
			lcd_putch(32);
			pause(250);
		}
		
	}	
}


