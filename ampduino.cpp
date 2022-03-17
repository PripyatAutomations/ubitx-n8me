/*
 * Here we include code to talk to modified version of ATU-100 firmware
 *
 * Original firmware: https://github.com/Dfinitski/N7DDC-ATU-100-mini-and-extended-boards.git
 * Patches: https://github.com/PripyatAutomations/ubitx-n8me-firmware/
 *
 * Currently supported are direct connected ATU-100s (via GPIO)
 *
 * Plans to support LoRA or ESP MESH are under review
 */
#include "defines.h"

#if	defined(USE_AMPDUINO)
#include "ampduino.h"

#endif
