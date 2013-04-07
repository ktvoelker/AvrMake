
CSOURCES   := $(wildcard *.c)
CXXSOURCES := $(wildcard *.cpp)

OUTDIR     := out/$(PLATFORM)

$(OUTDIR):
	mkdir -p $(OUTDIR)

COBJECTS   := $(CSOURCES:.c=.o)
CXXOBJECTS := $(CXXSOURCES:.cpp=.oxx)
OBJECTS    := $(foreach obj,$(COBJECTS) $(CXXOBJECTS),$(OUTDIR)/$(obj))

