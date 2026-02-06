float a;
float b;
int f= frameCount;

void setup(){
  
  size(600,600);
}


void draw(){
  a= (a+0.3)%mouseX;
  b= (b+0.4)%mouseY;
  for(int x=100; x<500; x=x+100){
    for(int y=100; y<500; y=y+100){
      line(x,y,x+a,y+b);
    }
  }
 
}