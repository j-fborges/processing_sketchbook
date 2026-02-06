
spot gridSpots [] = new spot[0];
spot nSpot = new spot();
bola bolas [] = new bola[0];
bola nBola = new bola();

int freeSpots[] = new int[0];
//PVector gridSpots [] = new PVector [0];
PVector nVec;
int mHN, mWN;
float lhm = 50, //left horizontal margin
      rhm = 50, //right horizontal margin
      tvm = 50, //top vertical margin
      bvm = 50, //bottom vertical margin
      bLerp = 0;
      
boolean nStep = true;
int rfSpot;


void setup(){
  size(600, 600);
  mWN = int((width - lhm - rhm)/50);
  mHN = int((height - tvm - bvm)/50);
  println("a");
  for(float i = lhm; i <= height - rhm; i += 50){
    for( float j = tvm; j <= width - bvm; j += 50){
      
      nBola = new bola();
      nSpot = new spot();
      bolas =     (bola []) append(bolas,     nBola);
      gridSpots = (spot []) append(gridSpots, nSpot);
      gridSpots[gridSpots.length -1].loc = new PVector();
      gridSpots[gridSpots.length -1].loc.set(i,j);
      
    }
    println(i);
  }
  println("b");
  
  for(int i = 0; i<gridSpots.length; i++){
   if(gridSpots[i].occupied == false){
    freeSpots = (int []) append(freeSpots,  i);
   }
  }
  
  for(int i = 0; i<bolas.length; i++){
   int rfSpot = round(random(freeSpots.length-1));
   bolas[i].loc = new PVector();
   bolas[i].loc.set(gridSpots[freeSpots[rfSpot]].loc);
   bolas[i].pSpotI = freeSpots[rfSpot];
   freeSpots = remove(freeSpots, rfSpot);
   //gridSpots[freeSpots[rfSpot]].occupied = true;
  }
  
  
  println("ok");
  noStroke();
  background(0);
}

void draw(){
  background(0);
  if(nStep == true){
    bLerp = 0;
    for(int i = 0; i<gridSpots.length; i++){
     if(gridSpots[i].occupied == false){
      freeSpots = (int []) append(freeSpots,  i);
     }
    }
    
    for(int i = 0; i<bolas.length; i++){
      if(freeSpots.length!=0){
         rfSpot = round(random(freeSpots.length-1));
      
     if(rfSpot > freeSpots.length){
       println("k");
     }
     if(freeSpots.length == 0) println("porra");
     if(freeSpots[rfSpot] > gridSpots.length){
       println("k");
     }
     
     bolas[i].nSpotI = freeSpots[rfSpot];
     
     
      //<>// //<>//
     gridSpots[freeSpots[rfSpot]].occupied = true;
     freeSpots = remove(freeSpots, rfSpot);
      }
    }
    nStep = false;
  }
  
  if(nStep == false){
    for(int i = 0; i<bolas.length; i++){
     bolas[i].loc.x = (lerp(gridSpots[bolas[i].pSpotI].loc.x,gridSpots[bolas[i].nSpotI].loc.x, bLerp));
     bolas[i].loc.y = (lerp(gridSpots[bolas[i].pSpotI].loc.y,gridSpots[bolas[i].nSpotI].loc.y, bLerp));
     bolas[i].cR = (lerp(gridSpots[bolas[i].pSpotI].cR,gridSpots[bolas[i].nSpotI].cR, bLerp));
     bolas[i].cG = (lerp(gridSpots[bolas[i].pSpotI].cG,gridSpots[bolas[i].nSpotI].cG, bLerp));
     bolas[i].cB = (lerp(gridSpots[bolas[i].pSpotI].cB,gridSpots[bolas[i].nSpotI].cB, bLerp));
       if(bLerp >= 1){
      gridSpots[bolas[i].nSpotI].occupied = false;
      }
    }
    if(bLerp >= 1){
     nStep = true;
    } else {
      bLerp += .005;
    }
  }
  
  for(int i = 0; i<bolas.length; i++){
    bolas[i].disp();
  }
  
  
}

int calcInd(float x, float y){
  int ind = (int) (x + (y*mWN)); 
  return ind;
}

class spot {
  PVector loc;
  float cR,
        cG,
        cB;
  color c;
  boolean occupied = false,
  targetted = false;
  
  
  spot(){
    cR = round(random(0,255));
    cG = round(random(0,255));
    cB = round(random(0,255));
    c = color(cR,cG,cB);
  }
}

class bola {
  PVector loc, dest;
  float cR,
        cG,
        cB;
  color c;
  int aSpotI, //actual spot index
  pSpotI,     //previous spot index
  nSpotI;     //next spot index
  
  bola(){
    
  }
  
  void fSortSpot(){
    
  }
  
  void disp(){
    fill(cR,cG,cB);
    ellipse(loc.x, loc.y, 20, 20);
  }
  
}

int[] remove(int array[], int item) {
  int outgoing[] = new int[array.length - 1];
  System.arraycopy(array, 0, outgoing, 0, item);
  System.arraycopy(array, item+1, outgoing, item, array.length - (item+1));
  return outgoing;
}
