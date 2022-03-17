#include "defines.h"
#if	defined(USE_CW)
#include "display.h"
#include "radio.h"
#include "loop_master.h"
#include "parameter_limits.h"
#include "setup.h"
#include "setup_buttons.h"

const byte CWP_DIGITS = 4;

void display::display_cw_pitch(const bool clear) {
  update_info_number(clear ? __LONG_MAX__ : radio_obj.sidetone_frequency, CWP_DIGITS, INFO_TEXT_SIZE, false);
}

void radio::toggle_cw_pitch(void) {
  in_cw_pitch = !in_cw_pitch;
  rotary_mode = in_cw_pitch ? RM_CWP : RM_VFO;
#if	defined(USE_DISPLAY)
  loop_master::active->update_cw_pitch();
  if (in_cw_pitch) loop_master::active->update_cw_pitch_display();
#endif
  sidetone(in_cw_pitch);
}

void radio::adj_cw_pitch(const bool inc) {
  sidetone_frequency = adj_range(sidetone_frequency, inc, 10, MIN_CWP, MAX_CWP);
  sidetone(false); sidetone(true);  // off and on to change sidetone frequency
#if	defined(USE_DISPLAY)
  loop_master::active->update_cw_pitch_display();
#endif
}

void setup_loop::update_cw_pitch(void) {
#if	defined(USE_DISPLAY)
  highlight_clear_button(BUTTON_CWP, false);
  disp.display_cw_pitch(!radio_obj.in_cw_pitch);
#endif
}

void setup_loop::update_cw_pitch_display(void) {
#if	defined(USE_DISPLAY)
  disp.display_cw_pitch(false);
#endif
}
#endif
