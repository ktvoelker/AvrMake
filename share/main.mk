
ROOT := $(AVRMAKE)/share

.PHONY = all main clean


##
# Default target
##

all: main


##
# Source configuration
##

INCLUDE ?=
LIBRARY ?= false
ifeq ($(LIBRARY),false)
NAME ?= main
else
NAME ?=
endif

ifndef NAME
$(error NAME is not defined)
endif


##
# User configuration
##

USER := $(HOME)/.avrmake
$(shell mkdir -p $(USER))

USERCONF := $(USER)/config.mk
$(shell touch -a $(USERCONF))
include $(USERCONF)

ifndef DEVICE
$(error DEVICE not defined)
endif


##
# Platform
##

PLATFORM ?= uno
include $(ROOT)/platform/$(PLATFORM).mk


##
# Arduino
##

ifdef ARDUINO
bin = $(ARDUINO)/hardware/tools/avr/bin/$(1)
include $(ROOT)/arduino.mk
else
bin = $(shell which $(1))
endif


##
# Sources
##

include $(ROOT)/sources.mk


##
# Library or Program
##

ifeq ($(LIBRARY), true)
include $(ROOT)/library.mk
else
ifeq ($(LIBRARY), false)
include $(ROOT)/program.mk
else
$(error Invalid value of LIBRARY: $(LIBRARY))
endif
endif


##
# Common build rules
##

include $(ROOT)/common.mk


##
# Main target
##

ifeq ($(ROOT), $(CURDIR))
main:
	for i in $(wildcard src/*); do cd $$i && make; done
else
main: $(OUTPUTS)
	true
endif

##
# Clean target
##

clean:
	-rm $(CLEAN)

