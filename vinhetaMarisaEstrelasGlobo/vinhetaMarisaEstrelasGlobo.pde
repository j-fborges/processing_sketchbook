float x = 0; float y = 0;
int starNum = 37; //(36+1)
float[] starXPos = new float[starNum];
float[] starYPos = new float[starNum];
Star[] stars = new Star[starNum];
int fc;


class Star{
 color c;
 float xPos; float yPos;
 float xWU; float yWU;
 float xFinal = 600, yFinal= 600;
 float xInit, yInit;
  Star(color tempC){
    c = tempC;
    //xPos = tempX;
    //yPos = tempY;
  }
  void exist(){
    noFill();
   strokeWeight(2);
   ellipse(xPos,yPos,20,20);
   point(xPos,yPos);
  }
  void appear(){
    xPos =  random(1000);
    yPos =  random(1000);
    xInit = xPos; yInit = yPos;
  }
  
  void walk(){
    
    if(xPos > xFinal){
      xPos--;
    }
    if(yPos > yFinal){
      yPos--;
    }
    
    if(xPos < xFinal){
      xPos++;
    }
    if(yPos < yFinal){
      yPos++;
    }
    /*for(float xWU = xPos; xWU >= xFinal; xWU = xWU+1){
      
    }*/
  }
    
}

void setup(){
  size(1000,1000);
  for(int i= 0; i<stars.length; i++){
    stars[i] = new Star(255);
  }
  
}

void draw(){
  background(255);
  for(int i= 0; i<stars.length; i++){
      stars[i].exist();
    }
  fc++;
  /*strokeWeight(5);
    for(int i = 0; i<starXPos.length; i++){
    starXPos[i] =  random(300);
      starYPos[i] =  random(300);
      point(starXPos[i],starYPos[i]);
    
  }
  */
  
  if(fc<2){
    for(int i= 0; i<stars.length; i++){
      stars[i].appear();
    }
  }
  for(int i= 0; i<stars.length; i++){
      stars[i].walk();
    }
  
  //noLoop();
}