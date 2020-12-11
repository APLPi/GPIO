GPIO
====

APL Code for showing morse code using GPIO and an LED

To use the Morse code example, you will require:

1) A Dyalog APL Interpreter (see http://packages.dyalog.com)
2) An LED which can be controlled using GPIO (the code assumes you have an LED on pin 18)
3) The `gpio` command on the RaspberryPi

Instructions:

1) Extract the files Morse.dyalog, Files.dyalog and MorseCode.txt into the same folder
2) Start APL and load the Morse file using `]load` e.g. `]load /home/pi/Morse`
3) Initialise the morse code table by calling `Morse.Init` e.g. `Morse.Init '/home/pi/MorseCode.txt'`
4) Display morse code by calling `Morse.Display` e.g. `Morse.Display 'SOS'`

A video of the result of step 4) can be viewed at http://www.youtube.com/watch?v=xKBS0gtSDQ8
