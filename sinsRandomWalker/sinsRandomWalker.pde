Ball [] balls;
int bN = 300, ddirsN = 2;
Ddir [] ampMoveGlobal;
float ampMoveGRes;

void setup(){
  size(2000,1000);
  //bN = round(random(50));
  balls = new Ball[bN];
  for(int i = 0; i< bN; i++){
   balls[i] = new Ball();
  }
  background(255);
  
  ampMoveGlobal = new Ddir [ddirsN];
  for(int i = 0; i< ddirsN; i++){
   ampMoveGlobal[i] = new Ddir();
  }
  
}

void draw(){
  
  if(keyPressed){
  background(255);
  }
  
  ampMoveGRes = 0;
  for(int i = 0; i< ddirsN; i++){
   ampMoveGlobal[i].calc();
   ampMoveGRes += ampMoveGlobal[i].res;
  }
  
  for(int i = 0; i< bN; i++){
   balls[i].updt();
  }
  
}

class Ball{
  float xPos, yPos, xAnch = width/2, yAnch = height/2, xGSum, yGSum, sz, szf, lnwt;
  int xGN, yGN;
  Dir [] xGain, yGain;
  int nSeed;
  float nStart, nGain, nPos;
  int anchTimeCount, nextJump;
  boolean inJump = false;
  float newXAnch, newYAnch, transCount , tXPos, tYPos, transGain;
  float fXPos, fYPos;
  
  Ball(){
   //xAnch = random(width);
   //yAnch = random(height);
   xGN = round(random(1200));
   yGN = round(random(1200));
   xGain = new Dir[xGN];
   yGain = new Dir[yGN];
   nSeed = round(random(99999));
   nGain = random(-.1, .1);
   szf = random(60);
   lnwt = random(.001, 2);
   nextJump = round(random(60, 60000));
   transGain = random(.0001, .01);
   
   for(int i = 0; i < xGN; i++){
     xGain[i] = new Dir();
   }
   
   for(int i = 0; i < yGN; i++){
     yGain[i] = new Dir();
   }
   
  }
  
  void updt(){
    
    noiseSeed(nSeed);
    nPos += nGain;
    sz = szf*noise(nStart+nPos);
    
    if(anchTimeCount >= nextJump){
      
      newXAnch = xPos;
      newYAnch = yPos;
      inJump = true;
      //nextJump = round(random(360, 600));
    }
    
    xGSum = 0;
    for(int i = 0; i < xGN; i++){
      xGain[i].calc();
      xGSum += xGain[i].res;
    }
    
    yGSum = 0;
    for(int i = 0; i < yGN; i++){
      yGain[i].calc();
      yGSum += yGain[i].res;
    }
    
    xPos = xAnch + xGSum;
    yPos = yAnch + yGSum;
    
    tXPos = newXAnch + xGSum;
    tYPos = newYAnch + yGSum;
    
    if(inJump){
     println("ok");
     transCount += transGain;
     fXPos = lerp(xPos, tXPos, transCount);
     fYPos = lerp(yPos, tYPos, transCount);
     
     if(transCount >= 1){
       transCount = 0;
       xAnch = newXAnch;
       yAnch = newYAnch;
       anchTimeCount = 0;
       inJump = false;
     }
     
    } else {
      
      anchTimeCount+=1;
      fXPos = xPos;
      fYPos = yPos;
      
      
      
    }
    
    
    //xPos += xGSum;
    //yPos += yGSum;
    
    //if(xPos > width){ xPos = 0; }
    //if(xPos < 0){ xPos = width; }
    //if(yPos > height){ yPos = 0; }
    //if(yPos < 0){ yPos = height; }
    //strokeWeight(lnwt);
    strokeWeight(noise(nStart+nPos)*1.5);
    ellipse(fXPos, fYPos, sz, sz);
    
  }
  
}

class Dir{
 float gain, gainG, gStart, startSort, amp, res, ampMov, ampMovGlobal, fAmp;
 int d;
 boolean sin = true;
 float  nStart, nGain, nPos;
 int nSeed, dDirsN;
 Ddir [] dDirs;
 
 
 Dir(){
  gain = random(-.012, .012);
  gainG = random(-.5, .5);;
  gStart = random(-9999,9999);
  amp = random(15);
  nSeed = round(random(99999));
  nGain = random(-.1, .1);
  dDirsN = round(random(10));
  
  for(int i = 0; i > dDirsN; i++){
    dDirs[i] = new Ddir();
  }
  
 }
 
 void calc(){
   ampMov = 0;
   
   for(int i = 0; i > dDirsN; i++){
     dDirs[i].calc();
     ampMov += dDirs[i].res;
  }
  
  //amp = dist(mouseX, mouseY, width/2, height/2);
   
   //noiseSeed(nSeed);
   //nPos += gain;
   gainG += gain; 
   res = sin(gStart + gainG)*(amp + ampMov + ampMoveGRes);
   //res = map(noise(nPos + nStart), 0, 1, -1, 1)*amp;
 }
}

class Ddir{
 float gain, gainG, gStart, startSort, amp, res;
 int d;
 boolean sin = true;
 float  nStart, nGain, nPos;
 int nSeed;
 
 
 Ddir(){
  gain = random(-.0012, .0012);
  gainG = random(-.5, .5);;
  gStart = random(-9999,9999);
  amp = random(5);
 }
 
 void calc(){
   //noiseSeed(nSeed);
   //nPos += gain;
   gainG += gain; 
   res = sin(gStart + gainG)*amp;
   //res = map(noise(nPos + nStart), 0, 1, -1, 1)*amp;
 }
}
