list		p=16f887
#include "p16f887.inc"
#include "retardos.inc"    
   

 __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_ON & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_ON & _FCMEN_ON & _LVP_OFF

 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

ORG 0
;cblock 0x20
    TEMPORAL, TEMPORAL1, TEMPORAL3, cont3, cont4
    endc
CONFIG_PTOS
    BSF                    STATUS,RP0
    MOVLW             b'11111111'			;activa en 1 el puerto A como entrada
    MOVWF             TRISA
    MOVLW             b'00000000'			;activa en 1 el puerto A como entrada
    MOVWF             TRISB
    BSF               STATUS,RP1
    CLRF              ANSEL
    CLRF              ANSELH
    BCF               STATUS,RP0
    BCF              STATUS,RP1


INICIO
    CLRF		PORTB;PUERTO COMO SALIDA
    BSF			STATUS,C
    GOTO		SECUENCIA   
SECUENCIA
    RRF			PORTB,1
    CALL		RETARDO_500MS
    BTFSS		PORTB,1
    GOTO		SECUENCIA2
    GOTO		SECUENCIA	 

	
	
END	