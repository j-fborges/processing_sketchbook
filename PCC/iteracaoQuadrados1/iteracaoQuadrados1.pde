Sqr[] sqrs = new Sqr[0];
Spot[] spots = new Spot[0];

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
     ellipse(sqrs[i].anchors[j].x, sqrs[i].anchors[j].y, 20,20);
    }
   }
 }
}

void mousePressed(){
  //println("pressed");
 createSqr(); 
}

class Sqr{
 int xPos, yPos, sz, marginSz, refXPos, refYPos, rSpot;
 PVector[] anchors;
 PVector loc;
 
 float angledisc, RefAngleDisc, anchorAngle;
 
 void sortSpot(){
   rSpot = (int)random(spotsN);
   
   if(spots[rSpot].occupied == true){
    sortSpot(); 
   }
 }
 
 void firstInit(){
   anchors = new PVector[4];
   
   
  xPos = (int)random(width);
  yPos = (int)random(height);
  
  loc = new PVector(xPos, yPos);
  
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
  for(int i = 0; i<anchors.length; i++){
    float a = HALF_PI*i;
    anchors[i] =  new PVector();
    anchorAngle = degrees(a);
   anchors[i].x = xPos + (cos(a)*(sz+marginSz));
   anchors[i].y = yPos + (sin(a)*(sz+marginSz));
  }
 }
 
 void init(){
   anchors = new PVector[3];
  
   
  sortSpot();
  
  //selectedSpotIndex = rSpot; //------------------------------------------------ ncessario?

  refXPos = spots[rSpot].xPos;
  refYPos = spots[rSpot].yPos;
  
  sz = (int)random(1,20);
  marginSz = (int)random(1,10);
  //println("rspot: " + rSpot);
  
  float refA = PVector.angleBetween(spots[rSpot].loc, sqrs[spots[rSpot].sSqrIndex].loc);
  
  
  
  float refX = cos(refA), refY = sin(refA);
  int xDir = 1, yDir = 0;
  if(refX > 0 && refY < .55 && refY > -.55){
    xDir = +1;
    yDir = 0;
  } else 
  if(refX < .55 && refX > -.55 && refY > 0){
    xDir = 0;
    yDir = +1;
  } else
  if(refX < .55 && refX > -.55 && refY < 0){
    xDir = 0;
    yDir = -1;
  } else
  if(refX < 0 && refY < .55 && refY > -.55){
    xDir = -1;
    yDir = 0;
  } else {
    rect(width/2, height/2, 500, 500);
  }
  xPos = refXPos + (xDir*(sz+ marginSz)); // falta calcular se o sz(tamanho do novo quadrado, que aqui corresponde ao deslocamento do ponto central do novo quadrado em relação ao que esta sendo usado de referencia para criar) é positivo ou negativo, definido pelo angulo do ponto central do quadrado referencia com sua respectiva ancora que esta sendo usada. 
  yPos = refYPos + (yDir*(sz+ marginSz));
  
  loc = new PVector(xPos, yPos);
  
  spots[rSpot].occupied = true;
  
  for(int i = 0; i<anchors.length; i++){
    float a;
    a = (HALF_PI*i) + (refA + PI);
    anchors[i] =  new PVector();
    angledisc = degrees(a); RefAngleDisc = degrees(refA);
    anchorAngle = degrees(a);
   anchors[i].x = xPos + (cos(a)*(sz+marginSz)); //observar //<>//
   anchors[i].y = yPos + (sin(a)*(sz+marginSz)); //vamos ver
  }
 }
 
 void disp(){
   fill(0);
   rect(xPos, yPos, sz,sz);
 }
}

class Spot{
 int xPos,yPos, sSqrIndex;
 boolean occupied;
 PVector loc;
 
 
 void firstInit(int i){
   occupied = false;
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i].x; //valor do ponto de referencia já somado com o raio do quadrado e a largura da margem.
   yPos = (int)sqrs[sqrsN-1].anchors[i].y;
   loc = new PVector(xPos, yPos);
   sSqrIndex = sqrsN-1;
 }
 
 void init(int i){
   occupied = false;
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].x;
   yPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].y;
   loc = new PVector(xPos, yPos);
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
