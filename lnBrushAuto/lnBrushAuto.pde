PVector loc,vel,acc;
Sline rat;
float xdisloc = 0, ydisloc;
float lnSzAdd, dFAdd;
int dPeriod;

void setup(){
  size(1000,500);
  rat = new Sline();
  loc = new PVector(50, 50);
  vel = new PVector(random(-2,2), random(-2,2));
  acc = new PVector(random(-.1,.1), random(-.1,.1));
  lnSzAdd = random(-.1,.1);
  stroke(0);
  dPeriod = (int)random(1, 2);
}

void draw(){
  acc = new PVector(random(-.1,.1), random(-.1,.1));
  lnSzAdd = random(-.1,.1);
  dFAdd = random(-.1,.1);
  //vel.set(random(-2,2), random(-2,2));
  vel = vel.add(acc);
  loc.add(vel);
  rat.lnSz += lnSzAdd;
  rat.dF += dFAdd;
  if(rat.lnSz <= 0){
    rat.lnSz = 1;
  }
  if(frameCount%(60*dPeriod) == 0){
    xdisloc += 100; //<>//
    dPeriod = (int)random(1, 2);
    if(loc.x > width) {
      xdisloc = 50;
      loc.x = 0;
      ydisloc += 100;
    }
    loc.set(0 + xdisloc, 0 + ydisloc);
    if(loc.y >height){
      ydisloc = 50;
      loc.y = 0;
    }
  }
  if(loc.x > width || loc.x < 0 || loc.y > height || loc.y < 0){
    loc.set(width/2, height/2);
  }
  
  rat.update(loc.x, loc.y);
  rat.dr0w();
}

class Sline {
  
  float xPos, yPos, lnSz, lnSzDir, lnSzPwr, angle, aRotPwr, aRotDir, dF, dFDir, dFPwr;
  
  
  
  Sline(){
    
    angle = 0;
    aRotDir = 1;
    aRotPwr = .01;
    dF = 4;
    dFDir = 1;
    dFPwr = .01;
    lnSz = 50;
  }
  
  
  void update(float xLoc, float yLoc){
    angle = angle + (aRotDir*aRotPwr);
    xPos = xLoc;
    yPos = yLoc;
    lnSz = lnSz + (lnSzDir* lnSzPwr);
  }
  
    void dr0w(){
      
    float vertexXa = cos(PI+angle)*(lnSz)+xPos;
    float vertexYa = sin(PI+angle)*(lnSz)+yPos;
    float vertexX2a = cos(TWO_PI+angle)*(lnSz)+xPos;
    float vertexY2a = sin(TWO_PI+angle)*(lnSz)+yPos;
      
      if(dF>1){
          for(float i = 0; i<lnSz; i= i+dF){
            float vertexX = cos(PI+angle)*i+xPos;
            float vertexY = sin(PI+angle)*i+yPos;
            float vertexX2 = cos(TWO_PI+angle)*i+xPos;
            float vertexY2 = sin(TWO_PI+angle)*i+yPos;
            
            point(vertexX,vertexY);
            point(vertexX2,vertexY2);
            
        }
      } else {
        
        line(vertexXa,vertexYa, vertexX2a, vertexY2a);
    }
  }
}
