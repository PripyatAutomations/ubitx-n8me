TARGET=ubitx
RADOS_VERSION=0.3.0-git
ARDUINO_LIBS = EEPROM SPI Wire

# Linux tends to put it at /usr/share/arduino, check there
ifneq ("$(wildcard /usr/share/arduino/revisions.txt)","")
ARDUINO_DIR = /usr/share/arduino
endif

# If user has installed arduino into /opt, it's probably
# because the host OS has a broken version, prefer it.
ifneq ("$(wildcard /opt/arduino/arduino)","")
ARDUINO_DIR = /opt/arduino
endif

ifneq ("$(wildcard /usr/bin/avrdude)", "")
AVRDUDE          = /usr/bin/avrdude
AVR_TOOLS_DIR    = /usr
endif

# If the host avrdude is broken, it can be put into /opt/arduino
ifneq ("$(wildcard /opt/arduino/bin/avrdude)", "")
AVRDUDE          = /opt/arduino/bin/avrdude
AVR_TOOLS_DIR    = /opt/arduino
endif

PROJECT_DIR = .
ARDMK_DIR = ./mk
USER_LIB_PATH    :=  ${PROJECT_DIR}/lib
CFLAGS_STD       = -std=gnu11 -I./include
CXXFLAGS_STD     = -std=gnu++11 -Os -I./include
CURRENT_DIR      = $(shell basename ${CURDIR})
OBJDIR           = ${PROJECT_DIR}/bin/${BOARD_TAG}/${CURRENT_DIR}


# Bring in board configuration
include ./board.mk
include $(ARDMK_DIR)/Arduino.mk
include mk/indent.mk
include mk/clean.mk
include mk/install.mk
include mk/customization.mk

world: all

TARBALL_DATE=$(date +%Y-%m-%d)

# Roll a distribution tarball
dist tarball: distclean
	tar -C .. -jcvf ../radOS-${RADOS_VERSION}-${TARBALL_DATE}.tar.bz2 radOS
