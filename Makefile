#
# $Id: Makefile 38 2004-09-11 11:15:09Z erwin $
#

ifneq ($(KERNELRELEASE),)

obj-m := dmx_usb.o

else

KDIR	:= /lib/modules/$(shell uname -r)/build
PWD	:= $(shell pwd)

default:
	$(MAKE) -C $(KDIR) SUBDIRS=$(PWD) modules
	gcc -O2 -pipe dmx_usb_test.c -o dmx_usb_test

endif

clean:
	rm *.o *.ko
	rm dmx_usb_test


