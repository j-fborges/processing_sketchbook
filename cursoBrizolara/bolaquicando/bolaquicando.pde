int diametro=40;
int posX, posY;
int velX, velY;

void setup() {
  size(400,400);
  frameRate(90);
  posX=100; posY=100;
  velX = 10; velY = 20;
}

void draw(){
  background(127);
  posX =posX + velX;
  posY = posY + velY;
  if(posX >= width){
    velX *= -1;
  }else{
    if(posX< 0){
      posX = 0;
      velX*=-1;
    }
  }
  if(posY >= width){
    velY *= -1;
  }else{
    if(posY< 0){
      posY = 0;
      velY*=-1;
    }
  }
      
      
  ellipse(posX, posY, diametro, diametro);
}