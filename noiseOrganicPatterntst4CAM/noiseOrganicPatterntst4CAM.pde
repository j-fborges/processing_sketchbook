import com.jogamp.newt.event.KeyEvent;
import processing.video.*;

Capture video;

int a= 50, b = 2, c;
float noiseX, noiseY;
int ln = 0;
int [] lni = new int [ln]; int nLNI;
//int [] lc = new int[ln]; int nLC;
int []l = new int[ln]; int nL ;
color [] lc = new color [ln]; color nLC;
int counter, counter1;

float xPos, yPos;

boolean loop = false, up, down;
boolean  alt = false, alt1 = false, backG = true;

boolean isQ, isA, isW, isS, isE, isD, isQUESTION, isAPOSTROFE, isSPACE,
is5,isR, is6, isT, is7, isY, is8, isU,
isF,isC,isG, isV, isH, isB, isJ, isN;

void setup(){
  size(2000, 1000, P2D);
  noiseX = random(10000);
  noiseY = random(10000);
  noStroke();
  rectMode(CENTER);
  fill(255, 140, 128);
  video = new Capture(this, 1920, 1080);
  video.start(); 
  ln += 1;
  if(ln>1){
    nL = l[l.length-1] + 3;
  } else {
    nL = 3;
  }
  nLC = color(random(255),random(255),random(255));
  lc = append(lc, nLC);
  l = append(l, nL);
  
}

void draw(){
  video.loadPixels();
  if(isSPACE){
   loop = true; up = true; 
  }
  
  if(isQ){
    a++;
  }
  
  if(isA){
   a--; 
  }
  
  if(isW){
   b++; 
  }
  
  if(isS){
    if(b>1){
      b--;
    }
  }
  
  if(isE){
   c++; 
  }
  
  if(isD){
    if( c>0){
       c--; 
    }
  }
  
  
  if(loop == true){
    counter++;
    
    if(counter1 > 5){
          counter1 = 0; //<>//
          up = false;
        }
    
    if(up == true){
      if(counter >= 1){
        counter = 0;
        counter1++;
        ln += 1;
        if(ln>1){
          //nL = round((l[l.length-1] + c)* 1.2);
          nL = round((l[l.length-1] + c) + 3);
        } else {
          nL = 3;
        }
        nLC = color(random(255),random(255),random(255));
        lc = append(lc, nLC);
        l = append(l, nL); //<>//
        
      }
    } else {

      if(ln<2) {
       loop=false; 
      } else {
        ln -=1;
        l = shorten(l);
        lc = shorten(lc);
      }
    }
    
  }
  if(backG){
  background(255, 250, 205);
  }
  
  xPos += ((mouseX - width/2)*0.0004);
  
  yPos += ((mouseY - height/2)*0.0004);
  
  
  for(int x = 0; x < width; x +=5){
    for(int y = 0; y < height; y += 5){
      float n = noise(x * 0.003 + noiseX + xPos, y * 0.003 + noiseY + yPos, frameCount * 0.004);
      fill(255, 250, 205, 00);
      if(checktypes(0, n) ){
        fill(video.get(x,y));
      }
      if(ln>1){
      for(int i = 0; i < ln; i++){
        
        if(checktypes(i, n) ){
          //if(round(n * a) % b < 2){
          //stroke(255, 140, 128);
          fill(lc[i]);
         // if(int(n * 100) % 6 == 0){
           //stroke(map(round(n * a) % b, 0, 10, 255, 200), 140, 128);
          //if(n > .8){
          //ellipse(x, y, 15, 15); //<>//
          }
          
      }
      
          }
          
      rect(x, y, 5, 5);
    }
  }
}

void keyPressed(){
  checkKey(keyCode, true);
  
  if(keyCode == java.awt.event.KeyEvent.VK_TAB){ 
    if(alt == false) alt= true; else if(alt == true) alt = false;
  }
  
  if(key == '`' || key == '~'){ 
    if(alt1 == false) alt1= true; else if(alt1 == true) alt1 = false; //<>//
  }
  
  if(keyCode == java.awt.event.KeyEvent.VK_CAPS_LOCK){ 
    if(backG == false) backG= true; else if(backG == true) backG = false;
  }
  
}

void keyReleased(){
  checkKey(keyCode, false);
}

boolean intervalcheck(int i_,float n_){
  boolean isit = false;
  int check = 0;
  if(i_ > 1){
    check = l[i_-1];
  } else {
    check = 0;
  }
  if(((round(n_ * a) % b) < l[i_]) && ((round(n_ * a) % b) >= check) ){
    isit = true;
  }
  return isit;
}

boolean checktypes(int i_, float n_){
  boolean isit = false;
  if(alt == true){
    if(alt1 == true){
      if((round(n_ * a) % b) < l[i_] ){
      isit = true;
      }
    } else {
     isit = intervalcheck(i_, n_); 
    }
  } else {
      if(alt1 == true){
        if((round(n_ * a) % b) < l[i_]+c ){
          isit = true;
        }
      
      } else {
        if((round(n_ * a) % b) == l[i_]+c ){
          isit = true;
      }
    }
  }

  return isit;
}

boolean checkKey( int k, boolean b){
  switch(k) {
     case 'q': 
     return isQ = b;
     
     case 'Q': 
     return isQ = b;
     case KeyEvent.VK_A:  
     return isA = b;
     
     case 'w': 
     return isW = b;
     case 'W': 
     return isW = b;
     case 's': 
     return isS = b;
     case 'S': 
     return isS = b;
     case 'e': 
     return isE = b;
     case 'E': 
     return isE = b;
     case KeyEvent.VK_D: 
     return isD = b;
     
     case '5': 
     return is5 = b;
     case '%': 
     return is5 = b;
     case 'r': 
     return isR = b;
     case 'R': 
     return isR = b;
     case '6': 
     return is6 = b;
     case '^': 
     return is6 = b;
     case 't': 
     return isT = b;
     case 'T': 
     return isT = b;
     case '7': 
     return is7 = b;
     case '&': 
     return is7 = b;
     case 'y': 
     return isY = b;
     case 'Y': 
     return isY = b;
     case '8': 
     return is8 = b;
     case '*': 
     return is8 = b;
     case 'u': 
     return isU = b;
     case 'U': 
     return isU = b;
     case 'f': 
     return isF = b;
     case 'F': 
     return isF = b;
     case 'c': 
     return isC = b;
     case 'C': 
     return isC = b;
     case 'g': 
     return isG = b;
     case 'G': 
     return isG = b;
     case 'v': 
     return isV = b;
     case 'V': 
     return isV = b;
     case 'h': 
     return isH = b;
     case 'H': 
     return isH = b;
     case 'b': 
     return isB = b;
     case 'B': 
     return isB = b;
     case 'j': 
     return isJ = b;
     case 'J': 
     return isJ = b;
     case 'n': 
     return isN = b;
     case 'N': 
     return isN = b;
     
     case ';': 
     return isAPOSTROFE = b;
     case ':': 
     return isAPOSTROFE = b;
     case '>': 
     return isQUESTION = b;
     case '.': 
     return isQUESTION = b;
     case KeyEvent.VK_SPACE: 
     return isSPACE = b;

     default:
     
     return b;
     
  }
}

void captureEvent(Capture c) {
  c.read();
}
