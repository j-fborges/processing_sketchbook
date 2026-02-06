float cx, cy, a, b, c, d, fx1, fy1, fx2, fy2;
color col;
float f;
void setup(){
  size(1000,1000);
  colorMode(HSB, 400, 255, 255);
  cx = 500;
  cy = 500;
  strokeWeight(5);
  background(0);
}

void draw(){
  background(0);
  f = f + .01;
  col = color(200+(cos(f)*200), 200, 200);
  a += .01;
  b += .007;
  c -= .002;
  d -= .02;
  //ellipse(cx+ cos(a)*300, cy + sin(b)*300, 20,20);
  fx1 = cx + cos(a)*300;
  fy1 = cy + sin(b)*200;
  fx2 = cx + cos(c)*500;
  fy2 = cy + sin(d)*300;
  stroke(col);
  line(fx1, fy1, fx2, fy2);
}
