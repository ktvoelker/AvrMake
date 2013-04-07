
OUTPUTS := $(OBJECTS)

ILIB := $(USER)/$(NAME)/lib/$(PLATFORM)
IHDR := $(USER)/$(NAME)/include

install: $(OUTPUTS)
	mkdir -p $(ILIB) $(IHDR)
	cp $(OUTDIR)/* $(ILIB)/
	cp *.h $(IHDR)/

