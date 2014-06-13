This library is used to control Arduino Pi. Created by bijtaj on June 13, 2014.


Class:
ArduinoPi
  Functions:
  ArduinoPi::ArduinoPi(int rownum[], int colnum[]) - creates instance of class where rownum and colnum are the LED matrix pins 
  and keyboard pins are assumed to be analog 0-5.
  ArduinoPi::show(byte * image, unsigned long duration) - shows a character on LED matrix where byte * image is character and
  unsigned long duration is duration.
  ArduinoPi::run() - runs the Bitlash language on Arduino Pi.
