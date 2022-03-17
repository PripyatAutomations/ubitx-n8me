#include "defines.h"
#if	defined(USE_CW)
#include "display.h"
#include "radio.h"
#include "loop_master.h"
#include "parameter_limits.h"
#include "setup.h"
#include "setup_buttons.h"

const byte DELAY_DIGITS = 4;
const byte DELAY_STEP = 1;

void display::display_cw_delay(const bool clear) {
  update_info_number(clear ? __LONG_MAX__ : radio_obj.cw_delaytime * CW_DELAY_MULTIPLE, DELAY_DIGITS, INFO_TEXT_SIZE, false);
}

void radio::toggle_cw_delay(void) {
  in_cw_delay = !in_cw_delay;
  rotary_mode = in_cw_delay ? RM_DELAY : RM_VFO;
#if	defined(USE_DISPLAY)
  loop_master::active->update_cw_delay();
  if (in_cw_delay) loop_master::active->update_cw_delay_display();
#endif
}

void radio::adj_cw_delay(const bool inc) {
  cw_delaytime = adj_range(cw_delaytime, inc, DELAY_STEP, MIN_DELAY, MAX_DELAY);
#if	defined(USE_DISPLAY)
  loop_master::active->update_cw_delay_display();  
#endif
}

void setup_loop::update_cw_delay(void) {
#if	defined(USE_DISPLAY)
  highlight_clear_button(BUTTON_DELAY, false);
  disp.display_cw_delay(!radio_obj.in_cw_delay);
#endif
}

void setup_loop::update_cw_delay_display(void) {
#if	defined(USE_DISPLAY)
  disp.display_cw_delay(false);
#endif
}
#endif
