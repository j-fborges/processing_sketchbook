
// a taxa de processamento é insuficiente


import processing.video.*;

Movie mov;
Table pixData[];


color movColors[];

int movX, movY, frameN;


void setup(){
  size(1280, 720);
  
  pixData = new Table[1041];
  for(int i = 0; i < pixData.length; i++){
  pixData[i].addColumn("frame");
  pixData[i].addColumn("pixIndex");
  pixData[i].addColumn("colorRGB");
  }
  TableRow newRow = pixData.addRow();
  
  mov = new Movie(this, "346060457.mp4");
  mov.play();
  
  
    mov.loadPixels();
    
  println(mov.width + "  " + mov.height);
  movColors = new color[width*height];
}

void draw(){
  /*
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
  println(mov.width + " || " + mov.height);
  }
  background(255);*/
  
  if (mov.available() == true) {
    mov.read();
    mov.loadPixels();
    frameN+=1;
    println(frameN);
  }
  image(mov,0,0);
  
}


class tvPix {
  float x, y;
  int index;
  
  
}
