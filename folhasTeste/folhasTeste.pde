
//int 
Leaf [] leafs = new Leaf[300];


void setup(){
  size(1920,1080, P2D);
  frameRate(60);
  colorMode(HSB, 255);
  leafs = new Leaf[5000]; //<>//
  
  for(int i = 0; i< leafs.length; i++){
    leafs[i] = new Leaf();
    leafs[i].init();
  }
}



void draw(){
  background(255);
 for(int i = 0; i< leafs.length; i++){
    leafs[i].update();
  }
  println(frameRate);
}

void mousePressed(){
  for(int i = 0; i< leafs.length; i++){
    leafs[i].rcR();
  }
}


void mouseReleased(){
}

class Leaf {
  float xPos, yPos, xSz, ySz, xSzAcc, ySzAcc;
  PVector init, pos, vel, acc;
  int fH, fS, fB, fT, fTAcc, fHAcc, fSAcc, fBAcc;
  int cR;
  void init(){
    init = new PVector(0,0);
    pos = new PVector(random(width), random(height));
    xSz = random(45,90);
    ySz = random(45,90);
    xSzAcc = random(-5,5);
    ySzAcc = random(-5,5);
    fT = (int) random(10,80);
    fH = (int) random(80,110);
    fS = (int) random(100,150);
    fB = (int) random(80,120);
    cR = (int) random(10,40);
  }
  void rcR(){
    cR = (int) random(10,40);
  }
  
  void update(){
    if(frameCount%cR == 0){
      fTAcc = (int) random(-10,10);
      fHAcc = (int) random(-10,10);
      fSAcc = (int) random(-10,10);

    }
    
    if(fT >=0 && fTAcc <= 0 || fT <= 80 && fTAcc >= 0 ){
    fT = fT + fTAcc;
    }
    
    if(fH >=80 && fHAcc <= 0 || fH <= 110 && fHAcc >= 0 ){
    fH = fH + fHAcc;
    }
    
    if(fH >=100 && fSAcc <= 0 || fH <= 150 && fSAcc >= 0 ){
    fS = fS + fSAcc;
    }
    
    
    if(frameCount%3 == 0){
      
      xSzAcc = random(-1,1);
      ySzAcc = random(-1,1);
    }
    
    if(xSz >=45 && xSzAcc <= 0 || xSz <= 90 && xSzAcc >= 0 ){
    ySz = ySz + ySzAcc;
    }
    
    if(xSz >=45 && xSzAcc <= 0 || xSz <= 90 && xSzAcc >= 0 ){
    xSz = xSz + xSzAcc;
    }
    
    
    noStroke();
    fill(fH, fS, 200, fT);
    ellipse(pos.x, pos.y, xSz, ySz);
  }
}
