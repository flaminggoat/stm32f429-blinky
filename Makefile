#Source files
SRC = Src/main.c 
SRC += Src/startup_stm32f429xx.s
SRC += Src/stm32f4xx_it.c
SRC += Src/system_stm32f4xx.c

#Library Source Files
#SRC += Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal.c
#SRC += Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc.c
#SRC += Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_rcc_ex.c
#SRC += Drivers/STM32F4xx_HAL_Driver/Src/stm32f4xx_hal_pwr_ex.c
SRC += Drivers/STM32F4xx_HAL_Driver/Src/*.c
SRC += 
SRC += 

SRC += Drivers/BSP/STM32F429I-Discovery/stm32f429i_discovery.c

#OBJ_NAME specifies the name of our exectuable
OBJ_NAME = Bin/blinky.elf

#CC specifies which compiler we're using
CC = arm-none-eabi-gcc

#Additional include directories
CFLAGS = -IInc
CFLAGS += -IDrivers/STM32F4xx_HAL_Driver/Inc/
CFLAGS += -IDrivers/CMSIS/Device/ST/STM32F4xx/Include/
CFLAGS += -IDrivers/BSP/STM32F429I-Discovery/
CFLAGS += -IDrivers/CMSIS/Include/

#Additional compilation options
CFLAGS += -std=c99 -g -DSTM32F429xx #-Wall
CFLAGS += -mlittle-endian -mthumb -mcpu=cortex-m4 -mthumb-interwork 
CFLAGS += -TSTM32F429ZI_RAM.ld -mfloat-abi=hard -mfpu=fpv4-sp-d16

#This is the target that compiles our executable
all : $(SRC)
	$(CC) $(SRC) $(CFLAGS) -o $(OBJ_NAME)
