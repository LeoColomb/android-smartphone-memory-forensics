# Volatility Framework - Volatile memory extraction utility framework

obj-m += module.o

-include version.mk

all: dwarf 

dwarf: module.c
	$(MAKE) -C $(KSRC_PATH) CONFIG_DEBUG_INFO=y M=$(PWD) modules 
	dwarfdump -di module.ko > module.dwarf 
