
// a taxa de processamento é insuficiente


import processing.video.*;

Movie mov;
Table pixData;

color movColors[];

int movX, movY;


void setup(){
  size(1280, 720);
  
  pixData = new Table();
  
  pixData.addColumn("index");
  pixData.addColumn("colorRGB");
  TableRow newRow = pixData.addRow();
  
  mov = new Movie(this, "346060457.mp4");
  mov.play();
  
  
    mov.loadPixels();
    
  println(mov.width + "  " + mov.height);
  movColors = new color[width*height];
}

void draw(){
  /*if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
  println(mov.width + " || " + mov.height);
  }*/
  background(255);
  
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    
    int count = 0;
    for (int j = 0; j < height; j++) {
      for (int i = 0; i < width; i++) {
        movColors[count] = mov.get(i, j);
        count++;
      }
    }
  }
  
  int count = 0;
  for (int j = 0; j < height; j++) {
    for (int i = 0; i < width; i++) {
      stroke(movColors[count]);
      point(i,j);
      count++;
    }
  }
  
  
}


class tvPix {
  float x, y;
  int index;
  
  
}
