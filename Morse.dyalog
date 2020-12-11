:Namespace Morse
   ⍝ Requires https://github.com/quick2wire/quick2wire-gpio-admin
   ⍝∇:require =/Files

    rate←200÷1000 ⍝ length of "dit" = 200ms ("dah" will be 3x this)
    gpio_pin←18   ⍝ Use GPIO pin 18

    ∇ Init filename;t
      ⍝ Read MorseCode.txt file (actual name passed as argument)
      t←⎕FMT #.Files.GetText filename ⍝ Read file into matrix
      Chars←t[;1],' '       ⍝ Chars are in column 1 (and add space)
      Codes←(↓0 1↓t)~¨' '   ⍝ Codes are everything from column 1
      Codes,←⊂'  '          ⍝ Space is as a double long pause
    ∇
    
    ∇ Display message;direction;value;folder;m;didah;is;index;output;duration
     ⍝ Output Morse code using LED connected to GPIO pin
     
      is←{(⍕⍵)⎕NREPLACE ⍺ 0} ⍝ Write to offset 0 of a file
      index←Chars⍳message    ⍝ Look message up in Chars
     
      :If ∨/m←index>⍴Chars   ⍝ Any chars not found?
          ('UNSUPPORTED CHARS: ',m/message)⎕SIGNAL 11
      :Else ⋄ output←∊Codes[index],¨','      ⍝ one long string, w/"," between symbols
      :EndIf
     
      folder←'/sys/class/gpio/gpio',⍕gpio_pin
      ⎕SH'gpio export ',⍕gpio_pin ⍝ Creates "direction" and "value"
      direction←(folder,'/direction')⎕NTIE 0 ⍝ Open the
      value←(folder,'/value')⎕NTIE 0         ⍝   GPIO files
      direction is'out'                      ⍝ We are doing output
     
      :For didah :In output
          duration←(1 3 3 7)['.-, '⍳didah]
          value is didah∊'.-'                ⍝ Turn light on if dit or dah
          ⎕DL duration×rate                  ⍝ Wait
          value is 0                         ⍝ Turn off
          ⎕DL rate                           ⍝ Inter-didah pause
      :EndFor
     
      ⎕NUNTIE direction value
      ⎕SH'gpio-admin unexport ',⍕gpio_pin
    ∇

:EndNamespace
