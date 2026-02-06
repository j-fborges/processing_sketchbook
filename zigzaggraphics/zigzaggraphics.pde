PGraphics pg;
int a;
int b;
int ac;
int va;
int vb;
int bc;
int da=1;

void setup() {
  size(1000, 1000);
  pg = createGraphics(50, 50);
  frameRate (720);
}

void draw(){
  a = a + (va * da);
  b = b + vb;

  if (ac>=0 && ac<=950){
    ac++;
    va = 1;
    vb = 0;
  } else {
    if (bc < 50){
    
    va = 0;
    vb = 1;
    bc = bc + vb;
    } else {
      da = da * -1;
      vb = 0;
      va = 1;
      bc = 0;
      ac = 0;
  }
  }
  
  if (b==height){
    b = 0;
  }
  
  println(da);

 
  

  pg.beginDraw();
  pg.background(102);
  pg.stroke(255);
  pg.line(pg.width*0.5, pg.height*0.5, mouseX -500, mouseY -500);
  pg.endDraw();
  image(pg, a, b); 
}