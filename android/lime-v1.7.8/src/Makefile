# LiME - Linux Memory Extractor

obj-m := lime.o
lime-objs := tcp.o disk.o main.o

PWD := $(shell pwd)

default:
	$(MAKE) -C $(KSRC_PATH) M=$(PWD) modules
