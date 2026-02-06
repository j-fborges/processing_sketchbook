PImage myImage;
PImage imgGet;
color pix;
PVector [] particles;
int particleNum = 200;
float n;
float x,y;


void settings(){
 size(2000, 1000);
 //frameRate(120);
}

void setup(){
  frameRate(720);
  myImage = loadImage("myImage.jpg");
  myImage.resize(width, height);
  /*for(int i = 0; i< particleNum; i++){
    PVector p = particles[i];
    
  }*/
  
  
}

void draw() {
  noStroke();
 imgGet = myImage.get(mouseX,mouseY, 100,100);
 pix = myImage.get(mouseX, mouseY);
 //image(myImage, 0, 0,myImage.width*2, myImage.height*2);
 //n = 
 for (int i = 0; i < 1200; i++){
  x = random(0, myImage.width);
  y = random(0, myImage.height);
 
  color minhaCor = myImage.get((int)x, (int)y);
  fill(minhaCor, 50);
  
  //ellipse(x,y, 10,10);
  image(imgGet, x, y);
 }
 println(frameRate);
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