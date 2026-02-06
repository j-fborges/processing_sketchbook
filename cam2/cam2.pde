import processing.video.*;
// varias possibilidades! -  mapear com calma.
Capture video;
 int [][] pframes;
 int [] nPFrame;
 int pframesN = height;
 int pframeC;
 int h;
void setup(){
  size(1920, 1080, P2D);
  frameRate(30);
  video = new Capture(this, 160, 120);
  video.start();
  video.loadPixels();
  //nPFrame = new int[video.pixels.length];
  pframesN = height;
  pframes = new int [pframesN] [video.pixels.length];
  pframes[pframeC] = video.pixels;
  noStroke();
  rectMode(CENTER);
}

void draw(){
  //background(255);
  //h=
  fill(255,5);
  //rect(-5,-5, (width +5), (height+5)*2);
  pframeC+=1;
  if(pframeC > pframesN -1){pframeC = 0; }
  pframes[pframeC] = video.pixels;
  
  video.loadPixels();
  nPFrame = new int[video.pixels.length];
  //nPFrame = video.pixels;
  
  //for(int y = 0; y < video.pixels.length; y += 1){
   // nPFrame[y] = video.pixels[y]*mouseX;
  //}
  
  if(keyPressed){
    for(int y = 0; y < video.pixels.length; y += 1){
      for(int x = 0; x < mouseY; x +=1){
      nPFrame[y] += abs(pframes[x][y]);
      }
    }
  } else {
    for(int y = 0; y < video.pixels.length; y += 1){
      for(int x = 0; x < mouseY; x +=1){
      nPFrame[y] += (pframes[x][y]);
      }
    }
  }
  
  //if(mousePressed){
   //println("ok");  //<>//
  //}
  
  /*for(int x = 0; x < video.pixels.length; x +=1){
    int val = abs(nPFrame[x]);
    nPFrame[x] = val/(pframesN/20);
    }*/
    
    for(int x = 0; x < video.pixels.length; x +=1){
    int val = (nPFrame[x]);                          // pode ser abs(nPFrame[x]);
    nPFrame[x] = val/(mouseX+1);
    }
   
    if(keyPressed){
   println("ok");  //<>//
  }
  
  for(int x = 0; x < video.width; x +=1){
    for(int y = 0; y < video.height; y += 1){
      //float n = noise(x * 0.003 + noiseX + xPos, y * 0.003 + noiseY + yPos, frameCount * 0.004);
      //fill(0);
      fill((nPFrame[calc(x,y)]));
      //fill((nPFrame[calc(x,y)]));
      //if((50*map(brightness(video.get(x,y)), 0 , 255, 0, 1))%10 <  3){
        //if((50*map(brightness(nPFrame[calc(x,y)]), 0 , 255, 0, 1))%10 <  3){
        //if(brightness(video.get(x,y)) > 112.5){
          //fill(255);
       // }
        //fill(brightness(video.get(x,y)));
      //}
      //fill(0);
      //if(round(brightness(nPFrame[calc(x,y)]))%10 < 1 ){
         //fill(255);
       // }
      pushMatrix();
      scale(10);
      rect(x, y, 1, 1);
      popMatrix();
      }
    }
  //println(frameRate);
}

int calc(int x_, int y_){
 int wd = video.width;
 int rs = 0;
 //return rs = (round(map(y_, 0, height, 0, video.height))*wd) + round(map(x_, 0, width, 0, video.width));
 return rs = (y_*wd) + x_;
 
}

void captureEvent(Capture c) {
  c.read();
}
