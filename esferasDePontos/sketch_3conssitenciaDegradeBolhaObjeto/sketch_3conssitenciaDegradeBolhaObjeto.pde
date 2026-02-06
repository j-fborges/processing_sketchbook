Bubble [] bubbles;
Bubble nBubble;



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
  float angle, angleAdd, rAngleAdd, xPos, yPos, xDotPos, yDotPos;
  float a, r, rBegin, rMaxSize;
  
  Bubble(float x, float y){
    xPos = x;
    yPos = y;
    rMaxSize = random(10, 200);
    rBegin = random(-PI, PI);
  }
  
  void update(){
    rAngleAdd = random(.001, 1);
    
      r += .1;
    if(r >= rMaxSize -(rMaxSize*.1)){genBub();}
    angleAdd += 0.01*(cos(map(r, 0, rMaxSize, 0, PI)));
  }
  
  void dNIt(){
      for(float i = -PI + rBegin ; i < PI + rBegin; i += angleAdd){
      
      xDotPos = (cos(i)* r) + (xPos);
      yDotPos = (sin(i)* r) + (yPos);
      
      point(xDotPos, yDotPos);
    }
  }
  
}

void mousePressed(){
  genBub();
  println("ok");
}
