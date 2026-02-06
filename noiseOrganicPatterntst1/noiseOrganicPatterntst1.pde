
int a= 50, b = 2;
float noiseX, noiseY;

void setup(){
  size(1000, 1000, P2D);
  noiseX = random(10000);
  noiseY = random(10000);
  stroke(255, 140, 128);
}

void draw(){
  if ( keyPressed){
    a++; 
  }
  
  if (mousePressed){
   b++; 
  }
  background(255, 250, 205);
  for(int x = 0; x < width; x +=1){
    for(int y = 0; y < height; y += 1){
      float n = noise(x * 0.003 + noiseX, y * 0.003 + noiseY , frameCount * 0.004);
      if(round(n * a) % b == 0){
        stroke(255, 140, 128);
       // if(int(n * 100) % 6 == 0){
         //stroke(map(round(n * a) % b, 0, 10, 255, 200), 140, 128);
        //if(n > .8){
        point(x, y); //<>//
      }
      if(round(n * round(a)) % round(b) == 8){
        stroke(0, 140, 128);
       // if(int(n * 100) % 6 == 0){
         //stroke(map(round(n * a) % b, 0, 10, 255, 200), 140, 128);
        //if(n > .8){
        point(x, y);
      }
    }
  }
}
