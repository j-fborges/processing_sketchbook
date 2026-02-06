void setup(){
  size(1000,1000);
}

void draw(){
  background(255);
  for(int i = 100; i < height - 100; i = i + 40){
    float a = 0;
     a = a + 1;
   for(int j = 100; j < width -100; j = j + 40){
     
     ellipse( j + cos(a)*200,i, 20,20);
   }
  }
}
