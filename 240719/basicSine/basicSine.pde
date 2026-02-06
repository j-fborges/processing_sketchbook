float x = 0, y, a;

void setup(){
  size(1000,1000);
  //x = width/2;
  //y = height/2;
  strokeWeight(10);
}

void draw(){
  for(int i = 0; i < 60 *60; i++){
  y = height/2 + sin(a)*300;
  a = a + .001;
  x = x + .1;
  point(x,y);
  }
  noLoop();
 
}

void mousePressed(){
 loop(); 
}
