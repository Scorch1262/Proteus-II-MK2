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
#include <ctype.h>
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

#define CMD_STX                                                 0x02
#define LENGTH_CMD_OVERHEAD                                     (uint16_t)5
#define CMD_POSITION_LENGTH_MSB                                 (uint8_t)3
#define CMD_POSITION_LENGTH_LSB                                 (uint8_t)2
#define LENGTH_CMD_OVERHEAD_WITHOUT_CRC                         (uint16_t)(LENGTH_CMD_OVERHEAD - 1)
#define ProteusII_BaudRateIndex_9600                            (uint8_t)0x00
#define ProteusII_BaudRateIndex_19200                           (uint8_t)0x01
#define ProteusII_BaudRateIndex_38400                           (uint8_t)0x02
#define ProteusII_BaudRateIndex_115200                          (uint8_t)0x03
#define ProteusII_BaudRateIndex_230400                          (uint8_t)0x04
#define ProteusII_USERSETTING_POSITION_RF_DEVICE_NAME           (uint8_t)0x02
#define ProteusII_USERSETTING_POSITION_UART_BAUDRATE_INDEX      (uint8_t)0x0B
#define ProteusII_USERSETTING_POSITION_RF_STATIC_PASSKEY        (uint8_t)0x12
#define ProteusII_CMD_SET_REQ                                   (ProteusII_CMD_SET | ProteusII_CMD_TYPE_REQ)
#define ProteusII_CMD_SET                                       (uint8_t)0x11
#define ProteusII_CMD_TYPE_REQ                                  (uint8_t)(0 << 6)

uint8_t payload_empfang[100];                                           // definiert "payload_empfang"
uint8_t Proteus_block[100];                                             // definiert "Proteus_block"
uint8_t Proteus_data[100];                                              // definiert "Proteus_data"
uint8_t checksum = 0;                                                   // definiert "checksum"
uint8_t Start_Byte = 0;                                                 // definiert "Start_Byte"
uint8_t Command_Byte = 0;                                               // definiert "Command_Byte"
uint8_t Length_Byte_0 = 0;                                              // definiert "Length_Byte_0"
uint8_t Length_Byte_1 = 0;                                              // definiert "Length_Byte_1"
uint16_t Length_raw = 0;                                                // definiert "Length_raw"


/** Programm **************************************************/

void Proteus_Init(void){                                                // "Proteus_Init"
    Reset_SetHigh();                                                    // setzt "Reset" auf 1      | Proteus Aktivieren
    Wakeup_SetHigh();                                                   // setzt "Wakeup" auf 1     | 
    __delay_ms(500);                                                    // warte 500ms
}                                                                       // 

void Proteus_Write(uint8_t payload[100]){                               // "Proteus_Write"
    int i;                                                              // definiert "i"
    
    checksum = 0;                                                       // füllt "checksum"
    Start_Byte = 0x02;                                                  // füllt "Start_Byte"
    Command_Byte = 0x04;                                                // füllt "Command_Byte"
    Length_Byte_0 = 0;                                                  // füllt "Length_Byte_0"
    Length_Byte_1 = 0;                                                  // füllt "Length_Byte_1"
    Length_raw = 0;                                                     // füllt "Length_raw"
    
    Length_raw = strlen(payload);                                       // schreibt die Länge von "payload" in "Length_raw"                 | Formatierung der Längenangabe
    Length_Byte_0 = Length_raw;                                         // schreibt die ersten 8 byte von "Length_raw" in "Length_Byte_0"   | 
    Length_Byte_1 = (Length_raw >> 8);                                  // schreibt die letzten 8 byte von "Length_raw" in "Length_Byte_1"  | 
    
    sprintf(Proteus_block, "%c%c%c%c%s",                                // schreibt "%c%c%c%c%s" in "Proteus_block"                         | Berechnung der CheckSumme
            Start_Byte,                                                 //                                                                  |
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            payload);                                                   //                                                                  | 
    checksum = FillChecksum(&Proteus_block[0], (5 + Length_raw));       // schreibt das Ergibnis von "FillChecksum" in "checksum"           |
   
    sprintf(Proteus_data, "%c%c%c%c%s%c",                               // schreibt "%c%c%c%c%s%c" in "Proteus_data"                        | Zusammensetzen der Nachricht
            Start_Byte,                                                 //                                                                  | 
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            payload,                                                    //                                                                  | 
            checksum);                                                  //                                                                  | 
    
    for(i = 0; i < (5 + Length_raw); i++){                              // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
}                                                                       // 

void Proteus_Read(void){                                                // "Proteus_Read"
    uint8_t tempData = 0;                                               // definiert "tempData"
    uint8_t BTMAC[7];                                                   // definiert "BTMAC"
    uint8_t rssi = 0;                                                   // definiert "rssi"
    uint8_t CS_byte = 0;                                                // definiert "CS_byte"
    int i;                                                              // definiert "i"
    
    Length_raw = 0;                                                     // füllt "Length_raw"
    Length_Byte_0 = 0;                                                  // füllt "Length_Byte_0"
    Length_Byte_1 = 0;                                                  // füllt "Length_Byte_1"

    if(UART2_IsRxReady() == true){                                      // wenn "UART2_IsRxReady" gleich "true" ist
        tempData = UART2_Read();                                        // kopiert "UART2_Read" in "tempData"
        if(tempData == 0x02){                                           // wenn "tempData" gleich "0x02" ist
            tempData = UART2_Read();                                    // kopiert "UART2_Read" in "tempData"
            if(tempData == 0x84){                                       // wenn "tempData" gleich "0x84" ist
                Length_Byte_0 = UART2_Read();                           // kopiere "UART2_Read" in "Length_Byte_0"
                Length_Byte_1 = UART2_Read();                           // kopiert "UART2_Read" in "Length_Byte_1"
                Length_raw = (Length_Byte_1 << 8) + Length_Byte_0;      // setzt "Length_raw" aus "Length_Byte_1" und "Length_Byte_0" zusammen
                for(i = 0; i<6; i++){                                   // 6x wiederholen
                    tempData = UART2_Read();                            // kopiert "UART2_Read" in "tempData"
                    BTMAC[i] = tempData;                                // kopiert "tempData" in "BTMAC" poisition "i"
                }                                                       //
                tempData = UART2_Read();                                // kopiert "UART2_Read" in "tempData"
                rssi = tempData;                                        // kopiert
                for(i = 0; i<(Length_raw - 7); i++){                    // solange "Length_raw" -7 kleiner ist als "i"
                    tempData = UART2_Read();                            // kopiert "UART2_Read" in "tempData"
                    payload_empfang[i] = tempData;                      // kopiert "tempData" in "payload_empfang" poisition "i"
                }                                                       // 
                tempData = UART2_Read();                                // kopiert "UART2_Read" in "tempData"
                CS_byte = tempData;                                     // kopiert "tempData" in "CS_byte"
                for(i = 0; i < (Length_raw - 7); i++){                  // solange "Length_raw" -7 kleiner ist als "i"
                    UART1_Write(payload_empfang[i]);                    // schreibt "payload_empfang" an "UART1" 
                }                                                       // 
                UART1_Write('\r');                                      // schreibt "\r" an UART1
                UART1_Write('\n');                                      // schreibt "\n" an UART1
            }                                                           // 
        }                                                               // 
    }                                                                   // 
}                                                                       // 

void Proteus_SetDeviceName(uint8_t DeviceName[30]){                     // "Proteus_SetDeviceName"
    int i;                                                              // definiert "i"
    
    checksum = 0;                                                       // füllt "checksum"
    Start_Byte = 0x02;                                                  // füllt "Start_Byte"
    Command_Byte = 0x11;                                                // füllt "Command_Byte"
    Length_Byte_0 = 0;                                                  // füllt "Length_Byte_0"
    Length_Byte_1 = 0;                                                  // füllt "Length_Byte_1"
    Length_raw = 0;                                                     // füllt "Length_raw"
    
    Length_raw = strlen(DeviceName);                                    // schreibt die Länge von "DeviceName" in "Length_raw"              | Formatierung der Längenangabe
    Length_raw = Length_raw + 1;                                        // "Length_raw" + 1                                                 | 
    Length_Byte_0 = Length_raw;                                         // schreibt die ersten 8 byte von "Length_raw" in "Length_Byte_0"   | 
    Length_Byte_1 = (Length_raw >> 8);                                  // schreibt die letzten 8 byte von "Length_raw" in "Length_Byte_1"  | 
    
    sprintf(Proteus_block, "%c%c%c%c%c%s",                              // schreibt "%c%c%c%c%c%s" in "Proteus_block"                       | Berechnung der CheckSumme
            Start_Byte,                                                 //                                                                  |
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            Start_Byte,                                                 //                                                                  |
            DeviceName);                                                //                                                                  | 
    checksum = FillChecksum(&Proteus_block[0], (5 + Length_raw));       // schreibt das Ergibnis von "FillChecksum" in "checksum"           |
   
    sprintf(Proteus_data, "%c%c%c%c%c%s%c",                             // schreibt "%c%c%c%c%c%s%c" in "Proteus_data"                      | Zusammensetzen der Nachricht
            Start_Byte,                                                 //                                                                  | 
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            Start_Byte,                                                 //                                                                  |
            DeviceName,                                                 //                                                                  | 
            checksum);                                                  //                                                                  | 
    
    for(i = 0; i < (5 + Length_raw); i++){                              // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_Connect(uint8_t BTMAC[13]){                                // "Proteus_Connect"
    uint8_t BTMAC_hex[7];                                               // definiert "BTMAC_hex"
    int i;                                                              // definiert "i"

    checksum = 0;                                                       // füllt "checksum"
    Start_Byte = 0x02;                                                  // füllt "Start_Byte"
    Command_Byte = 0x06;                                                // füllt "Command_Byte"
    Length_Byte_0 = 0;                                                  // füllt "Length_Byte_0"
    Length_Byte_1 = 0;                                                  // füllt "Length_Byte_1"
    
    Length_raw = 6;                                                     // schreibt "6" in "Length_raw"                                     | Formatierung der Längenangabe 
    Length_Byte_0 = Length_raw;                                         // schreibt die ersten 8 byte von "Length_raw" in "Length_Byte_0"   | 
    Length_Byte_1 = (Length_raw >> 8);                                  // schreibt die letzten 8 byte von "Length_raw" in "Length_Byte_1"  | 
    
    for(i=0; i<Length_raw; i++){                                        // wiederhole so lange wie "i" kleiner als "Length_raw" ist
        BTMAC_hex[i] = 0;                                               // setzt "BTMAC_hex" position "i" auf "0"
        BTMAC_hex[i] = (BTMAC[i*2] <= '9' ?  BTMAC[i*2] - '0' : (BTMAC[i*2] - 'A' + 10)) * 16;
        BTMAC_hex[i] += BTMAC[(i*2)+1] <= '9' ?  BTMAC[(i*2)+1] - '0' : (BTMAC[(i*2)+1] - 'A' + 10);
    }                                                                   // 
    
    sprintf(Proteus_block, "%c%c%c%c%c%c%c%c%c%c",                      // schreibt "%c%c%c%c%c%c%c%c%c%c" in "Proteus_block"               | Berechnung der CheckSumme
            Start_Byte,                                                 //                                                                  |
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            BTMAC_hex[0],                                               //                                                                  | 
            BTMAC_hex[1],                                               //                                                                  | 
            BTMAC_hex[2],                                               //                                                                  | 
            BTMAC_hex[3],                                               //                                                                  | 
            BTMAC_hex[4],                                               //                                                                  | 
            BTMAC_hex[5]);                                              //                                                                  | 
    checksum = FillChecksum(&Proteus_block[0], (4 + Length_raw));       // schreibt das Ergibnis von "FillChecksum" in "checksum"           |
    sprintf(Proteus_data, "%c%c%c%c%c%c%c%c%c%c%c",                     // schreibt "%c%c%c%c%c%c%c%c%c%c%c" in "Proteus_data"              | Zusammensetzen der Nachricht
            Start_Byte,                                                 //                                                                  | 
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            BTMAC_hex[0],                                               //                                                                  | 
            BTMAC_hex[1],                                               //                                                                  | 
            BTMAC_hex[2],                                               //                                                                  | 
            BTMAC_hex[3],                                               //                                                                  | 
            BTMAC_hex[4],                                               //                                                                  | 
            BTMAC_hex[5],                                               //                                                                  | 
            checksum);                                                  //                                                                  | 
    for(i = 0; i < (5 + Length_raw); i++){                              //  
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
}                                                                       // 

void Proteus_SetPasskey(uint8_t passkey[7]){                            // "Proteus_SetPasskey"
    uint8_t staticpasskey;                                              // definiert "staticpasskey"
    int i;                                                              // definiert "i"
    
    Proteus_Deletebonds();                                              // ruft "Proteus_Deletebonds" auf
    Proteus_AktivatePasskey();                                          // ruft "Proteus_AktivatePasskey" auf
    
    Start_Byte = 0x02;                                                  // schreibt "0x02" in "Start_Byte"          | "Start_Byte"
    Command_Byte = 0x11;                                                // schreibt "0x11" in "Command_Byte"        | "Command_Byte"
    Length_Byte_0 = 0x07;                                               // schreibt "0x07" in "Length_Byte_0"       | "Length_Byte_0"
    Length_Byte_1 = 0x00;                                               // schreibt "0x00" in "Length_Byte_1"       | "Length_Byte_1"
    staticpasskey = 0x12;                                               // schreibt "0x12" in "staticpasskey"       | ""
    sprintf(Proteus_block, "%c%c%c%c%c%c%c%c%c%c%c",                    // schreibt "%c%c%c%c%c%c%c%c%c%c%c" in "Proteus_block"             | Berechnung der CheckSumme
            Start_Byte,                                                 //                                                                  |
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            staticpasskey,                                              //                                                                  | 
            passkey[0],                                                 //                                                                  | 
            passkey[1],                                                 //                                                                  | 
            passkey[2],                                                 //                                                                  | 
            passkey[3],                                                 //                                                                  | 
            passkey[4],                                                 //                                                                  | 
            passkey[5]);                                                //                                                                  | 
    checksum = FillChecksum(&Proteus_block[0], 11);                    // schreibt das Ergibnis von "FillChecksum" in "checksum"           |
    sprintf(Proteus_data, "%c%c%c%c%c%c%c%c%c%c%c%c",                   // schreibt "%c%c%c%c%c%c%c%c%c%c%c%c" in "Proteus_data"            | Zusammensetzen der Nachricht
            Start_Byte,                                                 //                                                                  |
            Command_Byte,                                               //                                                                  | 
            Length_Byte_0,                                              //                                                                  | 
            Length_Byte_1,                                              //                                                                  | 
            staticpasskey,                                              //                                                                  | 
            passkey[0],                                                 //                                                                  | 
            passkey[1],                                                 //                                                                  | 
            passkey[2],                                                 //                                                                  | 
            passkey[3],                                                 //                                                                  | 
            passkey[4],                                                 //                                                                  | 
            passkey[5],                                                 //                                                                  | 
            checksum);                                                  //                                                                  | 
    for(i = 0; i < (12); i++){                                          // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_AktivatePasskey(void){                                     // "Proteus_AktivatePasskey"
    int i;                                                              // definiert "i"
    
    Proteus_Deletebonds();                                              // ruft "Proteus_Deletebonds" auf
    
    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x11;                                             // schreibt "0x11" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x0C;                                             // schreibt "0x0C" in "Proteus_data" position "4"   | "RF_SecFlags"
    Proteus_data[5] = 0x0B;                                             // schreibt "0x0B" in "Proteus_data" position "5"   | "static passkey with bonding"
    Proteus_data[6] = 0x16;                                             // schreibt "0x16" in "Proteus_data" position "6"   | "checksum"
    for(i = 0; i < 7; i++){                                             // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_DeaktivatePasskey(void){                                   // "Proteus_DeaktivatePasskey"
    int i;                                                              // definiert "i"
    
    Proteus_Deletebonds();                                              // ruft "Proteus_Deletebonds" auf
    
    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x11;                                             // schreibt "0x11" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x0C;                                             // schreibt "0x0C" in "Proteus_data" position "4"   | "RF_SecFlags"
    Proteus_data[5] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "5"   | ""
    Proteus_data[6] = 0x1D;                                             // schreibt "0x1D" in "Proteus_data" position "6"   | "checksum"
    for(i = 0; i < 7; i++){                                             // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_Factoryreset(void){                                        // "Proteus_Factoryreset"
    int i;                                                              // definiert "i"
    
    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x1C;                                             // schreibt "0x1C" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x1E;                                             // schreibt "0x1E" in "Proteus_data" position "4"   | "checksum"
    for(i = 0; i < 5; i++){                                             // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_Deletebonds(void){                                         // "Proteus_Deletebonds"
    int i;                                                              // definiert "i"
    
    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x0E;                                             // schreibt "0x0E" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x0C;                                             // schreibt "0x0C" in "Proteus_data" position "4"   | "checksum"
    for(i = 0; i < 5; i++){                                             // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_Phyupdate(void){                                           // "Proteus_Phyupdate"
    int i;                                                              // definiert "i"
    
    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x1A;                                             // schreibt "0x1A" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x01;                                             // schreibt "0x01" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x00" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x01;                                             // schreibt "0x01" in "Proteus_data" position "4"   | ""
    Proteus_data[5] = 0x18;                                             // schreibt "0x18" in "Proteus_data" position "5"   | "checksum"
    for(i = 0; i < 6; i++){                                             // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
    __delay_ms(100);                                                    // warte 100ms
}                                                                       // 

void Proteus_Disconnect(void){                                          // "Proteus_Disconnect"
    int i;                                                              // definiert "i"

    Proteus_data[0] = 0x02;                                             // schreibt "0x02" in "Proteus_data" position "0"   | "Start_Byte"
    Proteus_data[1] = 0x07;                                             // schreibt "0x07" in "Proteus_data" position "1"   | "Command_Byte"
    Proteus_data[2] = 0x00;                                             // schreibt "0x30" in "Proteus_data" position "2"   | "Length_Byte_0"
    Proteus_data[3] = 0x00;                                             // schreibt "0x30" in "Proteus_data" position "3"   | "Length_Byte_1"
    Proteus_data[4] = 0x05;                                             // schreibt "0x05" in "Proteus_data" position "4"   |  "checksum"
    
    for(i = 0; i < (5); i++){                                           // 
        UART2_Write(Proteus_data[i]);                                   // schreibt "Proteus_data" an "UART2"  
    }                                                                   // 
}                                                                       //

uint8_t FillChecksum(uint8_t* pArray, uint16_t length){                                                         // "FillChecksum"
    bool ret = false;                                                                                           // definiert "ret"
    uint8_t checksum = 0;                                                                                       // definiert "checksum"
    uint16_t payload_length = 0;                                                                                // definiert "payload_length"
    uint16_t i = 0;                                                                                             // definiert "i"

    if((length >= LENGTH_CMD_OVERHEAD) && (pArray[0] == CMD_STX)){                                              // 
        checksum = (uint8_t)0;                                                                                  // schreibt "0" in "checksum"                         
        payload_length = (uint16_t) (pArray[CMD_POSITION_LENGTH_MSB] << 8) + pArray[CMD_POSITION_LENGTH_LSB];   // 
        i = 0;                                                                                                  // schreibt "0" in "i"
        for(i = 0; i < (payload_length + LENGTH_CMD_OVERHEAD_WITHOUT_CRC); i++){                                // 
            checksum ^= pArray[i];                                                                              // 
        }                                                                                                       // 
        pArray[payload_length + LENGTH_CMD_OVERHEAD_WITHOUT_CRC] = checksum;                                    // 
        ret = true;                                                                                             // schreibt "true" in "ret"
    }                                                                                                           // 
    return checksum;                                                                                            // gibt "checksum" zurück
}                                                                                                               



