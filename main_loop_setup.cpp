#include "defines.h"
#include "main_loop.h"
#include "display.h"
#include "radio.h"

void main_loop::setup(void) {
  radio_obj.rotary_mode = RM_VFO; 
#if	defined(USE_DISPLAY)
  disp.reset_persistants();
  disp.set_info_border(6, 2);
  update_vfo(false);
  update_vfo(true);
#endif

}