#ifeq (${CFG_TARGET_AVR}, y)
#install: bin/${CFG_TARGET_BOARD}/${TARGET}/${TARGET}.hex
#	./tools/flash $^ ${CFG_CAT_PORT} ${CFG_FLASH_BAUDRATE} ${CFG_TARGET_SUB}
#endif

install: bin/${BOARD_TAG}/ubitx-firmware/${TARGET}.hex
	/usr/share/arduino/hardware/tools/avrdude -C/usr/share/arduino/hardware/tools/avrdude.conf \
	-v -v -v -v -patmega328p -carduino -P${MONITOR_PORT} -b${FLASH_BAUDRATE} -D -Uflash:w:$<

