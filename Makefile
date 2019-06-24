CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
OBJDUMP = arm-none-eabi-objdump
CFLAGS  = -v -O2 -g -Wall -mthumb -mthumb-interwork
ASFLAGS =  -v -g --warn -mthumb -mthumb-interwork

all: boot.s19 boot.bin boot.lst
	cat boot.lst
	cat boot.map
	cat boot.s19

boot.elf: reset.o main.o
	$(LD) -v -g -Map=boot.map -Tlink.ld --oformat elf32-littlearm -o boot.elf main.o

boot.lst: boot.elf
	$(OBJDUMP) -d -S boot.elf > boot.lst

boot.bin: boot.elf
	$(OBJCOPY) -v -Obinary boot.elf boot.bin

boot.s19: boot.elf
	$(OBJCOPY) -v -Osrec --srec-forceS3 boot.elf boot.s19

clean:
	rm -f reset.o main.o boot.*

