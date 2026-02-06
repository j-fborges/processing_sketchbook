float a;
int b = 0;
void setup(){
  size(1000,1000);
  fill(0);
  noStroke();
}

void draw(){
  a += .01;
  //b += 1;
  //noiseSeed(b);
  background(255);
  for(float i = 0; i < height; i += 10){
    for(float j = 0; j < width; j += 10){
      //ellipse(i,j, noise(i+a,j+a)*20, noise(i+a,j+a)*20);
      ellipse(i,j, noise(i,j,a)*20, noise(i,j,a)*20);
    }
  }
    
    
}
