float x = 0; float y = 0;
int starNum = 37; //(36+1)
float[] starXPos = new float[starNum];
float[] starYPos = new float[starNum];
Star[] stars = new Star[starNum];
float fc;


class Star{
 color c;
 float xPos; float yPos;
 float xWU; float yWU;
 float xEnd1 = 500, yEnd1= 600;
 float xInit, yInit;
 PVector loc = new PVector(random(300)+100, random(300)+100);
 //PVector vel = new PVector(0,0);
 
 float x = 0, y = pow(x,2);
 
  Star(color tempC){
    c = tempC;
    //xPos = tempX;
    //yPos = tempY;
  }
  
  void exist(){
    noFill();
   strokeWeight(2);
   //ellipse(loc.x,loc.y,20,20);
   point(loc.x,loc.y);
  }
  
  void appear(){


  }
  
  void walk(){
    x= x +.05;
    y= pow(x,0.5);

    xEnd1 = xEnd1  +x*.02;
    yEnd1 = yEnd1  +y*.02;
    PVector end1 = new PVector(xEnd1,yEnd1);
    
    PVector acc = PVector.sub(end1, loc);
    
    //acc.normalize();
    acc.mult(.01);
    //vel.add(acc);
    loc.add(acc);
    
    /*if(xPos > xFinal){
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
  size(2000,1000);
  for(int i= 0; i<stars.length; i++){
    stars[i] = new Star(255);
  }
  
}

void draw(){

  //background(255);
  for(int i= 0; i<stars.length; i++){
      stars[i].exist();
    }
  fc = fc + .01;
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