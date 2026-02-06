Sqr[] sqrs = new Sqr[0];
Spot[] spots = new Spot[0];
int[] dirVals = {0, 1, 0, -1};

int sqrsN, spotsN, pSpotsN = 1, selectedSpotIndex;

void setup(){
 size(2000,1000);
 background(255);
 rectMode(RADIUS);
 
}

void draw(){
 if(sqrsN > 0){
   for(int i = 0; i <sqrsN; i++){
    sqrs[i].disp();
    for(int j = 0; j < sqrs[i].anchors.length; j++){
      fill(255,0,0);
     //ellipse(sqrs[i].anchors[j].x, sqrs[i].anchors[j].y, 20,20);
    }
   }
 }
}

void mousePressed(){
  //println("pressed");
 createSqr(); 
}

class dir{
  
}

class Sqr{
 int xPos, yPos, sz, marginSz, refXPos, refYPos, rSpot, sXDir, sYDir;
 PVector[] anchors;
 PVector loc;
 int[] anchorXDir, anchorYDir, anchorXDirI, anchorYDirI;
 int xDirValI= 0, yDirValI = 0;
 
 void sortSpot(){
   rSpot = (int)random(spotsN);
   
   if(spots[rSpot].occupied == true){
    sortSpot(); 
   }
 }
 
 void firstInit(){
   anchors = new PVector[4];
   anchorXDir = new int[4];
   anchorYDir = new int[4];
   anchorXDirI = new int[4];
   anchorYDirI = new int[4];
   
   xDirValI = 0;
   yDirValI = 3;
   
  xPos = (int)random(width);
  yPos = (int)random(height);
  
  loc = new PVector(xPos, yPos);
  
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
  for(int i = 0; i<anchors.length; i++){
    xDirValI += 1;
    yDirValI += 1;
    if(xDirValI >= dirVals.length){ xDirValI = 0; }
    if(yDirValI >= dirVals.length){ yDirValI = 0; } 
    
    anchorXDir[i] = dirVals[xDirValI];
    anchorYDir[i] = dirVals[yDirValI];
    anchorXDirI[i] = xDirValI;
    anchorYDirI[i] = yDirValI;
    anchors[i] =  new PVector();
    
   anchors[i].x = xPos + (anchorXDir[i])*(sz+marginSz);
   anchors[i].y = yPos + (anchorYDir[i])*(sz+marginSz);
  }
 }
 
 void init(){
   anchors = new PVector[3];
   anchorXDir = new int[3];
   anchorYDir = new int[3];
   anchorXDirI = new int[3];
   anchorYDirI = new int[3];
  
  sortSpot();

  refXPos = spots[rSpot].xPos;
  refYPos = spots[rSpot].yPos;
  
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
  //println("rspot: " + rSpot);
  
  sXDir = spots[rSpot].sXDir;
  sYDir = spots[rSpot].sYDir;
   //<>//
  xPos = refXPos + (sXDir*(sz+ marginSz)); // falta calcular se o sz(tamanho do novo quadrado, que aqui corresponde ao deslocamento do ponto central do novo quadrado em relação ao que esta sendo usado de referencia para criar) é positivo ou negativo, definido pelo angulo do ponto central do quadrado referencia com sua respectiva ancora que esta sendo usada. 
  yPos = refYPos + (sYDir*(sz+ marginSz));
  
  loc = new PVector(xPos, yPos);
  
  spots[rSpot].occupied = true;
  
  xDirValI = spots[rSpot].sXDirI;
  yDirValI = spots[rSpot].sYDirI;
  
  xDirValI -= 1;
  yDirValI -= 1;
  if(xDirValI < 0){ xDirValI = 3; }
  if(yDirValI < 0){ yDirValI = 3; } 
  xDirValI -= 1;
  yDirValI -= 1;
  if(xDirValI < 0){ xDirValI = 3; }
  if(yDirValI < 0){ yDirValI = 3; } 
  
  
  for(int i = 0; i<anchors.length; i++){
    xDirValI += 1;
    yDirValI += 1;
    if(xDirValI >= dirVals.length){ xDirValI = 0; }
    if(yDirValI >= dirVals.length){ yDirValI = 0; } 
    
    
    anchors[i] =  new PVector();
    
    anchorXDir[i] = dirVals[xDirValI];
    anchorYDir[i] = dirVals[yDirValI];
    anchorXDirI[i] = xDirValI;
    anchorYDirI[i] = yDirValI;
    
    
   anchors[i].x = xPos + (anchorXDir[i]*(sz+marginSz)); //observar
   anchors[i].y = yPos + (anchorYDir[i]*(sz+marginSz)); //vamos ver
  }
 }
 
 void disp(){
   fill(0);
   rect(xPos, yPos, sz,sz);
 }
}

class Spot{
 int xPos,yPos, sSqrIndex, sXDir, sYDir , sXDirI, sYDirI;
 boolean occupied;
 PVector loc;
 int[] anchorXDir, anchorYDir;
 
 void firstInit(int i){
   occupied = false;
   
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i].x; //valor do ponto de referencia já somado com o raio do quadrado e a largura da margem.
   yPos = (int)sqrs[sqrsN-1].anchors[i].y;
   
   loc = new PVector(xPos, yPos);
   
   sXDir = sqrs[sqrsN-1].anchorXDir[i];
   sYDir = sqrs[sqrsN-1].anchorYDir[i];
   sXDirI = sqrs[sqrsN-1].anchorXDirI[i];
   sYDirI = sqrs[sqrsN-1].anchorYDirI[i];
   
   sSqrIndex = sqrsN-1;
 }
 
 void init(int i){
   occupied = false;
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].x;
   yPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].y;
   
   loc = new PVector(xPos, yPos);
   
   sXDir = sqrs[sqrsN-1].anchorXDir[i-pSpotsN];
   sYDir = sqrs[sqrsN-1].anchorYDir[i-pSpotsN];
   sXDirI = sqrs[sqrsN-1].anchorXDirI[i-pSpotsN];
   sYDirI = sqrs[sqrsN-1].anchorYDirI[i-pSpotsN];
   
   sSqrIndex = sqrsN-1;
 }
 
}

void createSqr(){
  sqrsN += 1;
  sqrs = (Sqr[]) expand(sqrs, sqrsN);
  sqrs[sqrsN-1] = new Sqr();
  
  if(sqrsN==1){
   sqrs[sqrsN-1].firstInit();
   
   spotsN += 4;
  spots = (Spot[]) expand(spots, spotsN);
  for(int i = pSpotsN -1; i < spotsN; i++){
    
    spots[i] = new Spot();
    spots[i].firstInit(i);
   }
  } else {
    sqrs[sqrsN-1].init();
    
    spotsN += 3;
  spots = (Spot[]) expand(spots, spotsN);
  for(int i = pSpotsN; i < spotsN; i++){
  
  spots[i] = new Spot();
  spots[i].init(i);
  }
  }
  
 pSpotsN = spotsN;
}
