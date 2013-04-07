
AvrMake: a simple build system for AVR devices
==============================================

AvrMake is a makefile for building AVR libraries and programs. It can also build the
Arduino core library and other libraries packaged with the Arduino IDE.

Configuration
-------------

The `AVRMAKE` variable must be set to the path of the `AvrMake` directory. The
recommended way to do this is by exporting the variable in your shell. You may also
want to put `${AVRMAKE}/bin` on your `PATH`, although this is not required.

Building a Program
------------------

For a program, just put a `Makefile` in the program's directory that looks like
this:

    NAME := MyProgram
    include $(AVRMAKE)/share/main.mk

To build, run `make`. To flash the program onto a device, run
`make flash DEVICE=/dev/whatever`.

Building a Library
------------------

For a library, the `Makefile` should look like this:

    NAME := MyLibrary
    LIBRARY := true
    include $(AVRMAKE)/share/main.mk

To build, run `make`. To install, run `make install`. Libraries are installed to
`${HOME}/.avrmake`.

To use a library from a program, add a line like this to the program's `Makefile`:

    INCLUDE += MyLibrary

Configuration
-------------

By default, AvrMake builds for the Uno platform. This and other configuration options
can be set on the command line when running `make`, or by putting them into
`$HOME/.avrmake/config.mk`. For example:

    PLATFORM := uno
    DEVICE   := /dev/whatever

Building the Arduino Libraries
------------------------------

AvrMake includes a script for installing the Arduino core library into
`$HOME/.avrmake`. Just run:

    ${AVRMAKE}/bin/install-arduino-core

Note that the ${ARDUINO} variable must point to the Arduino IDE directory. The
core library will be named `Arduino`, so to use it from a program, add this to
the program's `Makefile`:

    INCLUDE += Arduino

To install another library from the Arduino SDK, run:

    ${AVRMAKE}/bin/install-arduino-library LibraryName

Note for Arduino Users
----------------------

If the `${ARDUINO}` variable is set, some directories containing important
Arduino header files will be added to the include path, and the C preprocessor
symbol `ARDUINO` will be defined to the value `104`. (This value is meant to
correspond to the Arduino version, with 104 being 1.0.4. You should use Arduino
1.0.4 until I figure out how to infer that value from the installed IDE.)
