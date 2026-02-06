Alien alien1;


void setup(){
  size(700,700);
  alien1 = new Alien(1);
}

void draw(){
  //background(0);
  alien1.displayAlien();
  alien1.floatAlien();
  
  
}

class Alien {
  int var;
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  int xdir;
  int ydir;
  float xc=0;
  float yc=0;
  
  Alien (int tempVar, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed, int tempXdir, int tempYdir, float tempXc, float tempYc, ){
    var = tempVar;
    xpos = temXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
    xdir = tempXdir;
    ydir = tempYdir;
    xc = tempXc;
    yc = temp
   
  


  void displayAlien(){
    color c=0;
    stroke(255);
    fill(c);
    rectMode(CENTER);
    rect(xpos,ypos, 30,20);
  }

  void floatAlien(){
    
    xspeed = xspeed*xdir;
    yspeed = yspeed*ydir;
    //xpos= 50;
   // ypos= -20;
    xpos= xpos+ xspeed;
    ypos= ypos+ yspeed;
    println(xc);
  
    if (xc>=50 && xc<=width-50){ //MOVIMENTOZIGZAG
      xc++;
      xspeed = 1;
      yspeed = 0;
    } else {
      if (yc < 50){
    
      xspeed = 0;
      yspeed = 1;
      yc = yc + yspeed;
      } else {
        xdir = xdir * -1;
        yspeed = 0;
        xspeed = 1;
        yc = 0;
        xc = 0;
    }
    }
  
    if (ypos==height+19){
      ypos = -20;
    }
  }
}  