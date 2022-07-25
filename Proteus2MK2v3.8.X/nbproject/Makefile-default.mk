#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

ifdef SUB_IMAGE_ADDRESS
SUB_IMAGE_ADDRESS_COMMAND=--image-address $(SUB_IMAGE_ADDRESS)
else
SUB_IMAGE_ADDRESS_COMMAND=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=mcc_generated_files/drivers/spi_master.c mcc_generated_files/fatfs/ffunicode.c mcc_generated_files/fatfs/ffsystem.c mcc_generated_files/fatfs/diskio.c mcc_generated_files/fatfs/ff.c mcc_generated_files/fatfs/fatfs.c mcc_generated_files/fatfs/fatfs_demo.c mcc_generated_files/sd_spi/sd_spi.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/spi1_driver.c mcc_generated_files/uart1.c mcc_generated_files/uart2.c main.c proteus2.c command.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/main.o ${OBJECTDIR}/proteus2.o ${OBJECTDIR}/command.o
POSSIBLE_DEPFILES=${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o.d ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o.d ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o.d ${OBJECTDIR}/mcc_generated_files/mcc.o.d ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d ${OBJECTDIR}/mcc_generated_files/clock.o.d ${OBJECTDIR}/mcc_generated_files/system.o.d ${OBJECTDIR}/mcc_generated_files/traps.o.d ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d ${OBJECTDIR}/mcc_generated_files/uart1.o.d ${OBJECTDIR}/mcc_generated_files/uart2.o.d ${OBJECTDIR}/main.o.d ${OBJECTDIR}/proteus2.o.d ${OBJECTDIR}/command.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o ${OBJECTDIR}/mcc_generated_files/mcc.o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o ${OBJECTDIR}/mcc_generated_files/pin_manager.o ${OBJECTDIR}/mcc_generated_files/clock.o ${OBJECTDIR}/mcc_generated_files/system.o ${OBJECTDIR}/mcc_generated_files/traps.o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o ${OBJECTDIR}/mcc_generated_files/uart1.o ${OBJECTDIR}/mcc_generated_files/uart2.o ${OBJECTDIR}/main.o ${OBJECTDIR}/proteus2.o ${OBJECTDIR}/command.o

# Source Files
SOURCEFILES=mcc_generated_files/drivers/spi_master.c mcc_generated_files/fatfs/ffunicode.c mcc_generated_files/fatfs/ffsystem.c mcc_generated_files/fatfs/diskio.c mcc_generated_files/fatfs/ff.c mcc_generated_files/fatfs/fatfs.c mcc_generated_files/fatfs/fatfs_demo.c mcc_generated_files/sd_spi/sd_spi.c mcc_generated_files/mcc.c mcc_generated_files/interrupt_manager.c mcc_generated_files/pin_manager.c mcc_generated_files/clock.c mcc_generated_files/system.c mcc_generated_files/traps.c mcc_generated_files/spi1_driver.c mcc_generated_files/uart1.c mcc_generated_files/uart2.c main.c proteus2.c command.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=24FJ128GB204
MP_LINKER_FILE_OPTION=,--script=p24FJ128GB204.gld
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/c98740bcdaaa13f9638500a7336c28e9956a5739 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o: mcc_generated_files/fatfs/ffunicode.c  .generated_files/flags/default/cf9207d2e174357c6aff23d6a71297f3db3b71b5 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ffunicode.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o: mcc_generated_files/fatfs/ffsystem.c  .generated_files/flags/default/f3c569aa024e90c578e067310473b616d0c9dd45 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ffsystem.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o: mcc_generated_files/fatfs/diskio.c  .generated_files/flags/default/5a85bed71b7161be16c9d3c38e6c1bc876cd21ec .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/diskio.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ff.o: mcc_generated_files/fatfs/ff.c  .generated_files/flags/default/c000182b6a3c06601070bf586556fee3b3326059 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ff.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ff.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o: mcc_generated_files/fatfs/fatfs.c  .generated_files/flags/default/a265112c9514a55b44822fed64058436bb250d72 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/fatfs.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o: mcc_generated_files/fatfs/fatfs_demo.c  .generated_files/flags/default/4ab707ddb1d69e2381319c063a3a0bf77995ef3 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/fatfs_demo.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o: mcc_generated_files/sd_spi/sd_spi.c  .generated_files/flags/default/ab06203b36261695a2c30afbd6653167dcef5dda .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/sd_spi" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/sd_spi/sd_spi.c  -o ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/d114e035facdb816e55a07186902b8b86cbef020 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/d4fbafea44e14566808bd07f469cbd16bdd8e834 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/9b2c716f8c33d6f992ddfedf84259d2af30c6c26 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/c38e2f3444d4a8c1f3b6d647c2eff2b292fcbd99 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/3d8b9a09c43b3c551fa2b8f3ccc9dddbc8b2b9f9 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/3106e055cf667660f8bedd0013300ef07d1559b9 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/45084b46e2952509b4b949a567ae2abb3a372fff .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/393888581992307d39e39f44c63191a9bdd300df .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  .generated_files/flags/default/c11cdced98785af3982fb8d5c948912a70a386dc .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/cbc4b53e29d8226ecd8a13e839ffa929647a2049 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/proteus2.o: proteus2.c  .generated_files/flags/default/d75824c77256dc2bf08c3be0cf6a82476949abc7 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/proteus2.o.d 
	@${RM} ${OBJECTDIR}/proteus2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  proteus2.c  -o ${OBJECTDIR}/proteus2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/proteus2.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/command.o: command.c  .generated_files/flags/default/a34343309c6e51088937f2b457190c2b9a55c89f .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/command.o.d 
	@${RM} ${OBJECTDIR}/command.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  command.c  -o ${OBJECTDIR}/command.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/command.o.d"      -g -D__DEBUG   -mno-eds-warn  -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
else
${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o: mcc_generated_files/drivers/spi_master.c  .generated_files/flags/default/b3945af009d93a596c66656337875881f3ad1df1 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/drivers" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/drivers/spi_master.c  -o ${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/drivers/spi_master.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o: mcc_generated_files/fatfs/ffunicode.c  .generated_files/flags/default/732ddecfa47605a41d9ffc1a5831c7c0e5c85bd4 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ffunicode.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ffunicode.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o: mcc_generated_files/fatfs/ffsystem.c  .generated_files/flags/default/31bad7b790b95cc4dea905f1f61c99523b593e4 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ffsystem.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ffsystem.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o: mcc_generated_files/fatfs/diskio.c  .generated_files/flags/default/df2e51da507865aca221e8a61bf8d71d5c03a72e .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/diskio.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/diskio.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/ff.o: mcc_generated_files/fatfs/ff.c  .generated_files/flags/default/2742d913eb9597351f7e36b4dc21300c416aa19 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/ff.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/ff.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/ff.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o: mcc_generated_files/fatfs/fatfs.c  .generated_files/flags/default/228aca4856dc79683caf1943880641354b305295 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/fatfs.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/fatfs.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o: mcc_generated_files/fatfs/fatfs_demo.c  .generated_files/flags/default/d3d0c20fe7bae0a4c9979e8244951ac51833afd8 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/fatfs" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/fatfs/fatfs_demo.c  -o ${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/fatfs/fatfs_demo.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o: mcc_generated_files/sd_spi/sd_spi.c  .generated_files/flags/default/14604a1ab608cc93c01d706934faa19806e12e6d .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files/sd_spi" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/sd_spi/sd_spi.c  -o ${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/sd_spi/sd_spi.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/mcc.o: mcc_generated_files/mcc.c  .generated_files/flags/default/42a8bce8808fb8a5150ec8c43a9f7a15fde17090 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/mcc.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/mcc.c  -o ${OBJECTDIR}/mcc_generated_files/mcc.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/mcc.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/interrupt_manager.o: mcc_generated_files/interrupt_manager.c  .generated_files/flags/default/2c265706f931962b20e75efda0ff1992f5b8004b .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/interrupt_manager.c  -o ${OBJECTDIR}/mcc_generated_files/interrupt_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/interrupt_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/pin_manager.o: mcc_generated_files/pin_manager.c  .generated_files/flags/default/4f89fd4b5c4ce2a75e1a7f16e70ec54cabdc7366 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/pin_manager.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/pin_manager.c  -o ${OBJECTDIR}/mcc_generated_files/pin_manager.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/pin_manager.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/clock.o: mcc_generated_files/clock.c  .generated_files/flags/default/abdf0a0e1295e11ad1145e2139119f117c12c303 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/clock.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/clock.c  -o ${OBJECTDIR}/mcc_generated_files/clock.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/clock.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/system.o: mcc_generated_files/system.c  .generated_files/flags/default/c2ea557456fcdef3b777d667880fe23f4fa4260a .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/system.c  -o ${OBJECTDIR}/mcc_generated_files/system.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/system.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/traps.o: mcc_generated_files/traps.c  .generated_files/flags/default/f477f156395063473f1a2345efda190b3387f6b0 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/traps.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/traps.c  -o ${OBJECTDIR}/mcc_generated_files/traps.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/traps.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/spi1_driver.o: mcc_generated_files/spi1_driver.c  .generated_files/flags/default/7ccf4b61cbe3f82e74417887cf8aded6d3ef0915 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/spi1_driver.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/spi1_driver.c  -o ${OBJECTDIR}/mcc_generated_files/spi1_driver.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/spi1_driver.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart1.o: mcc_generated_files/uart1.c  .generated_files/flags/default/537202212c9cabdfe220152e72d5e4865843b801 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart1.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart1.c  -o ${OBJECTDIR}/mcc_generated_files/uart1.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart1.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/mcc_generated_files/uart2.o: mcc_generated_files/uart2.c  .generated_files/flags/default/2570e9ef2d880ee05a6b9fe6e89919439420d407 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}/mcc_generated_files" 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o.d 
	@${RM} ${OBJECTDIR}/mcc_generated_files/uart2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  mcc_generated_files/uart2.c  -o ${OBJECTDIR}/mcc_generated_files/uart2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/mcc_generated_files/uart2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/main.o: main.c  .generated_files/flags/default/86282538aff775cc2cf9cac96abd463ec734c52d .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/main.o.d 
	@${RM} ${OBJECTDIR}/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  main.c  -o ${OBJECTDIR}/main.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/main.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/proteus2.o: proteus2.c  .generated_files/flags/default/7165ff4d04806c82bde1d5d3781427a2cceabfe1 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/proteus2.o.d 
	@${RM} ${OBJECTDIR}/proteus2.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  proteus2.c  -o ${OBJECTDIR}/proteus2.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/proteus2.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
${OBJECTDIR}/command.o: command.c  .generated_files/flags/default/abfe4a8ebd2309fe2d2e488bf5ab7e3997bbc9c0 .generated_files/flags/default/70652d2c6c28a72ad6785975c7f63c53d012c863
	@${MKDIR} "${OBJECTDIR}" 
	@${RM} ${OBJECTDIR}/command.o.d 
	@${RM} ${OBJECTDIR}/command.o 
	${MP_CC} $(MP_EXTRA_CC_PRE)  command.c  -o ${OBJECTDIR}/command.o  -c -mcpu=$(MP_PROCESSOR_OPTION)  -MP -MMD -MF "${OBJECTDIR}/command.o.d"      -mno-eds-warn  -g -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -O0 -msmart-io=1 -Wall -msfr-warn=off    -mdfp="${DFP_DIR}/xc16"
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemblePreproc
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -D__DEBUG=__DEBUG   -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)   -mreserve=data@0x800:0x81B -mreserve=data@0x81C:0x81D -mreserve=data@0x81E:0x81F -mreserve=data@0x820:0x821 -mreserve=data@0x822:0x823 -mreserve=data@0x824:0x827 -mreserve=data@0x82A:0x84F   -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,-D__DEBUG=__DEBUG,,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}      -mcpu=$(MP_PROCESSOR_OPTION)        -omf=elf -DXPRJ_default=$(CND_CONF)  -legacy-libc  $(COMPARISON_BUILD)  -Wl,--local-stack,,--defsym=__MPLAB_BUILD=1,$(MP_LINKER_FILE_OPTION),--stack=16,--check-sections,--data-init,--pack-data,--handles,--isr,--no-gc-sections,--fill-upper=0,--stackguard=16,--no-force-link,--smart-io,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map",--report-mem,--memorysummary,dist/${CND_CONF}/${IMAGE_TYPE}/memoryfile.xml$(MP_EXTRA_LD_POST)  -mdfp="${DFP_DIR}/xc16" 
	${MP_CC_DIR}\\xc16-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Proteus2MK2v3.8.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} -a  -omf=elf   -mdfp="${DFP_DIR}/xc16" 
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
