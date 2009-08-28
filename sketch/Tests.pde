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
    default:
      response = 1;
  }
  return response;
}

// A simple test to check ear state
byte testSimple() {
  byte response = 0;
  if (leftMouth.getValue() > 100 )
  {
    indicator(1);
  }
  if (leftEar.isPressed()) // if the left ear has been turned on, trigger indicator 2
  {
    indicator(2);
  }
  if (leftMouth.getValue() > 100 )
  {
    indicator(3);
  }
  if (rightEar.isPressed()) // if the right ear has been turned on, trigger indicator 5
  {
    indicator(5);
  }
  if (centerMouth.getValue() > 100 )
  {
    indicator(4);
  }
  return response;
}

// A little test to determine the symmetry of the parts of the whole
byte testSymmetry() {
  byte response = 0;
  byte success = 0;
  if (leftEar.isPressed() == rightEar.isPressed()) {  // if the left and right ear are the same
    indicator(1);
    response += 1;
  }
  if (potEquiv(rightEye.getValue(),leftEye.getValue(),25)){  // if the right and left eyes are the same
    indicator(2);
    response += 1;
  }
  if (potEquiv(leftMouth.getValue(),rightMouth.getValue(),25)){   // if the left and right mouth sliders are roughly equivalent
    indicator(3);
    response += 1;
  }
  if (potEquiv(centerMouth.getValue(),avgMouth(),25)){  // if the center mouth slider is equal to the avg
    indicator(4);
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
      indicator(1);
      indicator(2);
      if (potEquiv(rightEye.getValue(),leftEye.getValue(),10)) {
        indicator(3);
        response += 1;
      }
      if (centerMouth.getValue() >= 25) {
        indicator(4);
        response += 1;
      }
      if (response == 2 ) success = 1;
      break;
    case 2:
      indicator(2);
      if (potEquiv(rightMouth.getValue(),leftMouth.getValue(),10)) {
        indicator(3);
        response += 1;
      }
      if (centerMouth.getValue() >= 50 && centerMouth.getValue() <= 100) {
        indicator(4);
        response += 1;
      }
      if (response >= 1) indicator(1);
      if (response >= 2) success = 1;
      break;
  }
  
  return success;
}
