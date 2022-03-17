#include "setup.h"
#include "defines.h"
#include "display.h"
#include "radio.h"

void setup_loop::setup(void){
#if	defined(USE_DISPLAY)
  // disp.set_info_border(6, 3);
  disp.draw_info_border(6,3);
#endif
}

setup_loop loop_setup;