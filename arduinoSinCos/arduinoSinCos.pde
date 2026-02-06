import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

int AnumReadings = 100;

int Areadings[];      // the readings from the analog input
int AreadIndex = 0;              // the index of the current reading
int Atotal = 0;                  // the running total
int Aaverage = 0;

int BnumReadings = 50;

int Breadings[];      // the readings from the analog input
int BreadIndex = 0;              // the index of the current reading
int Btotal = 0;                  // the running total
int Baverage = 0;

float x, y, aCount;
int  px, py;
void setup(){
  frameRate(60);
  size(1920,1080, P2D);
  
  println(Arduino.list());
  arduino = new Arduino(this, Arduino.list()[0], 57600);
 
 
 Areadings = new int[AnumReadings];
 for (int thisReading = 0; thisReading < AnumReadings; thisReading++) {
    Areadings[thisReading] = 0;
  }
  
  Breadings = new int[BnumReadings];
 for (int thisReading = 0; thisReading < BnumReadings; thisReading++) {
    Breadings[thisReading] = 0;
  }
 
}

void draw(){
  aCount += .001;
  Atotal = Atotal - Areadings[AreadIndex];
  Areadings[AreadIndex] = arduino.analogRead(0);
  Atotal = Atotal + Areadings[AreadIndex];
  AreadIndex++;
  if(AreadIndex >= AnumReadings){
   AreadIndex = 0; 
  }
  
  Aaverage = Atotal/AnumReadings;
  
  
  Btotal = Btotal - Breadings[BreadIndex];
  Breadings[BreadIndex] = arduino.analogRead(1);
  Btotal = Btotal + Breadings[BreadIndex];
  BreadIndex++;
  if(BreadIndex >= BnumReadings){
   BreadIndex = 0; 
  }
  
  Baverage = Btotal/BnumReadings;
  noStroke();
  fill(255, 1);
  rect(0,0,width, height);
   
   //px = (int)map(arduino.analogRead(0), 0, 1023, 0, 80);
   //py = (int)map(arduino.analogRead(1), 0, 1023, 0, 80);
   
   println("0  --  " +arduino.analogRead(0)+" // "+ Aaverage + "  |||  1  --  " +arduino.analogRead(1)+" // "+ Baverage+ " || frameRate --- " +frameRate);
   
   
 x = 300*cos(radians(aCount*Aaverage))+width/2;
 y = 300*sin(radians(aCount*Baverage))+height/2;
 stroke(1);
 strokeWeight(5); 
 point(x,y);
}
