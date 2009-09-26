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
      
    case 7:  //address the first nose color
      switch (mode) {
        case 0:
          nose[0].off();
          break;
        case 1:
          nose[0].on();
          break;
        default:
          nose[0].off();
          break;
      }
      break;
      
    case 8:  //address the second nose color
      switch (mode) {
        case 0:
          nose[1].off();
          break;
        case 1:
          nose[1].on();
          break;
        default:
          nose[1].off();
          break;
      }
      break;
      
    case 9:  //address the third nose color
      switch (mode) {
        case 0:
          nose[2].off();
          break;
        case 1:
          nose[2].on();
          break;
        default:
          nose[2].off();
          break;
      }
      break;
      
      case 10:  //address the first hair
      switch (mode) {
        case 0:
          hairs[0].off();
          break;
        case 1:
          hairs[0].on();
          break;
        default:
          hairs[0].off();
          break;
      }
      break;
      
      case 11:  //address the the second hair
      switch (mode) {
        case 0:
          hairs[1].off();
          break;
        case 1:
          hairs[1].on();
          break;
        default:
          hairs[1].off();
          break;
      }
      break;
      
      case 12:  //address the the third hair
      switch (mode) {
        case 0:
          hairs[2].off();
          break;
        case 1:
          hairs[2].on();
          break;
        default:
          hairs[2].off();
          break;
      }
      break;
      
      case 13:  //address the the fourth hair
      switch (mode) {
        case 0:
          hairs[3].off();
          break;
        case 1:
          hairs[3].on();
          break;
        default:
          hairs[3].off();
          break;
      }
      break;
      
      case 14:  //address the the fifth hair
      switch (mode) {
        case 0:
          hairs[4].off();
          break;
        case 1:
          hairs[4].on();
          break;
        default:
          hairs[4].off();
          break;
      }
      break;
      
      case 15:  //address the the sixth hair
      switch (mode) {
        case 0:
          hairs[5].off();
          break;
        case 1:
          hairs[5].on();
          break;
        default:
          hairs[5].off();
          break;
      }
      break;
  }
}
