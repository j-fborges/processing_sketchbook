Sqr[] sqrs = new Sqr[0];
Spot[] spots = new Spot[0];

int sqrsN, spotsN, pSpotsN = 1;

void setup(){
 size(2000,1000);
 background(255);
 rectMode(RADIUS);
}

void draw(){
 if(sqrsN > 0){
   for(int i = 0; i <sqrsN; i++){
    sqrs[i].disp(); 
   }
 }
}

void mousePressed(){
 createSqr(); 
}

class Sqr{
 int xPos, yPos, sz, marginSz;
 PVector[] anchors;
 
 void firstInit(){
   anchors = new PVector[4];
  xPos = (int)random(width);
  yPos = (int)random(height);
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
  for(int i = 0; i<anchors.length; i++){
    float a = PI*i;
   anchors[i].x = xPos + (cos(a)*(sz+marginSz));
   anchors[i].y = yPos + (sin(a)*(sz+marginSz));
  }
 }
 
 void init(){
   anchors = new PVector[3];
  int rSpot = (int)random(spotsN);
  xPos = spots[rSpot].xPos;
  yPos = spots[rSpot].yPos;
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
 }
 
 void disp(){
   fill(0);
   rect(xPos, yPos, sz,sz);
 }
}

class Spot{
 int xPos,yPos;
 boolean occupied;
 
 void init(){
   occupied = false;
   xPos = sqrs[sqrsN-1].xPos + sqrs[sqrsN-1].sz + sqrs[sqrsN-1].marginSz;
   yPos = sqrs[sqrsN-1].yPos + sqrs[sqrsN-1].sz + sqrs[sqrsN-1].marginSz;
 }
 
}

void createSqr(){
  sqrsN += 1;
  sqrs = (Sqr[]) expand(sqrs, sqrsN);
  sqrs[sqrsN-1] = new Sqr();
  
  if(sqrsN<2){
   sqrs[sqrsN-1].firstInit();
   
   spotsN += 4;
  spots = (Spot[]) expand(spots, spotsN);
  for(int i = pSpotsN -1; i < spotsN; i++){
    
    spots[i] = new Spot();
    spots[i].init();
   }
  } else {
    sqrs[sqrsN-1].init();
    
    spotsN += 3;
  spots = (Spot[]) expand(spots, spotsN);
  for(int i = pSpotsN -1; i < spotsN; i++){
  
  spots[i] = new Spot();
  spots[i].init();
  }
  }
  
 
}
