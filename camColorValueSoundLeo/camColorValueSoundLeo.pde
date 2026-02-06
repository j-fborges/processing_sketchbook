




import processing.video.*;
// varias possibilidades! -  mapear com calma.
Capture video;
 int [][] pframes;
 int [] nPFrame;
 int pframesN = 300;
 int pframeC;
 int h;
 
 
 PGraphics vid;
 PImage frame = new PImage();
 int initFrame = 2, frameIndex = 0;
import processing.sound.*;



String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());
AudioIn input;
Amplitude rms;

Table radList;
float r1 = 0, rc;
int elpsNum, elpsIndex, elpsH, elpsF, pElpsF;
int [] elpHIndex, sizeOrder;
FloatList radOrder, radGroup;

boolean ordered;
PGraphics animation;
int audioScle = 1;
float audioScleParam = 3.5;

  int ellipseNumber = 20;                  //control
  int rLimit = 700;                        //control

//elps[elps.length-1] -- anchor


// Declare the sound source and Waveform analyzer variables
SoundFile sample;
Waveform waveform;

// Define how many samples of the Waveform you want to be able to read at once
int samples = 100;
 
 
 String [] impVals;
 int [] readyVals;
 int audioValIndex;
 
void setup(){
  size(1920, 1080, P2D);
  vid = createGraphics(width, height, P2D);
  frameRate(60);
  //video = new Capture(this, 160, 120);
  //video.start();
  //video.loadPixels();
  //nPFrame = new int[video.pixels.length];
  //pframesN = 500;
   frame = loadImage("frames/2020828202010/"+"202082820203dTire"+nf(initFrame+frameIndex)+".png");
   frame.loadPixels();
  pframes = new int [pframesN] [frame.pixels.length];
  pframes[pframeC] = frame.pixels;
  vid.beginDraw();
  vid.noStroke();
  vid.endDraw();
  rectMode(CENTER);
  readyVals = new int [0];
  impVals = loadStrings("values60-1.txt");
  for(int i = 0; i< impVals.length; i++){
    int nVal = int(impVals[i]);
    readyVals = append(readyVals, nVal);
  }
  
  
    
    // Load and play a soundfile and loop it.
 // sample = new SoundFile(this, "por dentro de um pneu.wav");
  //sample.loop();

  // Create the Waveform analyzer and connect the playing soundfile to it.
  //waveform = new Waveform(this, samples);
  //waveform.input(sample);
  
  //Create an Audio input and grab the 1st channel
   // input = new AudioIn(this, 0);
    
    // start the Audio Input
    //input.start();
    
    // create a new Amplitude analyzer
   // rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    //rms.input(sample);
    //sample.amp(.7);
  
}

void draw(){
  PImage frame = new PImage();
  frame = loadImage("frames/2020828202010/"+"202082820203dTire"+nf(initFrame+frameIndex)+".png");
  frame.loadPixels(); //<>//
  
  
  
  if(keyPressed){
     if(key == 'q'){
      audioScleParam += .1;
    }
    
    if(key == 'a'){
      audioScleParam -= .1;
        if(audioScleParam <= 0){
          audioScleParam = .1;
        }
    } 
  }
  audioScle=0;
  //audioScle = int( map(rms.analyze(), 0, 2, 1, pframesN));
  if(frameIndex>60*10){
    audioScle = readyVals[audioValIndex];
    
    if(audioValIndex >= readyVals.length-1){
      audioScle=0;
    } else { audioValIndex+=1; }
  }
  
  //background(255);
  //h=
  //fill(255,5);
  //rect(-5,-5, (width +5), (height+5)*2);
  pframeC+=1;
  if(pframeC > pframesN -1){pframeC = 0; }
  pframes[pframeC] = frame.pixels;
  
  //video.loadPixels();
  
  nPFrame = new int[frame.pixels.length];
  nPFrame = frame.pixels;
  
  //for(int y = 0; y < video.pixels.length; y += 1){
   // nPFrame[y] = video.pixels[y]*mouseX;
  //}
  
  if(keyPressed){
    for(int y = 0; y < frame.pixels.length; y += 1){
      for(int x = 0; x < int(audioScle); x +=1){
        if(alpha(pframes[x][y]) > 0){
          nPFrame[y] += abs(pframes[x][y]);
        }
      }
    }
  } else {
    for(int y = 0; y < frame.pixels.length; y += 1){
      for(int x = 0; x < int(audioScle); x +=1){
       if(alpha(pframes[x][y]) > 0){
         nPFrame[y] += (pframes[x][y]);
       }
      }
    }
  }
  
  //if(mousePressed){
   //println("ok"); 
  //
  
  for(int x = 0; x < frame.pixels.length; x +=1){
    int val = (nPFrame[x]);
    nPFrame[x] = val/(pframesN/(int(pframesN*.9)));
    }
    
    /*
    for(int x = 0; x < video.pixels.length; x +=1){
    int val = (nPFrame[x]);                          // pode ser abs(nPFrame[x]);
    nPFrame[x] = val/(int(lerp(0, 20, (.001*audioScle)+.35)));
    }
   */
    if(keyPressed){
   println("ok"); 
  }
  
  vid.beginDraw();
  vid.background(255);
  
  for(int x = 0; x < frame.width; x +=1){
    for(int y = 0; y < frame.height; y += 1){
      //float n = noise(x * 0.003 + noiseX + xPos, y * 0.003 + noiseY + yPos, frameCount * 0.004);
      //fill(0);
      vid.fill((nPFrame[calc(x,y)]));
      //if(alpha(nPFrame[calc(x,y)]) < 100) vid.fill(255);;
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
      //pushMatrix();
      //scale(10);
      vid.rect(x, y, 1, 1);
      //popMatrix();
      }
    }
    
    vid.endDraw();
    
    background(255);
    image(vid,0,0);
    vid.save("data/renderframes/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dTire"+frameCount+".png");
  //println(frameRate);
  
  //text(nf(audioScle), 1000, 700);
  
  frameIndex+=1;
  if(frameIndex>=5399) exit();
}

int calc(int x_, int y_){
 int wd = frame.width;
 int rs = 0;
 //return rs = (round(map(y_, 0, height, 0, video.height))*wd) + round(map(x_, 0, width, 0, video.width));
 return rs = (y_*wd) + x_;
 
}

void captureEvent(Capture c) {
  c.read();
}
