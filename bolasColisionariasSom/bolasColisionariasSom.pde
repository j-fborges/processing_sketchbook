/* 
bolas que reagem ao som
*/

Ball[] balls;
int ballsN = 20;
PVector grav;


void setup(){
  size(1000,500);
  balls = new Ball[ballsN];
  
  for(int i = 0; i < ballsN; i++){
   balls[i] = new Ball(); 
   balls[i].id = i;
   balls[i].loc =  new PVector(random(width), random(height));
  }
  
}

void draw(){
  
}

class Ball {
  Float xPos, yPos,
  sz, //radius
  plusSz;  //acrescimo do input de som
  int id; //index in the array
  PVector loc, dir, vel, acc, reactAcc;
  
   Ball(){
    
  }
  
  void colisionCheck(){
    for(int i = 0; i < ballsN; i++){
      if(i!= id){
        if(dist(loc, balls[i].loc) < sz+plusSz){
          
        }
      }
    }
  }
  
}
