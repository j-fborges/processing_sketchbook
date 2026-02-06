  

import processing.video.*;
Movie myMovie;
int newFrame = 0;
int x=width;

void setup() {
  size(1280, 720);
  myMovie = new Movie(this, "dsc_0266.MOV");
  myMovie.frameRate(0);
  myMovie.loop();
}

void draw() {
  
  int y++;
  int z=y%30;
  
  
  if (myMovie.available()) {
    myMovie.read();
  image(myMovie, 0, 0);
  loadPixels();
  for (int i = 0; i < height; i++){
    pixels[i]= updatePixels();
  }
    updatePixels();
     {
  
    if (z==0) {
      if (0 < newFrame) newFrame--; 
    } else if (keyCode == RIGHT) {
      if (newFrame < getLength() - 1) newFrame++;
    }
  
  setFrame(newFrame);  
}
  }}
  
  int getFrame() {    
  return ceil(mov.time() * 30) - 1;
}

void setFrame(int n) {
  mov.play();
    
  
  

}
  void movieEvent(Movie m) {
  m.read();
}