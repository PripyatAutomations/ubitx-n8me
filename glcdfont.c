#include "defines.h"
#if	defined(USE_DISPLAY)

//Include the font so that it's built by the arduino
//default builder, despite being in a subdirectory

#include "PDQ_MinLib/glcdfont_min.c"

#include <avr/pgmspace.h>
// const unsigned char glcdfont[] PROGMEM = {0};
#endif
