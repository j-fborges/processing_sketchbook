Grid g = new Grid();
float moduleXSz, moduleYSz, moduleSz, bTypeSz = 12, leadingSz = bTypeSz*1.25;
int rectsN, dMsN, rPos, test;
RectObj[] rects;
int[] dMsI;


void setup(){
  size(2000, 1000);
  
  rects = new RectObj[0];
  dMsI = new int[0];
  
  g.init();
}



void draw(){
  newRect();
  //g.disp();
  for(int i = 0; i < rectsN; i++){
   rects[i].disp(); 
  }
  
}

void mousePressed(){
  newRect();
}

void keyPressed(){
  println("a"); //<>//
}

class Grid{
  float gXPos, gYPos, gXSz, gYSz;
  int gModuLnWidthN, gModuLnHeightN, moduN, moduI = 0;
  Module [] gridMs;
  Module nGridM;
  boolean reInit = false;
  
  void init(){
    gXSz = width;
    gYSz = height;
    gXPos = (width/2) - (gXSz/2);
    gYPos = (height/2) - (gYSz/2); 
    
    gModuLnWidthN = round(gXSz/leadingSz);
    gModuLnHeightN = round(gYSz/leadingSz);
    //moduN = gModuLnWidthN * gModuLnHeightN;
    gridMs = new Module[0];
    
    for(int i = 0; i < gModuLnHeightN; i++){
      for(int j = 0; j < gModuLnWidthN; j++){
        
        nGridM = new Module((j*leadingSz)+gXPos, (i*leadingSz)+gYPos, j, i, moduI);
        gridMs = (Module []) append(gridMs, nGridM);
        
        
        dMsI = (int[]) append(dMsI, moduI);
        
        moduI += 1;
        dMsN +=1;
      }
    }
    
    gXSz = gModuLnWidthN * leadingSz;
    gYSz = gModuLnHeightN * leadingSz;
    
    
  }
  
  
  void disp() {
    rectMode(CORNER);
    stroke(0);
    fill(255);
    rect(gXPos, gYPos, gXSz, gYSz);
    
    
    for(int i = 0; i < gridMs.length; i++){
      gridMs[i].disp();
    }
    
  }
    
}
  
  


class Module{
  float mXPos, mYPos, mSz, mXSz, mYSz, mLeadingSz;
  int mXI, mYI, mI, mRI;
  boolean occupied = false;
  
  
  
            Module(float xPos, float yPos, int xI, int yI, int index){
              mXPos = xPos;
              mYPos = yPos;
              
              mLeadingSz = leadingSz;
              mSz = leadingSz;
              mXSz = leadingSz;
              mYSz = leadingSz;
              mXI = xI;
              mYI = yI;
              mI = index;
            }
  
  void init(){
 
  }
  
  void disp(){
   rect(mXPos, mYPos, mXSz, mYSz); 
  }
}

class RectObj {
  float rXPos, rYPos, rSz, rXSz, rYSz, rProp;
  int rI, rMI, rMXI, rMYI, maxMsLHorizontal, maxMsLVertical, totalDMsX = 1, totalDMsY = 1, mainAxisTotalDMs, possibilitiesN, rPI;
  boolean xAxisBigger = false, foundOccupiedX = false, foundOccupiedY = false ;
  int[] dMsX, dMsY, adjacentMs;
  boolean[] adjDMsXFoundOccupied, adjDMsYFoundOccupied;
  int[] [] possibleSzs;
  
  RectObj(){
  }
  
  void disp(){
    rectMode(CENTER);
    strokeWeight(2);
    stroke(255);
    fill(0);
    rect(rXPos, rYPos, rXSz*rProp, rYSz*rProp);
  }
}

void newRect(){
  rectsN += 1;
  RectObj nRect = new RectObj();
  rects = (RectObj[]) append(rects, nRect);
  rects[rects.length -1].rI = rects.length - 1;
  //rects[rectsN-1] = new RectObj();
  //rects[rectsN-1].rI = rectsN-1;
  //rects[rectsN-1].rProp = random(.8,1.0);
  rects[rects.length-1].rProp = 1;
  //rPos = (int)random(dMsN);
  
  sortDRect(rects.length-1);
  
  
  g.gridMs[rPos].mRI = rects.length-1;
  
  rects[rects.length-1].rXPos = g.gridMs[rPos].mXPos;
  rects[rects.length-1].rYPos = g.gridMs[rPos].mYPos;
  
  rects[rects.length-1].rMXI = g.gridMs[rPos].mXI;
  rects[rects.length-1].rMYI = g.gridMs[rPos].mYI;
  
  rects[rects.length-1].maxMsLHorizontal = g.gModuLnWidthN;
  rects[rects.length-1].maxMsLVertical = g.gModuLnHeightN;
  
  for(int i = rects[rects.length-1].rMXI; i< rects[rectsN-1].maxMsLHorizontal; i++){
    
    if(g.gridMs[calc(i, rects[rects.length-1].rMYI)].occupied == false){
      if(rects[rects.length-1].foundOccupiedX == false){
        rects[rects.length-1].totalDMsX +=1;
      }
    } else {
     rects[rects.length-1].foundOccupiedX = true;
    }
  }
  rects[rects.length-1].dMsX = new int[rects[rectsN-1].totalDMsX];
  
  for(int i = rects[rects.length-1].rMYI; i< rects[rectsN-1].maxMsLVertical; i++){
    if(g.gridMs[calc(rects[rects.length-1].rMXI, i)].occupied == false){
      if(rects[rects.length-1].foundOccupiedY == false){
        rects[rects.length-1].totalDMsY +=1;
      }
    } else {
      rects[rects.length-1].foundOccupiedY = true;
    }
  }
  rects[rects.length-1].dMsY = new int[rects[rectsN-1].totalDMsY];
  
  
  
  if(rects[rects.length-1].maxMsLHorizontal <= rects[rectsN-1].maxMsLVertical){
    rects[rects.length-1].xAxisBigger = false;
  } else { 
    rects[rects.length-1].xAxisBigger = true;
  }
  
  
  
  if(rects[rects.length-1].xAxisBigger == true){
    rects[rects.length-1].adjDMsXFoundOccupied = new boolean[rects[rects.length-1].totalDMsX];
    rects[rects.length-1].adjacentMs = new int[rects[rects.length-1].totalDMsX];
    for(int i = 0; i< rects[rectsN-1].totalDMsX-1; i++){
      for(int j = 0; j < rects[rectsN-1].totalDMsY-1; j++){
        test =  rects[rectsN-1].rMI  +i+(j*g.gModuLnWidthN);
        if(g.gridMs[ rects[rectsN-1].rMI +i+(j*g.gModuLnWidthN)].occupied == false){
          if(rects[rectsN-1].adjDMsXFoundOccupied[i] == false){
        rects[rectsN-1].dMsX[i] +=1;
          }
        } else {
          rects[rectsN-1].adjDMsXFoundOccupied[i] = true;
        }
      }
      rects[rectsN-1].adjacentMs[i] = rects[rectsN-1].dMsX[i];
      if(i>0){
        rects[rectsN-1].adjacentMs[i] = min(rects[rectsN-1].adjacentMs[i], rects[rectsN-1].adjacentMs[i-1]);
      }
    }
    
    rects[rectsN-1].mainAxisTotalDMs = rects[rectsN-1].totalDMsX;
  }
  
  if(rects[rectsN-1].xAxisBigger == false){
    rects[rectsN-1].adjDMsYFoundOccupied = new boolean[rects[rectsN-1].totalDMsY];
    rects[rectsN-1].adjacentMs = new int[rects[rectsN-1].totalDMsY];
    
    for(int i = 0; i< rects[rectsN-1].totalDMsY-1; i++){
      for(int j = 0; j < rects[rectsN-1].totalDMsX-1; j++){
        
        if(g.gridMs[ rects[rectsN-1].rMI +j+(i*g.gModuLnWidthN)].occupied == false){
          if(rects[rectsN-1].adjDMsYFoundOccupied[i] == false){
        rects[rectsN-1].dMsY[i] +=1;
          }
        } else {
          rects[rectsN-1].adjDMsYFoundOccupied[i] = true;
        }
      }
      rects[rectsN-1].adjacentMs[i] = rects[rectsN-1].dMsY[i];
      if(i>0){
        rects[rectsN-1].adjacentMs[i] = min(rects[rectsN-1].adjacentMs[i], rects[rectsN-1].adjacentMs[i-1]);
      }
    }
    rects[rectsN-1].mainAxisTotalDMs = rects[rectsN-1].totalDMsY;
  }
  
  rects[rectsN-1].possibleSzs = new int[0][2];
  
    for(int i = 0; i< rects[rectsN-1].mainAxisTotalDMs-1; i++){
      for(int j = 0; j < rects[rectsN-1].adjacentMs[i]; j++){
        rects[rectsN-1].possibilitiesN +=1;
        
        rects[rectsN-1].possibleSzs = (int[][]) expand(rects[rectsN-1].possibleSzs, rects[rectsN-1].possibilitiesN);
        //rects[rectsN-1].possibleSzs[rects[rectsN-1].possibilitiesN-1] = (int[]) expand(rects[rectsN-1].possibleSzs[rects[rectsN-1].possibilitiesN-1], 2);
        rects[rectsN-1].possibleSzs[rects[rectsN-1].possibilitiesN-1] = new int[2];
        rects[rectsN-1].possibleSzs[rects[rectsN-1].possibilitiesN-1][0] = i;
        rects[rectsN-1].possibleSzs[rects[rectsN-1].possibilitiesN-1][1] = j;
      } //<>//
    }
  
  rects[rectsN-1].rPI = round(random(rects[rectsN-1].possibilitiesN));
   //<>//
  rects[rectsN-1].rXSz = (rects[rectsN-1].possibleSzs[rects[rectsN-1].rPI][0])*leadingSz;
  rects[rectsN-1].rYSz = (rects[rectsN-1].possibleSzs[rects[rectsN-1].rPI][1])*leadingSz;
  rects[rectsN-1].rXPos = rects[rectsN-1].rXPos + (rects[rectsN-1].rXSz/2);
  rects[rectsN-1].rYPos = rects[rectsN-1].rYPos + (rects[rectsN-1].rYSz/2);
  
  for(int i = 0; i< (rects[rectsN-1].possibleSzs[rects[rectsN-1].rPI][0]); i++){
      for(int j = 0; j < (rects[rectsN-1].possibleSzs[rects[rectsN-1].rPI][1]); j++){
        g.gridMs[rPos+i+(j*g.gModuLnWidthN)].occupied = true;
        dMsN -=1;
        //println(dMsN);
      }
  }
  
  
  
}

int calc(int x_, int y_){
  int r;
  r = (y_ * g.gModuLnWidthN) + x_;
  return r;
}

void sortDRect(int rectI){
  
  rPos = (int)random(dMsN);
  if(g.gridMs[rPos].occupied == true){
    sortDRect(rectI);
  } else {
   rects[rectsN-1].rMI = rPos; 
  }
}


int[] remove(int array[], int item) {
  int outgoing[] = new int[array.length - 1];
  System.arraycopy(array, 0, outgoing, 0, item);
  System.arraycopy(array, item+1, outgoing, item, array.length - (item+1));
  return outgoing;
}
