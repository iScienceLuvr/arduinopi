#include <Gkos.h>
#include "bitlash.h"
int i;
int rownum[5];
int colnum[5];


byte hart[] = {
B01010,
B10101,
B10001,
B01010,
B00100};

byte dw[] = {
B00000,
B00000,
B11111,
B00000,
B00000};

byte op[] = {
B00100,
B00100,
B00100,
B00100,
B00100};

byte fs[] = {
B00001,
B00010,
B00100,
B01000,
B10000};

byte bs[] = {
B10000,
B01000,
B00100,
B00010,
B00001};


byte A[] = {
B00100,
B01010,
B11111,
B10001,
B10001};
byte B[] = {
B11110,
B10001,
B11110,
B10001,
B11110};
byte C[] = {
B11111,
B10000,
B10000,
B10000,
B11111};
byte D[] = {
B11110,
B10001,
B10001,
B10001,
B11110};
byte E[] = {
B11111,
B10000,
B11110,
B10000,
B11111};
byte F[] = {
B11111,
B10000,
B11100,
B10000,
B10000};
byte G[] = {
B11111,
B10000,
B10011,
B10001,
B01110};
byte H[] = {
B10001,
B10001,
B11111,
B10001,
B10001};
byte I[] = {
B01110,
B00100,
B00100,
B00100,
B01110};
byte J[] = {
B11111,
B00001,
B00001,
B10001,
B01110};
byte K[] = {
B10001,
B10010,
B10100,
B11010,
B10001};
byte L[] = {
B10000,
B10000,
B10000,
B10000,
B11110};
byte M[] = {
B01010,
B10101,
B10101,
B10001,
B10001};
byte N[] = {
B10001,
B11001,
B10101,
B10011,
B10001};
byte O[] = {
B01110,
B10001,
B10001,
B10001,
B01110};
byte P[] = {
B11110,
B10001,
B11110,
B10000,
B10000};
byte Q[] = {
B01110,
B10001,
B10101,
B01110,
B00100};
byte R[] = {
B11110,
B10001,
B11110,
B10001,
B10001};
byte S[] = {
B01111,
B10000,
B01110,
B00001,
B11110};
byte T[] = {
B11111,
B00100,
B00100,
B00100,
B00100};
byte U[] = {
B10001,
B10001,
B10001,
B10001,
B01110};

byte V[] = {
B10001,
B10001,
B10001,
B01010,
B00100};
byte W[] = {
B10001,
B10001,
B10101,
B10101,
B01010};
byte X[] = {
B10001,
B01010,
B00100,
B01010,
B10001};
byte Y[] = {
B10001,
B01010,
B00100,
B00100,
B00100};
byte Z[] = {
B11111,
B00010,
B00100,
B01000,
B11111};
byte n1[] = {
B00100,
B01100,
B10100,
B00100,
B11111};
byte n2[] = {
B01100,
B10010,
B00100,
B01000,
B11111};
byte n3[] = {
B01110,
B10001,
B00110,
B10001,
B01110};
byte n4[] = {
B00110,
B01010,
B11111,
B00010,
B00010};
byte n5[] = {
B11111,
B10000,
B11110,
B00001,
B11110};
byte n6[] = {
B01110,
B10000,
B11110,
B10001,
B01110};
byte n7[] = {
B11111,
B00010,
B00100,
B01000,
B10000};
byte n8[] = {
B01110,
B10001,
B01110,
B10001,
B01110};
byte n9[] = {
B00111,
B01001,
B00111,
B00001,
B00001};
byte n0[] = {
B01110,
B11001,
B10101,
B10011,
B01110};

byte smily[] = {
B01010,
B00000,
B10001,
B10001,
B01110};

byte P1[] = {
B10101,
B10101,
B10101,
B00000,
B10101};

byte P2[] = {
B00000,
B00100,
B00000,
B00100,
B00000};

byte P3[] = {
B00000,
B00100,
B00000,
B00100,
B00000};

byte P4 [] = {
B00100,
B01000,
B10000,
B01000,
B00100,
};

byte P5[] = {
B00100,
B00010,
B00001,
B00010,
B00100,
};
char* gEntry = ""; 
Gkos gkos(0, 1, 2, 3, 4, 5);
float timeCount = 0;


void setup() {
  initBitlash(57600);
  runBitlash();
  setOutputHandler(&serialHandler);
  int rownum[] = {
  0,1,2,3,4 };

  int colnum[] = {
  5,6,7,8,9 };
  Serial.begin(9600);
// initialize the I/O pins as outputs:

// iterate over the pins:
for (int thisPin = 0; thisPin < 5; thisPin++) {
// initialize and turning off colnum pins:
pinMode(colnum[thisPin], OUTPUT);
digitalWrite(colnum[thisPin], LOW);
}

// iterate over the pins:
for (int thisPin = 0; thisPin < 5; thisPin++) {
// initialize and turning off rownum pins:
pinMode(rownum[thisPin], OUTPUT);
digitalWrite(rownum[thisPin], HIGH);
}
}




void loop(){
  gEntry = gkos.entry(); // Will return empty immediately if no entry 
  //String(gEntry);
  char gEntrychar;
  gEntry = &gEntrychar; 
  //gEntry.toCharArray(gEntrychar, 1);
  //strcpy(gEntrychar, gEntry);
  runBitlash();
  doCommand(gEntry);
}


int row(int i) {
if(i == 1) {
return 0;
} else if (i == 2) {
return 1;
} else if (i == 3) {
return 2;
} else if (i == 4) {
return 3;
} else if (i == 5) {
return 4;
}
}

int col(int i) {
if(i == 1) {
return 5;
} else if (i == 2) {
return 6;
} else if (i == 3) {
return 7;
} else if (i == 4) {
return 8;
} else if (i == 5) {
return 9;
}
}



void serialHandler(byte b) {
    if (b == 'A') {
      show(A, 500);
    }
        if (b == 'B') {
      show(B, 500);
    }
        if (b == 'C') {
      show(C, 500);
    }
        if (b == 'D') {
      show(D, 500);
    }
        if (b == 'E') {
      show(E, 500);
    }
        if (b == 'F') {
      show(F, 500);
    }
        if (b == 'G') {
      show(G, 500);
    }
        if (b == 'H') {
      show(H, 500);
    }
        if (b == 'I') {
      show(I, 500);
    }
        if (b == 'J') {
      show(J, 500);
    }
        if (b == 'K') {
      show(K, 500);
    }
        if (b == 'L') {
      show(L, 500);
    }
        if (b == 'M') {
      show(M, 500);
    }
        if (b == 'N') {
      show(N, 500);
    }
        if (b == 'O') {
      show(O, 500);
    }
        if (b == 'P') {
      show(P, 500);
    }
        if (b == 'Q') {
      show(Q, 500);
    }
        if (b == 'R') {
      show(R, 500);
    }
        if (b == 'S') {
      show(S, 500);
    }
        if (b == 'T') {
      show(T, 500);
    }
        if (b == 'U') {
      show(U, 500);
    }
        if (b == 'V') {
      show(V, 500);
    }
        if (b == 'W') {
      show(W, 500);
    }
        if (b == 'X') {
      show(X, 500);
    }
        if (b == 'Y') {
      show(Y, 500);
    }
        if (b == 'Z') {
      show(Z, 500);
    }
        if (b == '0') {
      show(n0, 500);
    }
        if (b == '1') {
      show(n1, 500);
    }
        if (b == '2') {
      show(n2, 500);
    }
        if (b == '3') {
      show(n3, 500);
    }
        if (b == '4') {
      show(n4, 500);
    }
        if (b == '5') {
      show(n5, 500);
    }
        if (b == '6') {
      show(n6, 500);
    }
        if (b == '7') {
      show(n7, 500);
    }
        if (b == '8') {
      show(n8, 500);
    }
        if (b == '9') {
      show(n9, 500);
    }
        if (b == ' ') {
     delay(400);
    }
            if (b == '!') {
      show(P1, 500);
    }
            if (b == 'SMILY') {
      show(smily, 500);
    }
            if (b == '-') {
      show(dw, 500);
    }
            if (b == '|') {
      show(op, 500);
    }
            if (b == '/') {
      show(fs, 500);
    }
            if (b == '<') {
      show(bs, 500);
    }
            if (b == 'HART') {
      show(hart, 500);
    }
    
             if (b == ':') {
      show(P2, 500);
    }
                 if (b == ';') {
      show(P3, 500);
    }
             if (b == '(') {
      show(P4, 500);
    }
             if (b == ')') {
      show(P5, 500);
    }
    
                  if (b == 'a') {
      show(O, 500);show(W, 500);    delay(400);
      show(Y, 500);show(E, 500);show(S, 500);
    }
             else{
    }
}

// routine to show a frame of an image stored in the array pointed to by the image parameter.
// the frame is repeated for the given duration in milliseconds
void show( byte * image, unsigned long duration)
{
unsigned long start = millis(); // begin timing the animation
while (start + duration > millis()) // loop until the duration period has passed
{
for(int row = 0; row < 5; row++)
{
digitalWrite(rownum[row], HIGH); // connect row to +5 volts
for(int column = 0; column < 5; column++)
{
boolean pixel = bitRead(image[row],column);
if(pixel == 1)
{
digitalWrite(colnum[column], LOW); // connect column to Gnd
}
delayMicroseconds(300); // a small delay for each LED
digitalWrite(colnum[column], HIGH); // disconnect column from Gnd
}
digitalWrite(rownum[row], LOW); // disconnect LEDs
}
}
}
