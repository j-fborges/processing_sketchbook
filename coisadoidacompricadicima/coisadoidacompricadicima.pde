PGraphics pg;
int a;
int b;
int ac;
int va;
int vb;
int nb;
int bi;
int bf;
int bc;
int da;

void setup() {
  size(1000, 1000);
  pg = createGraphics(50, 50);
}

void draw(){
  a = a + va*da;
  b = b + vb;

  if (ac>=0 & ac<=950){
    ac++;
    va = 1;
    vb = 0;
  } else {
    da = da * -1;
    va = 0;
    vb = 1;
    bc = bc + vb;
    if (bc >= 50){
      vb = 0;
      va = 1;
  }
  }
  println(a);

 
  

  pg.beginDraw();
  pg.background(102);
  pg.stroke(255);
  pg.line(pg.width*0.5, pg.height*0.5, mouseX -500, mouseY -500);
  pg.endDraw();
  image(pg, a, b); 
}