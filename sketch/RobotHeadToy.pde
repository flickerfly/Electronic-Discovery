#include <Summer.h>
#include <LED.h>
#include <Potentiometer.h>
#include <Button.h>

/*
 * Author: Josiah Ritchie <josiah@josiahritchie.com>
 * Created with assistance by Alexander Brevig
 *
 * Version: 1.0 beta3
 *
 * Alexander Brevig's LED, Button and Potentiameter HALs are required
 *  for more info on these excellent enhancements and download links see:
 *  http://www.arduino.cc/playground/Code/HardwareAbstraction
 * 
 */

//settings
byte difficultyLvl = 1;

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

// Misc
byte completed = 0; // by default, the test is incomplete
Summer buzzer = Summer(6); // setup a buzzer object
int loopCount = 0;
// if you want to see debug information turn on
byte debug = 3;
// for setting difficultyLvl via serial connection 
byte serial = 1;


void setup() {
  buzzer.setTempo(1000);
  if ( debug == 1 || serial == 1 ) {  // serial is only used for debug or setting diff lvl this time, remove if this changes
    Serial.begin(115200);           // set up Serial library at 115200 bps
  }
  nose[0].on();
  nose[1].on();
  nose[2].on();
}

void loop()
{
  completed = test(difficultyLvl);       // Run the level of difficulty test and return the results
  if (completed == 1) success();             // Check if difficulty level has changed
  difficultyLvl = readDifficulty();            // Set difficulty level
  completed = 0;
  if (debug >= 3) {  // if debug is greater than 2, track each loop, good for getting a feel for how quickly 
                     // each change to pots and switches are evaluated and responded too
    Serial.print("completed loop ");
    loopCount += 1;
    Serial.println(loopCount);
  }
  //noseTest();
}

void noseTest() {
  
  nose[0].fadeOut(1500); // actually fade in
  nose[0].fadeIn(1500);  // avtually fade out
  nose[0].on(); //with the multi-color LED, this actually turns it off
  
  nose[1].fadeOut(1500);
  nose[1].fadeIn(1500);
  nose[1].on();
  
  nose[2].fadeOut(1500);
  nose[2].fadeIn(1500);
  nose[2].on();
}

int readDifficulty() {                          // Edit to allow setting of various difficulty levels
  return difficultyLvl;    
  if (serial == 1) {
    // FUTURE: permit setting difficulty level via serial or dip switch see serial variable
  }
}

void success() {   // make nose blue
  for (byte i = 0; i < numHairs; i++) {          // loop through each pin...
    hairs[i].blink(500,5);     // blink 5 times, 100ms for the total run (50ms on and 50ms off)
    buzzer.beep(880);   // find better crescendo buzz success
  }
  completed += 1;
}
