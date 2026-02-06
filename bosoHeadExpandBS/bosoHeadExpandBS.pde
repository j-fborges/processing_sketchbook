import processing.video.*;
import processing.sound.*;


AudioIn input;
Amplitude rms;

float audioScleParam = 3.5;
int audioScle;

Movie m;
PVector anch;

Px [] pxs;
Px nPx;

PGraphics mask, vid;

boolean nAnch = true;

/*void settings(){
  m = new Movie(this,   "boso.mp4" );
  m.play();
  m.read();
  
  size(m.width, m.height);
}
*/

void setup() {
  size(264,144);
  
  pxs = new Px [0];
  //nPx = new Px();
  
  m = new Movie(this,   "boso.mp4" );
  vid = createGraphics(256, 144);
  m.play();
  m.read();
  
  
  //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
    input.amp(.7);
  
 rectMode(CENTER);
 noStroke();
 vid.beginDraw();
 vid.rectMode(CENTER);
 vid.noStroke();
 vid.endDraw();
}

void draw() {
  
  if(keyPressed){
     if(key == 'q'){
      audioScleParam += .1;
    }
    
    if(key == 'a'){
      audioScleParam -= .1; //<>//
    } 
  }
  
  audioScle = int( map(rms.analyze(), 0, audioScleParam, 0, 1));
  
  
  
  vid.beginDraw();
  //vid.scale(6);
  vid.image(m,0,0, width, height);
  
  
  
  
  
  vid.endDraw();
  
  image(vid, 0, 0);
  
  for(int i = 0; i < pxs.length; i++){
   pxs[i].updt(); 
  }
  
  if(nAnch == true){
    ellipse(mouseX, mouseY, 50, 100);
    
    if(mousePressed){
      anch = new PVector(mouseX, mouseY);
        for(int i = mouseY - (10); i< mouseY + (10) ; i++){
       for(int y = mouseX - (5); y < mouseX +(5) ; y++){
         if(dist(anch.x, anch.y, y, i) < 10){
           nPx = new Px(y, i, m.get(y,i), atan2( i - anch.y, y - anch.x), dist(anch.x, anch.y, y, i));
           pxs = (Px[]) append(pxs, nPx);
         }
       }
      }
      
      nAnch = false;
    }
  }
  fill(0);
  text(nf(audioScleParam), width -200, height -100);
  //text(nf(get(round(mouseX), round(mouseY))), width -200, height -100);
  fill(255);
}

class Px {
 PVector loc, loc1, acc, vel;
 color c;
 float a, d;
 int x, y;
 
 Px(int x_, int y_, color c_, float a_, float d_){
   loc = new PVector(x_, y_);
   loc1 = new PVector(x_, y_);
   c = c_;
   a = a_;
   d = d_;
   x = round(loc1.x);
   y = round(loc1.y);
 }
 
 void updt(){
   loc.set(loc1.x + (lerp(d, d*10,audioScle)*cos(a)) , loc1.y + (lerp(d, d*10,audioScle)*sin(a)));
   vid.loadPixels();
   fill(vid.get(x, y));
   rect(loc.x, loc.y, 1, 1);
 }
 
}

void movieEvent(Movie m) {
  m.read();
}

void keyPressed(){
  if(key == 'z'){
    nAnch = true;
    pxs = new Px [0];
  }
}
