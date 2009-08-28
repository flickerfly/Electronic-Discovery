// type is the type of indicator and mode is the mode that indicator should
// act as. For example, mode for an LED would be on, off or blink
void indicator(int type, int mode) {
  switch (type) {
    case 1:  // address the white hair LEDs
      switch (mode) {
         case 0: // turn them all off
           for(byte i=0; i<2; i++) whiteHairs[i]->off();
           break;
         case 1: // turn them all on
           for(byte i=0; i<2; i++) whiteHairs[i]->on();
           break;
         case 3: // blink them all
           for(byte i=0; i<2; i++) whiteHairs[i]->blink(300,1);
           break;
      }
      break;
    case 2:  // address the green hair LEDs
      switch (mode) {
         case 0: // turn them all off
           for(byte i=0; i<2; i++) greenHairs[i]->off();
           break;
         case 1: // turn them all on
           for(byte i=0; i<2; i++) greenHairs[i]->on();
           break;
         case 3: // blink them all
           for(byte i=0; i<2; i++) greenHairs[i]->blink(300,1);
           break;
      }
      break;
    case 3:  // address the red hairs
      switch (mode) {
         case 0: // turn them all off
           for(byte i=0; i<2; i++) redHairs[i]->off();
           break;
         case 1: // turn them all on
           for(byte i=0; i<2; i++) redHairs[i]->on();
           break;
         case 3: // blink them all
           for(byte i=0; i<2; i++) redHairs[i]->blink(300,1);
           break;
      }
      break;
    case 4:  // blink the nose LED
      switch (mode) {
        default:
          nose[0].blink(500,1);
          nose[1].blink(500,1);
          nose[2].blink(500,1);
          break;
      }
      break;
    case 5:  // sound the buzzer
      buzzer.playTone(440,2);
      buzzer.playTone(770,5);
      buzzer.playTone(440,2);
      break;
    case 6:
      buzzer.beep(mode);
      break;
  }
}
