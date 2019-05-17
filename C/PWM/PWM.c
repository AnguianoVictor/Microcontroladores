#include <htc.h>
#include <stdio.h>
#include "lcd.h"


__CONFIG (FOSC_INTRC_NOCLKOUT & WDTE_OFF & PWRTE_OFF & MCLRE_OFF & CP_OFF & CPD_OFF & BOREN_OFF & IESO_OFF & FCMEN_OFF & LVP_OFF & DEBUG_OFF);
__CONFIG (BOR4V_BOR40V & WRT_OFF);

void pause( unsigned short usvalue );
void msecbase(void);

unsigned char VPA=0x00;
unsigned char VPB=0x00;
int read;
float adc;
unsigned char buffer[20];
float porcentaje;

void main(void)
{
	OSCCON = 0x70;	//OSCILADOR INTERNO 8MHZ 

	ANSEL = 0xF0;
    ANSELH = 0x00;
    ADCON1 = 0b00000000;
    
    TRISA = 0b00000000;
    TRISB = 0b00000100;
    TRISE = 0b00000111;
	TRISC = 0x00;
	TRISD = 0x00;


    lcd_init();		
    lcd_clear();
	lcd_puts("Inicilizando...");
	pause(500);
	lcd_clear();
	
    // Setup PWM
    PR2 = 255;                    // Set PWM period
    CCPR1L = 0x80;                // Duty = 50%
    TMR2IE = 1;                   // Disable Timer 2 Interrupt
    CCP1CON = 0b00001100;         //CCP1 On
    T2CON = 0x00000010;           //Prescaler = 16   
	TMR2ON = 1;					  //TurnOn=TMR2
    while (!TMR2IF)
	{
	}              
	

	while (1)			//C_P
	{

		ADCON0 = 0b00011001;			// Sample Time
        GO_DONE = 1;				// Start A/D conversion on AN0
        pause(1);
        while(GO_DONE == 1); 	// Wait for conversion to complete
		ADON = 0;
        read = (ADRESH << 2)|(ADRESL >> 6);
        adc = (read*0.0048875855327468); //   5/1023 = 0.0048875855327468
		CCPR1L = ADRESH;
		CCP1CON=0b00001100|(ADRESL >> 2);
        lcd_goto(0x80);             //0x80 INICIO + 0x00 CURSOR
        sprintf(buffer,"V=%.3f",adc);
        lcd_puts(buffer);
        lcd_goto(0x88);
		porcentaje = read*0.09765625;		// 0.09765625=100/1024
		sprintf(buffer,"P=%.2f",porcentaje);
		lcd_puts(buffer);
		lcd_goto(0x8F);
		lcd_putch(37);
		pause(10);

		
		ADCON0 = 0b00011101;
		GO_DONE=1;
		while(GO_DONE==1);
		ADON = 0;
		read = (ADRESH << 2)|(ADRESL >> 6);
        adc = (read*0.0048875855327468); //   5/1023 = 0.0048875855327468
		CCPR2L = ADRESH;
		CCP2CON=0b00001100|(ADRESL >> 2);
        lcd_goto(0xC0);             //0x80 INICIO + 0x00 CURSOR
        sprintf(buffer,"V=%.3f",adc);
        lcd_puts(buffer);
		lcd_goto(0xC8);
		porcentaje = read*0.09765625;		// 0.09765625=100/1024
		sprintf(buffer,"P=%.2f",porcentaje);
		lcd_puts(buffer);
		lcd_goto(0xCF);
		lcd_putch(37);
		pause(10);
		

	}	
}















