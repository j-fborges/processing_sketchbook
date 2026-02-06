import processing.sound.*;

AudioIn input;
Amplitude rms;

VolCell[] volLn;
VolChain ch;

int audioScle;


void setup(){
  size(2000, 1000);
  
    //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
    input.amp(.7);
  
  ch = new VolChain(width);
  
  volLn = new VolCell[ch.chLength];
  
  for(int i = volLn.length -1 ; i>= 0; i-=1){
    volLn[i] = new VolCell(i);
    
    if( i == 0 ){
      volLn[i].pCI = volLn.length -1;
      volLn[i].nCI = 1;
    } else if( i == volLn.length -1){
      volLn[i].pCI = i -1;
      volLn[i].nCI = 0;
    } else {
      volLn[i].pCI = i -1;
      volLn[i].nCI = i +1;
    }
  }
  fill(0);
  strokeWeight(5);
}

void draw(){
  background(255);
  audioScle = int( map(rms.analyze(), 0, 3, 1, 1000));
  volLn[0].yPos = height/2;
  volLn[0].vVal = audioScle;
  volLn[0].updt();
  volLn[0].disp();
  for(int i = volLn.length -1; i >= 1; i -=1){
      volLn[i].vVal = volLn[volLn[i].pCI].vVal;
      volLn[i].updt();
      volLn[i].disp();
      
  }
  
}

class VolCell {
  float xPos, yPos, sz, vVal, vGraphP;
  int cI, nCI, pCI;
  
  
  
  VolCell(int index){
    cI = index;
    sz = 1;
    yPos = height/2;
    xPos = ch.chLength - float(index/2) - 500;
  }
  
  void updt(){
    yPos = height/2;
    yPos -= vVal;
    vVal -= .2;
    if(yPos > height){
      yPos = height/2;
    }
    
  }
  
  void disp(){
    ellipse(xPos, yPos, sz, sz);
  }
  
  
}

class VolChain{
  float xPos, yPos;
  int chLength;
  
  VolChain(int l){
    chLength = l;
  }
  
  void update(){
    
  }
}
