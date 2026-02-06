Bubble [] bubbles;
Bubble nBubble;
int c;


void setup(){
  size(1000,500);
  bubbles = new Bubble[0];
  genBub();
  noStroke();
  fill(0);
}

void draw(){
  if(bubbles[bubbles.length-1].done == false){
  bubbles[bubbles.length-1].update();
  bubbles[bubbles.length-1].dNIt();
  } else {
  for(int i = 0; i < bubbles.length; i++){
    background(255);
    bubbles[i].dispPart(); 
  }
  }
}

void genBub(){
  nBubble = new Bubble(random(width), random(height));
  bubbles = (Bubble []) append(bubbles, nBubble);
}

class Bubble {
  float angle, angleAdd,  rAngleAdd, xPos, yPos, xDotPos, yDotPos;
  float c = .1;
  float a, r, rBegin, rMaxSize;
  int red, green, blue;
  int fLightParticle;
  float fLightSz;
  color fLPColor;
  boolean done = false;
  float b;
  
  
  Particle [] particles;
  Particle nParticle;
  
  Bubble(float x, float y){
    xPos = x;
    yPos = y;
    rMaxSize = random(10, 300);
    particles = new Particle [0];
    
  }
  
  void structure(){
    
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
      
      ellipse(xDotPos, yDotPos,1,1);
      nParticle = new Particle(xDotPos, yDotPos);
      particles = (Particle []) append(particles, nParticle);
      particles[particles.length-1].rPos = r;
    }
    r += .1;
    if(r >= rMaxSize){
    done = true;
    fLightParticle = (int) random(particles.length);
    fLightSz = rMaxSize*(random(.01,3));
    //genBub();
    println("done");
    
    red = (int)(random(255));
    green = (int)(random(255));
    blue = (int)(random(255));
    
    fLPColor = color(red,green,blue);
    
    
    for(int i = 0; i<particles.length; i++){
      particles[i].d = dist(particles[fLightParticle].xPos,particles[fLightParticle].yPos, particles[i].xPos, particles[i].yPos);
      if(particles[i].d <= fLightSz){
         particles[i].c =  color(red,green,blue, map(particles[i].d, 0, rMaxSize, 255, 0));
      }
    }
    
    background(255); // apagar depois
    
      for(int i = 0; i < bubbles.length; i++){
      bubbles[i].dispPart(); // necessário otimizar, isto só pode ser rodado quando houver uma nova bolha.
    }
    }
  }
  
  void dispPart(){
    b+= .1;
    for(int i = 0; i<particles.length; i++){
      //b+= .0001;
      fill(particles[i].c);
      particles[i].sz = ((sin(particles[i].rPos+b)))*2;
      ellipse(particles[i].xPos, particles[i].yPos,particles[i].sz,particles[i].sz);
    }
  }
  
}

void mousePressed(){
  //genBub();
  
  //println("ok");
}

class Particle {
  float xPos, yPos, d, sz, rPos;
  color c;
  //float a;
  Particle(float x, float y){
    xPos = x;
    yPos = y;
    c = color(0);
  }
}
