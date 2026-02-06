float x = 0; float y = 0;
float t;
void setup(){
  size(1000,1000);
  background(255);
  translate(500, 500);
  pushMatrix();
}

void draw(){
  translate(500, 500);
   t += .1;
   x = -500 + 5*t;
  y=  - (pow((t),2))+ 100*t + 500;
  y /= 10;
  point(x,y);
}