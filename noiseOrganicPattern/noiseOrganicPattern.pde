
int a= 50;
float noiseX, noiseY;

void setup(){
  size(400, 400, P2D);
  noiseX = random(10000);
  noiseY = random(10000);
  stroke(255, 140, 128);
}

void draw(){
  background(255, 250, 205);
  for(int x = 0; x < width; x +=1){
    for(int y = 0; y < height; y += 1){
      float n = noise(x * 0.003 + noiseX, y * 0.003 + noiseY + frameCount *.01, frameCount * 0.004);
      //if(round(n * 200) % 8 == 0){
       // if(int(n * 100) % 6 == 0){
         stroke(map(round(n * a) % 8, 0, 10, 255, 200), 140, 128);
        //if(n > .8){
        point(x, y); //<>//
      //}
    }
  }
}
 void keyPressed(){
  a++; 
 }
