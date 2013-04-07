
CFLAGS += -I$(ARDUINO)/hardware/arduino/variants/$(VARIANT)
CFLAGS += -I$(ARDUINO)/hardware/tools/avr/avr/include
# TODO get this number from the Arduino installation
CFLAGS += -DARDUINO=104

