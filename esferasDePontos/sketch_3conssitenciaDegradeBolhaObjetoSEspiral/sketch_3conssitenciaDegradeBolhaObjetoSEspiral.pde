Bubble [] bubbles;
Bubble nBubble;
int c;


void setup(){
  size(1000,500);
  bubbles = new Bubble[0];
  genBub();
}

void draw(){
  
  bubbles[bubbles.length-1].update();
  bubbles[bubbles.length-1].dNIt();
  
  
  
}

void genBub(){
  nBubble = new Bubble(random(width), random(height));
  bubbles = (Bubble []) append(bubbles, nBubble);
}

class Bubble {
  float angle, angleAdd,  rAngleAdd, xPos, yPos, xDotPos, yDotPos;
  float c = .1;
  float a, r, rBegin, rMaxSize;
  
  Bubble(float x, float y){
    xPos = x;
    yPos = y;
    rMaxSize = random(10, 200);
    
  }
  
  void update(){
    if(mousePressed == false) rBegin = random(-PI, PI);
    rAngleAdd = random(.001, 1);
    //c*= 2;
    //angleAdd += 0.005*c;  
    //angleAdd = 0.005*(map(r, 0, rMaxSize, 5000,  0));
    //angleAdd += 0.005*(cos(map(r, 0, rMaxSize, 0,  PI)));
    //angleAdd = (cos(map(r, 0, rMaxSize, 0,  PI)));
    angleAdd = (cos(map(r, 0, rMaxSize, 0,  HALF_PI)));
    angleAdd = abs(angleAdd);
    if(angleAdd <= .001 && angleAdd >= 0) angleAdd = .001; // só pode receber valores positivos!! 
    //angleAdd = (cos(map(r, 0, rMaxSize, 0,  PI/2)));  // este é oque funciona melhor!!
  }
  
  void dNIt(){
      //stroke(0, map(r, 0, rMaxSize, 0,  100));
      for(float i = -PI + rBegin ; i < PI + rBegin; i += angleAdd){ //<>//
      
      xDotPos = (cos(i)* r) + (xPos);
      yDotPos = (sin(i)* r) + (yPos);
      
      point(xDotPos, yDotPos);
      
    }
    r += .1;
    if(r >= rMaxSize){
    genBub();
    println("ok");
    }
  }
  
}
/*
void mousePressed(){
  genBub();
  println("ok");
}*/
