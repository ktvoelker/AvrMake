
CLEAN += *.o *.oxx


##
# Linking the libraries
##

CFLAGS += $(foreach inc,$(INCLUDE),-I$(USER)/$(inc)/include)

ELVES += $(foreach inc,$(INCLUDE),$(wildcard $(USER)/$(inc)/lib/$(PLATFORM)/*.o*))


##
# Building the sources
##

CC  := $(call bin,avr-gcc)
CXX := $(call bin,avr-g++)

CFLAGS += -I.
CFLAGS += -Wall
CFLAGS += -Os
CFLAGS += -Wl,--gc-sections
CFLAGS += -ffunction-sections
CFLAGS += -fdata-sections

##
# Platform-dependent flags
##

CFLAGS += -DF_CPU=$(CPUSPEED)
CFLAGS += -mmcu=$(MMCU)
CFLAGS += -D$(AVRDEF)

$(OUTDIR)/%.oxx: $(OUTDIR) %.cpp
	$(CXX) $(CFLAGS) -c -o $(OUTDIR)/$*.oxx $*.cpp

$(OUTDIR)/%.o: $(OUTDIR) %.c
	$(CC) $(CFLAGS) -c -o $(OUTDIR)/$*.o $*.c

