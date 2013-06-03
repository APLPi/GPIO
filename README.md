GPIO
====

APL Code for using GPIO (typically via quick2wire interface boards).

To use the Morse code example, you will require:

1) A Dyalog APL Interpreter (see http://packages.dyalog.com)
2) The Quick2Wire GPIO admin tool installed (https://github.com/quick2wire/quick2wire-gpio-admin)
3) An LED which can be controlled using GPIO (the code assumes you have a Quick2Wire expansion board with an LED on port 18)

Instructions:

1) Extract all the files into the same folder
2) Start APL and load the Morse file using for example ]load /home/pi/Morse
3) Initialise the morse code table by calling e.g. Morse.Init '/home/pi/MorseCode.txt'
4) Display morse code by calling e.g. Morse.Display 'SOS'

A video of the result of step 4) can be viewed at http://www.youtube.com/watch?v=xKBS0gtSDQ8
