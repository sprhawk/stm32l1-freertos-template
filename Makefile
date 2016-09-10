
GCC_ROOT = $(HOME)/Developer/prjs/embeded/gcc-arm-none-eabi-5_4-2016q2/
# GCC_ROOT = $(HOME)/Developer/prjs/embeded/gcc-arm-none-eabi-4_8-2014q2/
# GNU_VERSION := 5.4.1
GNU_PREFIX := arm-none-eabi

OPENOCD_ROOT = $(HOME)/Developer/prjs/embeded/openocd-bin-0.9.0/


# System libraries paths
SDK_ROOT = ../../STM32Cube_FW_L1_V1.6.0/
DRIVERS_ROOT = $(SDK_ROOT)Drivers/
HAL_DRIVER_ROOT = $(DRIVERS_ROOT)STM32L1xx_HAL_Driver/
CMSIS_ROOT = $(DRIVERS_ROOT)CMSIS/
BSP_ROOT = $(DRIVERS_ROOT)BSP/
MIDDLEWARE_ROOT = $(SDK_ROOT)Middlewares/

FREERTOS_ROOT = ../freertos/
SEARCH_PATH += $(FREERTOS_ROOT)include/ $(FREERTOS_ROOT)portable/GCC/ARM_CM3/
SEARCH_PATH += $(FREERTOS_ROOT)CMSIS_RTOS/
FREERTOS_SOURCE += portable/GCC/ARM_CM3/port.c
FREERTOS_SOURCE += portable/MemMang/heap_3.c
FREERTOS_SOURCE += event_groups.c list.c queue.c timers.c tasks.c
FREERTOS_SOURCE += CMSIS_RTOS/cmsis_os.c
C_SOURCE_FILES += $(addprefix $(FREERTOS_ROOT), $(FREERTOS_SOURCE))

# Project source code path
PROJECT_ROOT = $(shell pwd)/
FIRMWARE_DIR = $(PROJECT_ROOT)firmware/
LINKER_SCRIPT = $(PROJECT_ROOT)system/STM32L152RETx_FLASH.ld

CFLAGS += -DSTM32L152xE -DUSE_STM32L1XX_NUCLEO -DUSE_HAL_DRIVER
# CFLAGS += -O0 -g

# defined in stm32l1xx_hal_conf.h
# CFLAGS += -DHS_VALUE=8000000

# project related
SEARCH_PATH += $(PWD)
C_SOURCE_FILES += main.c 

TARGET = main
OUTPUT_DIR = build/

# system and startup code
SEARCH_PATH += system
C_SOURCE_PATH += $(PROJECT_ROOT)system/ 
C_SOURCE_FILES += system_stm32l1xx.c stm32l1xx_it.c # stm32f4xx_hal_msp.c
ASM_SOURCE_PATH += $(PROJECT_ROOT)system/
ASM_SOURCE_FILES += startup_stm32l152xe.s

# stm32f4xx device related
SEARCH_PATH += $(CMSIS_ROOT)Include/
SEARCH_PATH += $(CMSIS_ROOT)Device/ST/STM32L1xx/Include/
C_SOURCE_PATH += $(sort $(dir $(shell find $(CMSIS_ROOT)DSP_Lib/ -iname "*.c" -print)))

# STM32F4-Discovery board related
SEARCH_PATH += $(BSP_ROOT)STM32L1xx_Nucleo/
C_SOURCE_PATH += $(BSP_ROOT)STM32L1xx_Nucleo/
C_SOURCE_FILES += stm32l1xx_nucleo.c

# stm32f4xx HAL related
SEARCH_PATH += $(HAL_DRIVER_ROOT)Inc/
C_SOURCE_PATH += $(HAL_DRIVER_ROOT)Src/
# C_SOURCE_FILES += $(notdir $(shell find $(HAL_DRIVER_ROOT)Src/ -iname "*.c" -print)))
C_SOURCE_FILES += stm32l1xx_hal.c
C_SOURCE_FILES += stm32l1xx_hal_adc.c
C_SOURCE_FILES += stm32l1xx_hal_adc_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_can.c
# C_SOURCE_FILES += stm32l1xx_hal_cec.c
C_SOURCE_FILES += stm32l1xx_hal_cortex.c
# C_SOURCE_FILES += stm32l1xx_hal_crc.c
# C_SOURCE_FILES += stm32l1xx_hal_cryp.c
# C_SOURCE_FILES += stm32l1xx_hal_cryp_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_dac.c
# C_SOURCE_FILES += stm32l1xx_hal_dac_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_dcmi.c
# C_SOURCE_FILES += stm32l1xx_hal_dcmi_ex.c
C_SOURCE_FILES += stm32l1xx_hal_dma.c
# C_SOURCE_FILES += stm32l1xx_hal_dma2d.c
# C_SOURCE_FILES += stm32l1xx_hal_dma_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_dsi.c
# C_SOURCE_FILES += stm32l1xx_hal_eth.c
# C_SOURCE_FILES += stm32l1xx_hal_flash.c
# C_SOURCE_FILES += stm32l1xx_hal_flash_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_flash_ramfunc.c
# C_SOURCE_FILES += stm32l1xx_hal_fmpi2c.c
# C_SOURCE_FILES += stm32l1xx_hal_fmpi2c_ex.c
C_SOURCE_FILES += stm32l1xx_hal_gpio.c
# C_SOURCE_FILES += stm32l1xx_hal_hash.c
# C_SOURCE_FILES += stm32l1xx_hal_hash_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_hcd.c
# C_SOURCE_FILES += stm32l1xx_hal_i2c.c
# C_SOURCE_FILES += stm32l1xx_hal_i2c_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_i2s.c
# C_SOURCE_FILES += stm32l1xx_hal_i2s_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_irda.c
# C_SOURCE_FILES += stm32l1xx_hal_iwdg.c
# C_SOURCE_FILES += stm32l1xx_hal_lptim.c
# C_SOURCE_FILES += stm32l1xx_hal_ltdc.c
# C_SOURCE_FILES += stm32l1xx_hal_ltdc_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_nand.c
# C_SOURCE_FILES += stm32l1xx_hal_nor.c
# C_SOURCE_FILES += stm32l1xx_hal_pccard.c
# C_SOURCE_FILES += stm32l1xx_hal_pcd.c
# C_SOURCE_FILES += stm32l1xx_hal_pcd_ex.c
C_SOURCE_FILES += stm32l1xx_hal_pwr.c
C_SOURCE_FILES += stm32l1xx_hal_pwr_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_qspi.c
C_SOURCE_FILES += stm32l1xx_hal_rcc.c
# C_SOURCE_FILES += stm32l1xx_hal_rcc_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_rng.c
# C_SOURCE_FILES += stm32l1xx_hal_rtc.c
# C_SOURCE_FILES += stm32l1xx_hal_rtc_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_sai.c
# C_SOURCE_FILES += stm32l1xx_hal_sai_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_sd.c
# C_SOURCE_FILES += stm32l1xx_hal_sdram.c
# C_SOURCE_FILES += stm32l1xx_hal_smartcard.c
# C_SOURCE_FILES += stm32l1xx_hal_spdifrx.c
C_SOURCE_FILES += stm32l1xx_hal_spi.c
# C_SOURCE_FILES += stm32l1xx_hal_sram.c
# C_SOURCE_FILES += stm32l1xx_hal_tim.c
# C_SOURCE_FILES += stm32l1xx_hal_tim_ex.c
# C_SOURCE_FILES += stm32l1xx_hal_uart.c
# C_SOURCE_FILES += stm32l1xx_hal_usart.c
# C_SOURCE_FILES += stm32l1xx_hal_wwdg.c
# C_SOURCE_FILES += stm32f4xx_ll_fmc.c
# C_SOURCE_FILES += stm32f4xx_ll_fsmc.c
# C_SOURCE_FILES += stm32f4xx_ll_sdmmc.c
# C_SOURCE_FILES += stm32f4xx_ll_usb.c

# stm32f4xx Middlewares
# SEARCH_PATH += $(sort $(dir $(shell find $(MIDDLEWARE_ROOT)ST/ -iname "*.h" -print)))
# C_SOURCE_PATH += $(sort $(dir $(shell find $(MIDDLEWARE_ROOT)ST/ -iname "*.c" -print)))
# C_SOURCE_FILES += usbd_core.c usbd_ctlreq.c usbd_ioreq.c
# USB CDC
# C_SOURCE_FILES += usbd_cdc.c

include Makefile.config
