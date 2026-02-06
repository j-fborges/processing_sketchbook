int n = 0;
int d = 0;
int c = 0;
int m = 0;

float x;
float y;
float z;

float a;
float b;

void setup(){
  size( 700 , 700);
  background(255);
  frameRate(80000000);
}

void draw(){
  for(y=0; m<2800*6; y=y+1){
  x= n + d + c + m;
  
  n++;
  z=z+ 0.00000000000001;
  
  a= cos(y)*x/100;
  b= sin(y)*x/100;
  strokeWeight(z);
  point(b+width/2,a+height/2);
  
  if(n==9){
    n=0;
    d++;
  }
  
  if(d==9){
    d=0;
    c++;
  }
  
  if(c==9){
    c=0;
    m++;
  }

  }}