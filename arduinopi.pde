#include <Gkos.h>
#include <Bitlash.h>
int i;

rownum [5] = {
0,1,2,3,4 };

colnum [5] = {
5,6,7,8,9 };
float timeCount = 0;

/* here you add the pixel maps for ASCII characters. I recommend looking at the 3x5 pixel fonts on the arduino forum: http://forum.arduino.cc/index.php?PHPSESSID=gmo0ebs1m7losibivaqt3ems13&topic=7384.0
Here's one example: */

/*Int SPACE[4][6] = {
000000
000000
000000
000000
};

Int H[4][6] = {
010001
011111
010001
010001
};

Int E[4][6] = {
011111
011100
011100
011111
};

Int L[4][6] = {
010000
010000
010000
011111
};

Int O[4][6] = {
001100
010010
001100
000000
};
*/

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

char* gEntry = ""; 
Gkos gkos(0, 1, 2, 3, 4, 5);


void setup() {
  initBitlash(9600);
  Serial.begin(9600);
// initialize the I/O pins as outputs:

// iterate over the pins:
for (int thisPin = 0; thisPin &lt; 5; thisPin++) {
// initialize and turning off colnum pins:
pinMode(colnum[thisPin], OUTPUT);
digitalWrite(colnum[thisPin], LOW);
}

// iterate over the pins:
for (int thisPin = 0; thisPin &lt; 5; thisPin++) {
// initialize and turning off rownum pins:
pinMode(rownum[thisPin], OUTPUT);
digitalWrite(rownum[thisPin], HIGH);
}

void loop() {
gEntry = gkos.entry(); // Will return empty immediately if no entry 

runBitlash();
output = doChar(gEntry)

time = 200

for (i = 0; i<sizeof(output); i++;) {
delay(5);
timeCount += 1;
if(timeCount &lt; time) {
drawScreen(output[i]);
} else if (timeCount &lt; time +30) {
// do nothing
}
else{
timeCount =0
}
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

void drawScreen(int character[5][5]) {
for(int j = 0; j &lt; 5; j++) {
// Turn the row on
int rowNumber = j + 1;
digitalWrite(row(rowNumber), LOW);
for (int k = 0; k &lt; 5; k++) {
// draw some letter bits
int columnNumber = k + 1;
if(character[j][k] == 1) {
digitalWrite(col(columnNumber), HIGH);
}

digitalWrite(col(columnNumber), LOW);
}
digitalWrite(row(rowNumber), HIGH);
}
}
