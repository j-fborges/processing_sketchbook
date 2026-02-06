float angle, angleAdd, rAngleAdd, xPos, yPos, xDotPos, yDotPos;
float a, r, rBegin;

void setup(){
  size(1000,500);
}

void draw(){
  rAngleAdd = random(.001, 1);
  r += .1;
  rBegin = random(-PI, PI);
  
  for(float i = -PI + rBegin ; i < PI; i += rAngleAdd){
    
    xDotPos = (cos(i)* r) + (width/2);
    yDotPos = (sin(i)* r) + (height/2);
    
    point(xDotPos, yDotPos);
  }
  
  
}
