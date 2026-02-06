PImage myImage;
PImage imgGet;
color pix;
PVector [] particles;
int particleNum = 200;
float n;

void settings(){
  
 size(2000, 1000, P2D);
}

void setup(){
  
  myImage = loadImage("myImage.jpg");
  myImage.resize(width, height);
  /*for(int i = 0; i< particleNum; i++){
    PVector p = particles[i];
    
  }*/
  
  
}

void draw() {
 imgGet = myImage.get(mouseX,mouseY, mouseX +1,mouseY +1);
 pix = myImage.get(mouseX, mouseY);
 //image(myImage, 0, 0,myImage.width*2, myImage.height*2);
 //n = 
  
  
}

void mouseMoved(){
  noStroke();
  fill(pix);
  image(imgGet, mouseX, mouseY);
  //rect(mouseX, mouseY, 1, 1);
  
  
}

class Particles{
 float _x;
 float _y;
 
 PVector accel, vel, loc;
 
 
 void exist(){
  loc.set(random(width), random(height));
 }
 
 
 void update(){
   //vel.
   
 }
  
  
}