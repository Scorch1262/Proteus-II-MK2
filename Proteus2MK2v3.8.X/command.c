/*
 * File:   command.c
 * Author: Torben
 *
 * Created on October 6, 2020, 9:35 AM
 */

/** Includes **************************************************/
#define FCY 32000000UL

#include <xc.h>
#include <assert.h>
#include <stdbool.h>
#include <libpic30.h>
#include "mcc_generated_files/system.h"
#include "mcc_generated_files/mcc.h"
#include "mcc_generated_files/fatfs/fatfs.h"
#include <string.h>
#include <stdio.h>
#include "command.h"
#include "proteus2.h"

#if defined(__dsPIC33E__)
	#include <p33exxxx.h>
#elif defined(__dsPIC33F__)
	#include <p33fxxxx.h>
#elif defined(__dsPIC30F__)
	#include <p30fxxxx.h>
#elif defined(__PIC24E__)
	#include <p24exxxx.h>
#elif defined(__PIC24H__)
	#include <p24hxxxx.h>
#elif defined(__PIC24F__) || defined(__PIC24FK__)
	#include <p24fxxxx.h>
#endif

 
int     usart_index = 0;                                                // definiert "usart_index"
uint8_t data[100];                                                      // definiert "data"
extern uint8_t payload_empfang[100];                                    // definiert "payload_empfang"

/** Programm **************************************************/

void UART_Input_1(void){                                                // "UART_Input_1"    
    uint8_t tempData = 0;                                               // definiert "tempData"

    if(UART1_IsRxReady() == true){                                      // wenn "UART1_IsRxReady" gleich "false" ist
        tempData = UART1_Read();                                        // kopiert "UART1_Read" in "tempData"
        if(tempData == '\n'){                                           // wenn "tempData" gleich "\n" ist
            data[usart_index] = '\0';                                   // schreibt "\0" in "data" position "usart_index"
            usart_index = 0;                                            // setzt "usart_index" auf "0"
            Proteus_Write(data);                                        // ruft "Proteus_Write" mit "data" auf
        }else if(tempData != '\r'){                                     // sonst wenn "tempData" nicht gleich "\r" ist
            data[usart_index] = tempData;                               // kopiert "tempData" in "data" poisition "usart_index"
            usart_index = usart_index + 1;                              // "usart_index" + 1
        }                                                               // 
        if(usart_index == sizeof(data)){                                // wenn "usart_index" gleich die größe von "data" ist
            usart_index = 0;                                            // schreibt "0" in "usart_index"
        }                                                               //  
    }                                                                   // 
}                                                                       // 

