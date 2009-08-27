void indicator(int lvl) {
  switch (lvl) {
    case 1:  // blink the white hair LEDs
      for(byte i=0; i<2; i++) whiteHairs[i]->blink(300,1);
      break;
    case 2:  // blink the green hair LEDs
      for(byte i=0; i<2; i++) greenHairs[i]->blink(300,1);
      break;
    case 3:  // blink the red hair LEDs
      for(byte i=0; i<2; i++) redHairs[i]->blink(300,1);
      break;
    case 4:  // blink the red hair LED
      nose[0].blink(500,1);
      nose[1].blink(500,1);
      nose[2].blink(500,1);
      break;
    case 5:  // sound the buzzer
      buzzer.playTone(440,2);
      buzzer.playTone(770,5);
      buzzer.playTone(440,2);
      break;
    case 6:
      buzzer.beep(220);
      break;
  }
}
