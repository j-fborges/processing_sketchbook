PImage back, cursor;

void setup(){
  size(2000, 1000);
  back = loadImage("subBUrec-01.jpg");
  cursor = loadImage("subBUMessage-01.jpg");
  frameRate(30);
  background(255);
  image(back, 0,0);
}

void draw(){
  
    
  
  if(keyPressed){
   save("acabouse.jpg"); 
  }
}

void mouseDragged(){
  image(cursor, mouseX, mouseY);
}
