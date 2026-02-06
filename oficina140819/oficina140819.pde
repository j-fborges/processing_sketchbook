PImage img;
PGraphics res;
int wd , ht;
color pc;
float a = random(-1,1), b = random(-1, 1);
float l = random(3);
void settings(){
  img = loadImage("data/a3-1.jpg");
  wd = img.width;
  ht = img.height;
  size(wd,ht);
}

void setup(){
  //size(400,400);
  //size(wd,ht);
  frameRate(60*3);
  background(255);
  res = createGraphics(wd,ht);
  res.beginDraw();
  res.image(img,0,0);
  res.endDraw();
  img.loadPixels();
  pc = img.pixels[round(random(img.pixels.length))];
  for(int i = 0; i <height; i++){
    for(int j = 0; j <height; j++){
      //pc = get(img
    }
  }
  //res.noStroke();
  res.strokeWeight(2);
}

void draw(){
  //img.loadPixels();
  res.beginDraw();
  for(int f = 0; f < 60; f++){
  
  for(int i = 0; i <height; i++){
    for(int j = 0; j <height; j++){
      if(res.get(j,i) == pc){
        res.stroke(pc);
        res.strokeWeight(l);
        //res.ellipse(j,i+1, 1, 1);
        res.point(j-1, i);
      }
    }
  }
  
  }
  res.endDraw();
  image(res, 0,0);
  pc = img.pixels[round(random(img.pixels.length))];
  a = random(-1,1); b = random(-1, 1);
  l = random(3);
}

void keyPressed(){
  pc = res.pixels[round(random(res.pixels.length))];
  a = round(random(-2,2)); b = round(random(-2,2));
}
