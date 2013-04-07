
CLEAN += *.hex *.elf

DUDE := $(call bin,avrdude)
OBJCOPY := $(call bin,avr-objcopy)

DUDEOPTS += -C $(DUDECONF)
DUDEOPTS += -c arduino
DUDEOPTS += -V
DUDEOPTS += -p $(DUDEPART)
DUDEOPTS += -b $(DUDEBAUD)
DUDEOPTS += -P $(DEVICE)

ELFFILE := $(OUTDIR)/$(NAME).elf
HEXFILE := $(OUTDIR)/$(NAME).hex

flash: $(HEXFILE)
	$(DUDE) $(DUDEOPTS) flash:w:$(HEXFILE)

OBJCOPYOPTS += --output-target ihex
OBJCOPYOPTS += --remove-section .eeprom
OBJCOPYOPTS += --remove-section .fuse
OBJCOPYOPTS += --remove-section .lock

$(HEXFILE): $(OUTDIR) $(ELFFILE)
	$(OBJCOPY) $(OBJCOPYOPTS) $*.elf $*.hex

ELVES += $(OBJECTS)

OUTPUTS := $(ELFFILE)

$(ELFFILE): $(OUTDIR) $(ELVES)
	$(CC) $(CFLAGS) -o $(ELFFILE) $(ELVES)

