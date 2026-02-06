int x = 0, pX = 0, nX = 0;
float pY = 0, nY = 0, y;

void setup(){
 size(2000,1000);
 background(255);
 strokeWeight(10);
}

void draw(){
  pX = nX;
  pY = nY;
  x ++;
  y = random(1000);
  nX = x;
  nY = y;
  point(x,y);
  //line(pX, pY, nX, nY);
}