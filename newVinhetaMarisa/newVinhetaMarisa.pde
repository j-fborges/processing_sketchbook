int starNum = 37; //(36+1)
Star[] stars = new Star[starNum];
float x = 0; float y = 0;
int fc;



    
    
void setup(){
  size(2000,1000);
  for(int i= 0; i<stars.length; i++){
    stars[i] = new Star();
  }
  
}  



void draw(){
  fc++;
  
  background(255);
  for(int i= 0; i<stars.length; i++){
      stars[i].update();
      stars[i].walk();
    }

  
  //noLoop();
}