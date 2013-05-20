:Namespace Morse
    ⍝ Converted from the quick2wire-python-api
    ⍝ For more information see https://github.com/quick2wire/quick2wire-python-api

    rate←200 ⍝ dit= 200ms

    morse←0 2⍴0    ⍝ Set up morse table
    morse⍪←'A' '.-'                   
    morse⍪←'B' '-...'                 
    morse⍪←'C' '-.-.'                 
    morse⍪←'D' '-..'                  
    morse⍪←'E' '.'                    
    morse⍪←'F' '..-.'                 
    morse⍪←'G' '--.'                  
    morse⍪←'H' '....'                 
    morse⍪←'I' '..'                   
    morse⍪←'J' '.---'                 
    morse⍪←'K' '-.-'                  
    morse⍪←'L' '.-..'                 
    morse⍪←'M' '--'                   
    morse⍪←'N' '-.'                   
    morse⍪←'O' '---'                  
    morse⍪←'P' '.--.'                 
    morse⍪←'Q' '--.-'                 
    morse⍪←'R' '.-.'                  
    morse⍪←'S' '...'                  
    morse⍪←'T' '-'                    
    morse⍪←'U' '..-'                  
    morse⍪←'V' '...-'                 
    morse⍪←'W' '.--'                  
    morse⍪←'X' '-..-'                 
    morse⍪←'Y' '-.--'                 
    morse⍪←'Z' '--..'                 
    morse⍪←'1' '.----'                
    morse⍪←'2' '..---'                
    morse⍪←'3' '...--'                
    morse⍪←'4' '....-'                
    morse⍪←'5' '.....'                
    morse⍪←'6' '-....'                
    morse⍪←'7' '--...'                
    morse⍪←'8' '---..'                
    morse⍪←'9' '----.'                
    morse⍪←'0' '-----'                
    morse⍪←',' '--..--'               
    morse⍪←'.' '.-.-.-'               
    morse⍪←'?' '..--..'               
    morse⍪←';' '-.-.-'                
    morse⍪←':' '---...'               
    morse⍪←'/' '-..-.'                
    morse⍪←'-' '-....-'               
    morse⍪←'''' '.----.'               
    morse⍪←'_' '..--.-'
    morse⍪←' ' '  ' ⍝ space = 2 letters             
    
    ∇ {pin}GPIO message;direction;value;folder;m;i;rate
     ⍝ Morse code using a GPIO-connected LED
     
      :If ∨/m←(1↑⍴morse)<i←morse[;1]⍳message
          ('UNSUPPORTED CHARS: ',m/message)⎕SIGNAL 11
      :EndIf
     
      :If 0=⎕NC'pin' ⋄ pin←18 ⋄ :EndIf ⍝ LED at GPIO 18 on the quick2wire expander board
     
      folder←'/sys/devices/virtual/gpio/gpio',⍕pin
      ⎕SH'gpio-admin export ',⍕pin
     
      direction←(folder,'/direction'⎕NTIE 0)
      value←(folder,'/value'⎕NTIE 0)
      'out'⎕NREPLACE direction 0
     
      :For didah :In ∊morse[i;2],¨' '
          (⍕didah≠' ')⎕NREPLACE value 0 ⍝ Turn on unless doing a space
          ⎕DL(1 3 7×rate÷1000)['.- '⍳didah]
          '0'⎕NREPLACE value 0
          ⎕DL rate÷1000                  ⍝ Inter-didah gap
      :EndFor
     
      ⍝ Tidy up
      ⎕NUNTIE direction
      ⎕NUNTIE value
      ⎕SH'gpio-admin unexport ',⍕pin
    ∇
:EndNamespace