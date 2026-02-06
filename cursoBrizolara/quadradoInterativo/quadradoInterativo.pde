float x, y;

void setup(){
  size(1000,1000);
  background(0,0,255);
  noStroke();
  frameRate(720);
  rectMode(CENTER);
}

void draw(){
  PVector mouse = new PVector(mouseX, mouseY);
  x = map(mouseX, 0, 1000, 0, 255);
  y = map(mouseY, 0, 1000, 0, 255);
  fill(mouseX+mouseY,mouseX*mouseY,mouseY-mouseX);
  
  
  
  if(mousePressed){
    rect(mouseX, mouseY, 100, 100);
  }
  if(keyPressed == true){
   
  background(0,0,255);
  }
}