float x,
      y,
      z,
      w,
      a = 100;
PShape o;
Vt [] vts;
Vt nvt;
void setup(){
  size(1000,1000);
  x = width/2;
  y = height/2;
  
  //o = createShape(RECT, 0, 0, 50, 50);
  o = createShape();
  o.beginShape();
  o.noFill();
  vts = new Vt[0];
  for(int i = 0; i < round(random(300)); i++){
    nvt = new Vt();
    vts = (Vt[]) append(vts, nvt);
    o.vertex(random(-100,100), random(-100,100));
  }
  
  o.endShape(CLOSE);
}

void draw(){
  background(255);
  /*
  o = createShape();
  o.beginShape();
  o.noFill();
  o.vertex((100*noise(z+4000)), (100*noise(z+5000)));
  o.vertex((100*noise(z+2000)), (100*noise(z-200000)));
  o.vertex((100*noise(z-5000)), (100*noise(z)));
  o.vertex((100*noise(z+66666)), (100*noise(z-77777)));
  o.endShape(CLOSE);
  */
  
  z = z + .01;
  x = sin(z) * (100+ (100*noise(z))) + width/2;
  y = cos(z) * (100+ (100*noise(z))) + height/2;
  
  //ellipse(x,y, a,a);
  shape(o, x, y);
}

void keyPressed(){
  o = createShape();
  o.beginShape();
  o.noFill();
  for(int i = 0; i < round(random(300)); i++){
  o.vertex(random(-100,100), random(-100,100));
  }
  o.endShape(CLOSE);
}

class Vt {
 PVector loc;
 int nSd;
 float n;
 
 Vt(){
   nSd = round(random(99999999));
   n = random(random(99999999));
   loc = new PVector(random(-100,100), random(-100,100));
 }
 
}
