#
# Here you should define your Radio and it's components
#
# The build system will figure out the rest...

BOARD_TAG         = nano
BOARD_SUB = atmega328
# Is it an avr type board?
TARGET_AVR = y

# Serial monitor port
MONITOR_PORT      = /dev/ttyUSB*
# Serial monitor (and CAT) baudrate
MONITOR_BAUDRATE  = 115200
FLASH_PROTO=atmega328p

FLASH_BAUDRATE  = 57600

RADIO_TYPE = ubitx


#########
# XXX: Move this stuff into configs!
#########
#######################
# Set the color theme #
#######################
THEME := night
