/*
    (c) 2016 Microchip Technology Inc. and its subsidiaries. You may use this
    software and any derivatives exclusively with Microchip products.

    THIS SOFTWARE IS SUPPLIED BY MICROCHIP "AS IS". NO WARRANTIES, WHETHER
    EXPRESS, IMPLIED OR STATUTORY, APPLY TO THIS SOFTWARE, INCLUDING ANY IMPLIED
    WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY, AND FITNESS FOR A
    PARTICULAR PURPOSE, OR ITS INTERACTION WITH MICROCHIP PRODUCTS, COMBINATION
    WITH ANY OTHER PRODUCTS, OR USE IN ANY APPLICATION.

    IN NO EVENT WILL MICROCHIP BE LIABLE FOR ANY INDIRECT, SPECIAL, PUNITIVE,
    INCIDENTAL OR CONSEQUENTIAL LOSS, DAMAGE, COST OR EXPENSE OF ANY KIND
    WHATSOEVER RELATED TO THE SOFTWARE, HOWEVER CAUSED, EVEN IF MICROCHIP HAS
    BEEN ADVISED OF THE POSSIBILITY OR THE DAMAGES ARE FORESEEABLE. TO THE
    FULLEST EXTENT ALLOWED BY LAW, MICROCHIP'S TOTAL LIABILITY ON ALL CLAIMS IN
    ANY WAY RELATED TO THIS SOFTWARE WILL NOT EXCEED THE AMOUNT OF FEES, IF ANY,
    THAT YOU HAVE PAID DIRECTLY TO MICROCHIP FOR THIS SOFTWARE.

    MICROCHIP PROVIDES THIS SOFTWARE CONDITIONALLY UPON YOUR ACCEPTANCE OF THESE
    TERMS.
*/


#include "ff.h"
#include "../mcc.h"
#include "../../mcc_generated_files/sd_spi/sd_spi.h"

static FATFS drive;
static FIL file;

char dataWrite[400] = {0};                                                      // definiert "dataWrite"
char dataRead[400] = {0};                                                       // definiert "dataRead"

void FatFs_Tasks(void){                                                         // "FatFs_Tasks"
    UINT actualLength;                                                          // definiert "actualLength"
    char data[50] = {0};                                                        // definiert "data"
    char datafilename[50] = {0};                                                // definiert "filename"
    char enter[2] = "\r\n";                                                     // definiert "enter" und schreibt "\r\n" hinein
    
    sprintf(datafilename, "Logdatei.TXT");                                      // schreibt "Logdatei.TXT"
    //sprintf(data, "Werte %.2fC %d" ,                                            // schreibt "Werte %.2fC %d"
    //        temperatur,                                                         // 
    //        count);                                                             // 

    if(SD_SPI_IsMediaPresent() == false){                                       // wenn "SD_SPI_IsMediaPresent" gleich "false"
        LED1_Toggle();                                                          // Blinkt mit LED1
        return;                                                                 // Zurück
    }                                                                           // 
    
    if(f_mount(&drive,"0:",1) == FR_OK){                                        // Wenn Mount von SD-Karte ist gleich "FR_OK"
        if(f_open(&file, datafilename, FA_OPEN_APPEND | FA_READ | FA_WRITE) == FR_OK){ // erzeugt/öffnet "filename"
            f_write(&file, data, sizeof(data)-1, &actualLength );               // schreibt "data" in "file"
            f_write(&file, enter, sizeof(enter)-1, &actualLength );             // schreibt "enter" in "file"
            f_close(&file);                                                     // schließt Datei "file"
        }                                                                       // 
        f_mount(0,"0:",0);                                                      // Dismount SD-Karte 
    }                                                                           // 
}                                                                               // 

void FatFs_configRead(void){                                                    // "FatFs_Configload"
    UINT actualLength;                                                          // definiert "actualLength"
    char datafilenameRead[50] = "config.TXT";                                   // definiert "datafilename" und schreibt "config.TXT" hinein
    
    if(f_mount(&drive,"0:",1) == FR_OK){                                        // Wenn Mount von SD-Karte ist gleich "FR_OK"
        if(f_open(&file, datafilenameRead, FA_READ) == FR_OK){                  // öffnet "datafilenameRead" 
            f_read(&file, &dataRead, sizeof(dataRead)-1, &actualLength);        // liest inhalt von "file" in "dataRead"
            f_close(&file);                                                     // schließt Datei "file"
        }                                                                       // 
        f_mount(0,"0:",0);                                                      // Dismount SD-Karte 
    }                                                                           // 
}                                                                               // 

void FatFs_configWrite(void){                                                   // "FatFs_CryptoStausWrite"
    UINT actualLength;                                                          // definiert "actualLength"
    char datafilenameWrite[50] = "config.TXT";                                  // definiert "datafilenameWrite" und schreibt "config.TXT" hinein

    if(f_mount(&drive,"0:",1) == FR_OK){                                        // Wenn Mount von SD-Karte ist gleich "FR_OK"
        if(f_open(&file, datafilenameWrite, FA_WRITE) == FR_OK){                // öffnet "datafilenameWrite"
            f_write(&file, dataWrite, sizeof(dataWrite)-1, &actualLength);      // schreibt "dataWrite" in "file"
            f_close(&file);                                                     // schließt Datei "file"
        }                                                                       // 
        f_mount(0,"0:",0);                                                      // Dismount SD-Karte 
    }                                                                           // 
}                                                                               // 