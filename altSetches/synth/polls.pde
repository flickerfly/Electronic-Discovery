int avgMouth(){  // return the average of the mouth sliders
  int a = leftMouth.getValue() + rightMouth.getValue() + centerMouth.getValue();
  a /= 3;
  return a;
}

int avgEyes(){  // returns the average of the eye pots
  int a = leftEye.getValue();
  return a/2;
}

int minMouth(){  // returns the minimum value of the mouth sliders
  int a = min(leftMouth.getValue(), rightMouth.getValue());
  int b = min(a, centerMouth.getValue());
  return b;
}

byte minEars(){ // returns 0 if either, or both, of the two ears is off, 1 otherwise
  return min(leftEar.isPressed(), rightEar.isPressed());
}

int minEyes(){  // returns the smallest value of the two eye pots
  return min(leftEye.getValue(), rightEye.getValue());
}

int maxMouth(){  // returns the largest value of the mouth sliders
  int a = max(leftMouth.getValue(), rightMouth.getValue());
  int b = max(a, centerMouth.getValue());
  return b;
}

byte maxEars(){  // returns 1 if either or both ears is on, 0 otherwise
  return max(leftEar.isPressed(), rightEar.isPressed());
}

int maxEyes(){  // the largest value provided by the eye pots
  return max(leftEye.getValue(), rightEye.getValue());
}

int totalMouth(){  // the sum of the value of each of the mouth sliders
  return leftMouth.getValue() + rightMouth.getValue() + centerMouth.getValue();
}

byte totalEars(){  // the sum of the value of the ear switches
  return leftEar.isPressed() + rightEar.isPressed();
}

int totalEyes(){  // the sum of the eye pots values
  return leftEye.getValue() + rightEye.getValue();
}

byte potEquiv(int val1, int val2, int tol) {  // check if two potentiometers are roughly equivalent
  byte  response = 0;
  if (val1 >= val2 - tol && val1 <= val2 + tol) response = 1;
  return response;
}
