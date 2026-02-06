PShape f;
float v1x = random(200,800), v1y = random(200,800), v2x = random(200,800), v2y = random(200,800);
float p, i;

void setup(){
  size(1000,1000, P2D);
  v1x = random(200,800);
  v1y = random(200,800);
  v2x = random(200,800);
  v2y = random(200,800);
  f = createShape();
}

void draw(){
  //background(200);
  i += .01;
  p = sin(i);
  
  f = createShape();
  f.beginShape();
  f.vertex(mouseX, mouseY);
  
  f.bezierVertex(lerp(mouseX, v1x,p) ,lerp(mouseY, v1y, p), lerp(v1x, v2x,p), lerp(v1y, v2y, p), v1x, v1y);
  f.bezierVertex(lerp(v1x, v2x,p), lerp(v1y, v2y, p), lerp(v2x, mouseX,p), lerp(v2y,mouseY,p), v2x, v2y);
  f.bezierVertex(lerp(v2x, mouseX,p), lerp(v2y, mouseY, p), lerp(mouseX, v1x, p), lerp(mouseY, v1y, p), mouseX,mouseY);
  f.endShape();
  
  shape(f);
  
  
}

void keyPressed(){
  v1x = random(200,800);
  v1y = random(200,800);
  v2x = random(200,800);
  v2y = random(200,800);
  }
