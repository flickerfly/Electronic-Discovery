# Intro
Electronic Discovery or ED as my kids like to call it is a toy built with the purpose of encouraging and engaging kids imaginations. Lots of different things can be built to allow different feedback through light and sound based on various combinations of pots and buttons. The components are able to be arranged creatively in a face-like pattern allowing for a friendly and inviting appearance, drawing the child a bit more into the project.

Check out more details on the project website:
http://projects.josiahritchie.com

# Notes on Sketch Organization

The Arduino Sketch consists of a number of files that are tabs in the Arduino IDE. You'll notice that it is very modular, dividing out ways to gather data and ways to respond to data in separate tabs. The actual tests can become a simple, "if this then that" type of code easily read and written. The intention is to make it easy to rapidly develop new ways to interact with ED.

    * EDsketch.pde file has the basic setup, loop and variable settings in it.
    * Tests.pde is a collection of what I call tests (the actual code that analyzes input) as well as some logic to help choose which test to run.
    * indicators.pde provides the triggers (called by the tests) to light LEDs or make noise.
    * Polls.pde also assists the tests. These are a set of functions to analyze the various inputs as units. For example, the avgMouth() function is written is Polls.pde. It averages the value of all three mouth sliders and returns a value. Another function compares the value of two pots to see if they are sufficiently similar to warrant triggering an indicator.

# Hardware Abstraction Layer

The simplicity of writing new tests is also dramatically improved through the use of AlphaBeta's Hardware Abstraction Layer (HAL) for Arduino. Specifically:

    * Button: Is it pressed or not?
    * Potentiometer: Used for linear as well as traditional Pots
    * LED: Ummm... LEDs. Yep, it's what you think.
    * Summer: Use a speaker (piezo in this project)

You can find out more about this HAL at the arduino website: http://arduino.cc/playground/Code/HardwareAbstraction
