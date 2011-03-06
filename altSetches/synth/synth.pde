#include <Summer.h>
#include <LED.h>
#include <Potentiameter.h>
#include <Button.h>

/* 
 * Author: Josiah Ritchie <josiah@josiahritchie.com>
 * Adjust mouth to change hairs
 * Adjust eyes to change the tone in the piezo
 * Adjust arms to change the nose
 */

// settings
int eyeLvl = 0;
int mouthLvl = 0;

// Ears 
Button leftEar = Button(12, PULLUP);
Button rightEar = Button(13, PULLUP);

// Eyes
Potentiometer leftEye = Potentiometer(0);
Potentiometer rightEye = Potentiometer(4);

// Mouth
Potentiometer leftMouth = Potentiometer(1);
Potentiometer centerMouth = Potentiometer(2);
Potentiometer rightMouth = Potentiometer(3);

// Hair
const byte numHairs = 6;
LED hairs[numHairs] = { LED(2), LED(3), LED(4), LED(5), LED(7), LED(8), };
// The following arrays include pointers to the previous LED array. They are not copies but the exact same instance
LED* whiteHairs[2] = { &hairs[0], &hairs[5] };
LED* greenHairs[2] = { &hairs[1], &hairs[4] };
LED* redHairs[2] = { &hairs[2], &hairs[3] };

// Nose
const byte numNose = 3;
LED nose[numNose] = { LED(9), LED(10), LED(11) };
LED* redNose = &nose[0];
LED* greenNose = &nose[1];
LED* blueNose = &nose[2];

void setup() {
  buzzer.setTempo(1000);
  nose[0].on();
  nose[1].on();
  nose[2].on();
}

void loop() {
  setHair(); 
  setNose();
  setTempo();
  soundBuzzer();
}

void setHair() {
  // light the hairs sequentially according to the total mouth sliders
  mouthLvl = totalMouth(); //divide by something that will make this 0-6
  //set the # of LEDs equal to mouthLvl
}

void setNose() {
  // set on color to one switch, another to
  earLvl = totalEars();
  earOne = leftEar.isPressed();
  earTwo = rightEar.isPressed();

  // if both eyes, go green and break
  // if eyeOne go red
  // if eyeTwo go blue
}

void setTempo() {
  tempo = totalMouth();
  buzzer.setTempo(tempo);
}

void soundBuzzer() {
  // use one eye and the other eye as the two parameters to the buzzer
  freq = leftEye.getValue();
  beats = rightEye.getValue();
  buzzer.playTone(freq,beats);
}
