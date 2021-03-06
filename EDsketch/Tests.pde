/** RUNNING AND WRITING TESTS
 * The test() function serves as a router. Each request to test() is routed according to the difficulty 
 * level that is requested. Each difficulty level is mapped to a function that is required to meet 
 * certain expectations.
 *
 * - return a byte (0 or 1) each time it runs 
 * - if the test should be considered successfully met, return 1, otherwise 0
 * 
 * The function may also call the indicator() function to demonstrate progress toward success
 * and will compare the eyes, ears and mouth to determine what needs to happen for the function to return
 * a success.
 *
 * Special attention should be take to not write these functions so that they can check requirements quickly
 * and not bog down the players experience.
 *
 ** NAMING A TEST
 * Preferably, these functions would be named in the format testName(). Meaning, starting with the 
 * lowercase word test and then a CamelCase name.
 */


// A level simply calls a function full of requirements that trigger indicators of success
// and return a 1 when all have succeeded.
byte test(int lvl) {
  byte response = 0;
  switch (lvl) {
    case 1:
      response = testSimple();
      break;
    case 2:
      response = testSymmetry();
      break;
    case 3:
      response = earVarianceTest();
      break;
    case 4:
      response = testSynth();
      break;
    case 5:
      response = testDisplay();
      break;
    default:
      response = 1;
  }
  return response;
}

// A simple test to check ear state
byte testSimple() {
  byte response = 0;
  byte check = 0;
  if (leftMouth.getValue() > 200 )
    { indicator(1,1); check++; } else { indicator(1,0); }
  if (leftEar.isPressed()) // if the left ear has been turned on, trigger indicator 2
    { indicator(2,1); } else { indicator(2,0); }
  if (rightMouth.getValue() > 200 )
    { indicator(3,1); check++; } else { indicator(3,0); }
  if (rightEar.isPressed()) // if the right ear has been turned on, trigger indicator 5
    { indicator(5,1); }
  if (rightEar.isPressed()  && leftEye.getValue() >25 )
    { indicator(6,leftEye.getValue()*2); check++; }
  if (rightEye.getValue() > 50 )
    { indicator(4,0); check++; }
    
  if (check > 2) { response = 1; }  
  return response;
}

// A simple synthesizer 
byte testSynth() {
  byte response = 0;
  indicator(6,avgMouth()*2);
  indicator(6,avgEyes());
  return response;
}

// A little test to determine the symmetry of the parts of the whole
byte testSymmetry() {
  byte response = 0;
  byte success = 0;
  if (leftEar.isPressed() == rightEar.isPressed()) {  // if the left and right ear are the same
    indicator(1,0);
    response += 1;
  }
  if (potEquiv(rightEye.getValue(),leftEye.getValue(),25)){  // if the right and left eyes are the same
    indicator(2,0);
    response += 1;
  }
  if (potEquiv(leftMouth.getValue(),rightMouth.getValue(),25)){   // if the left and right mouth sliders are roughly equivalent
    indicator(3,0);
    response += 1;
  }
  if (potEquiv(centerMouth.getValue(),avgMouth(),25)){  // if the center mouth slider is equal to the avg
    indicator(4,0);
    response += 1;
  }
  if (response >= 4) success = 1;  // if all the requirements are met, set success to 1
  return success;
}


// if the left ear is on, do one test, if the right ear do another
// if neither or both ears are on, always fail

byte earVarianceTest() {
  byte response = 0;
  byte earCondition = 0;
  byte success = 0;
  if (leftEar.isPressed()) earCondition = 1;
  if (rightEar.isPressed()) earCondition = 2;
  if (rightEar.isPressed() && leftEar.isPressed()) earCondition = 0;
  
  switch (earCondition) {
    case 0:
      break;
    case 1:
      indicator(1,0);
      indicator(2,0);
      if (potEquiv(rightEye.getValue(),leftEye.getValue(),10)) {
        indicator(3,0);
        response += 1;
      }
      if (centerMouth.getValue() >= 25) {
        indicator(4,0);
        response += 1;
      }
      if (response == 2 ) success = 1;
      break;
    case 2:
      indicator(2,0);
      if (potEquiv(rightMouth.getValue(),leftMouth.getValue(),10)) {
        indicator(3,0);
        response += 1;
      }
      if (centerMouth.getValue() >= 50 && centerMouth.getValue() <= 100) {
        indicator(4,0);
        response += 1;
      }
      if (response >= 1) indicator(1,0);
      if (response >= 2) success = 1;
      break;
  }
  
  return success;
}

byte testDisplay() {
  byte response = 0;
  byte check = 0;
    
  // Ears
  if (leftEar.isPressed()) {indicator(14,1); } else {indicator(14,0); }
  if (rightEar.isPressed()) {indicator(15,1); } else {indicator(15,0); }
  
  // Eyes
  if (rightEye.getValue() > 100 && rightEye.getValue() < 200) {indicator(10,1); } else {indicator(10,0); }
  if (leftEye.getValue() > 100 && leftEye.getValue() < 200) {indicator(11,1); } else {indicator(11,0); }
  if (rightEye.getValue() > 200) {indicator(12,1); check++; } else {indicator(12,0); }
  if (leftEye.getValue() > 200) {indicator(13,1); check++; } else {indicator(13,0); }
  
  // Mouth
  //if (rightMouth.getValue() < 200) {indicator(8,1); check++;} else {indicator(8,0); }
  //if (leftMouth.getValue() < 200) {indicator(9,1); check++;} else {indicator(9,0); }  
  //if (centerMouth.getValue() < 200) {indicator(7,1); check++;} else {indicator(7,0); }
  indicator(8,rightMouth.getValue());
  indicator(9,leftMouth.getValue());
  indicator(7,centerMouth.getValue());
  
  
  if (rightEar.isPressed() || rightEar.isPressed() ) { indicator(6,leftEye.getValue()); indicator(6,rightEye.getValue()); }
  if (leftEar.isPressed() && rightEar.isPressed() ) { indicator(9,1); } else { indicator(9,0); }
  
  if (check == 5) {response = 1;}
  return response;
}
