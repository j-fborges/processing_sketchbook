float a;

void setup() {
  size(1000,1000);
  frameRate(15);
  fill(0);
}

void draw(){
  background(255);
   //a += .1;
  for(float i = 100; i < height-100;  i += noise(a)*30){
     a += random(0,.2);
   for(int j = 100; j < width-100; j+= 5){
     float h = i+a;
     if(h>height){ h=0;}
    //ellipse( j+(cos(i+a)*200), i+a ,.01 ,.01 );
    ellipse(i, j, 5, 5);
   }
  }
}
