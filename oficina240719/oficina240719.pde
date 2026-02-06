PGraphics g;
PImage i;
float x,y,a,b,c,xP,yP;

void setup(){
  size(1000,1000);
  g = createGraphics(1000,1000);
  xP = 500;
  yP = 500;
}

void draw(){
  a += .01;
  xP+= random(-.01,.01);
  yP+= random(-.01,.01);
  x = xP + (cos(a)*200);
  y = yP + (sin(a)*200);
  g.beginDraw();
  g.ellipse(x,y, 40,40);
  g.endDraw();
  
  image(g,0,0);
}
