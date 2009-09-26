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
byte difficultyLvl = 5;

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
LED* redNose = &nose[2];
LED* greenNose = &nose[0];
LED* blueNose = &nose[1];

// Misc
byte completed = 0; // by default, the test is incomplete
Summer buzzer = Summer(6); // setup a buzzer object
int loopCount = 0;
// if you want to see debug information turn on
byte debug = 0;
// for setting difficultyLvl via serial connection 
byte serial = 0;


void setup() {
  buzzer.setTempo(1000);
  if ( debug == 1 || serial == 1 ) {  // serial is only used for debug or setting diff lvl (remove when this changes)
    Serial.begin(115200);           // set up Serial library speed
  }
  nose[0].on();
  nose[1].on();
  nose[2].on();
}

void loop()
{
  completed = test(difficultyLvl);       // Run the level of difficulty test and return the results
  if (completed == 1) success();             // Check if completion indicator has changed
  difficultyLvl = readDifficulty();            // Set difficulty level
  completed = 0;
  if (debug >= 3) {  // if debug is greater than 2, track each loop, good for getting a feel for how quickly 
                     // each change to pots and switches are evaluated and responded too
    Serial.print("completed loop ");
    loopCount += 1;
    Serial.println(loopCount);
  }
}

int readDifficulty() {                          // Edit to allow setting of various difficulty levels
  if ( completed == 1 ) {
    switch (difficultyLvl) {
      case 1:
        difficultyLvl = 1;
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        difficultyLvl = 5;
        break;
      default:
        break; 
    }
  }  
  return difficultyLvl;
  if (serial == 1) {
    // NOTE: permit setting difficulty level via serial or dip switch see serial variable
  }
}

void success() {   // make nose blue
  nose[0].on(); //turn the nose off (they're inverted)
  nose[1].on();
  nose[2].on();
  
  blueNose->blink(1500,5);   // Turn blue nose on
  indicator(5,5);  //sound the buzzer pattern 5 times
}
