float x,
      y,
      z,
      w,
      a = 100;
PShape o;
Vt [] vts;
Vt nvt;

int mNvts = 200;
int nvts = round(random(3, mNvts));

/*
criar forma com n vertices, onde os vertices se movem progressivamente

*/


void setup(){
  size(1000,1000);
  x = width/2;
  y = height/2;
  
  //o = createShape(RECT, 0, 0, 50, 50);
  o = createShape();
  o.beginShape();
  nvts = round(random(3, mNvts));
  //o.noFill();
  o.fill(255);
  vts = new Vt[0];
  nvt = new Vt();
    vts = (Vt[]) append(vts, nvt);
    o.vertex(vts[0].loc.x, vts[0].loc.y);
  for(int i = 1; i < nvts; i++){
    nvt = new Vt();
    vts = (Vt[]) append(vts, nvt);
    o.vertex(vts[vts.length-1].loc.x, vts[vts.length-1].loc.y);
  }
  
  o.endShape(CLOSE);
}

void draw(){
  //background(255);
  
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
  
  o = createShape();
  o.beginShape();
  //o.noFill();
  for(int i = 0; i < vts.length; i ++){
    vts[i].updt();
    //o.vertex(vts[i].loc.x, vts[i].loc.y);
    o.vertex(vts[i].lx, vts[i].ly);
  }
  o.endShape(CLOSE);
  
  z = z + .01;
  x =  (100+ (100*noise(z))) + width/2;
  y =  (100+ (100*noise(z+1000))) + height/2;
  //x = width/2;
  //y = height/2;
  //ellipse(x,y, a,a);
  //shape(o, x, y);
  shape(o, mouseX, mouseY);
}

void keyPressed(){
  o = createShape();
  o.beginShape();
  nvts = round(random(3, mNvts));
  //o.noFill();
  o.fill(255);
  vts = new Vt[0];
  nvt = new Vt();
    vts = (Vt[]) append(vts, nvt);
    o.vertex(vts[0].loc.x, vts[0].loc.y);
  for(int i = 1; i < nvts; i++){
    nvt = new Vt();
    vts = (Vt[]) append(vts, nvt);
    o.vertex(vts[vts.length-1].loc.x, vts[vts.length-1].loc.y);
  }
  
  o.endShape(CLOSE);
}

class Vt {
 PVector loc, vel;
 int nSdx, nSdy;
 float n, vx, vy, lx, ly;
 
 Vt(){
   nSdx = round(random(99999999));
   nSdy = round(random(99999999));
   n = random(random(99999999));
   lx = random(-100,100);
   ly = random(-100,100);
   loc = new PVector(random(-100,100), random(-100,100));
   vel = new PVector(0,0);
 }
 
 void updt(){
   a += .0005;
   noiseSeed(nSdx);
   vx = (100*noise(a));
   noiseSeed(nSdy);
   vy = (100*noise(a));
   //vel = vel.set(vx, vy);
   //loc = loc.add(vel);
   lx = loc.x + vx;
   ly = loc.y + vy;
   //vel = a;
 }
 
}
