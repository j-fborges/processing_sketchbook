import de.voidplus.leapmotion.*;
import processing.sound.*;


AudioIn input;
Amplitude rms;
float audioScleParam = 3.5;
int audioScle;

float a, b, c,s;
float x,y,z, w;
String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());

LeapMotion leap;
Hand h;
PVector pos, cam;

float lx, ly, lz, lx2, ly2, lz2;


void setup(){
  size(1920, 1080, P3D);
  //fullScreen(P3D);
  //noFill();
  noStroke();
  //stroke(255);
  //fill(255,255,255,50);
  //perspective(PI,float(width)/float(height), 1000, 1000 );
  
  leap = new LeapMotion(this);
  //h = leap.getHand(leap.getId());
  pos = new PVector(0,0,0);
  cam = new PVector(0,0,0);
  
  //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
    input.amp(.7);
  
}

void leapOnInit() {
  // println("Leap Motion Init");
}
void leapOnConnect() {
  // println("Leap Motion Connect");
}
void leapOnFrame() {
  // println("Leap Motion Frame");
}
void leapOnDisconnect() {
  // println("Leap Motion Disconnect");
}
void leapOnExit() {
  // println("Leap Motion Exit");
}

void draw(){
  
  if(keyPressed){
     if(key == 'q'){
      audioScleParam += .1;
    }
    
    if(key == 'a'){
      audioScleParam -= .1;
    } 
  }
  
  audioScle = int( map(rms.analyze(), 0, audioScleParam, 1, 1000));
  
  fill(0);
  text(nf(audioScleParam), width -200, height -100);
  fill(255);
  
  a+= .01;
  b+= .00001;
  c += .001;
  s += .01;
//background(0);
//lights();
  for (Hand hand : leap.getHands ()) {
    if(hand.isRight()){
         pos = hand.getPosition();
         
         Finger  fingerIndex        = hand.getIndexFinger();
         
         if(fingerIndex.isExtended() == true){
         pushMatrix();
        translate(map(pos.x, 300, width -300, -100, width +100), map(pos.y, 300, height-300, -100, height+100), map(pos.z, 0, width/10, 0, width));
        
        lx = map(pos.x, 300, width -300, -100, width +100);
        ly = map(pos.y, 300, height-300, -100, height+100);
        lz = map(pos.z, 0, width/10, 0, width);
        
        
        //box(pos.z*3);
        //box(40+ (400*(0 + (.0001*audioScle))));
        popMatrix();
         }
       }
       
       if(hand.isLeft()){
         cam = hand.getPosition();
         
         Finger  fingerIndex        = hand.getIndexFinger();
         
         if(fingerIndex.isExtended() == true){
         
         pushMatrix();
        translate(map(pos.x, 300, width -300, -100, width +100), map(pos.y, 300, height-300, -100, height+100), map(pos.z, 0, width/10, 0, width));
         
         lx2 = map(cam.x, 300, width-300, -PI, PI);
         ly2 = map(cam.z, 0, width/20, -PI, PI);
         lz2 = map(cam.y, 300, height-300, -PI, PI);
         
         popMatrix();
         }
         //camera( cam.x,   cam.y, cam.z, pos.x, pos.y, pos.z, 0, 1, 0);
       }
  }

if(mousePressed && mouseButton == RIGHT) {stroke(255); strokeWeight(.5);}else noStroke();
if(mousePressed && mouseButton == LEFT){ x = random(-400, 400); y = random(-400, 400); z = random(-400, 400); w=200;}
if(w>1)w=w*.99;
pointLight(255,255,255,x,y,z);
//shininess(50*sin(s));
spotLight(200*sin(c), 30, 70, map(mouseX, 0, width, -7000, 7000),map(mouseY, 0, height, -7000, 7000),-100, 0,0,0, PI, 0);
camera(lx, ly, lz, 0, 0, 0.0, 
       0.0, 1, 0.0);
       //perspective(PI/3.0, width/height, ((height/2.0) / tan(PI*60.0/360.0))/10.0, ((height/2.0) / tan(PI*60.0/360.0))*10.0);
       
       //pushMatrix();
//translate(lx, ly, lz);
       
       rotateX(lx2);
       rotateY(ly2);
       rotateZ(lz2);
       scale(  (2*(.5 + (.0001*audioScle))));
       
       
       for(float i = -400; i < 400  ; i += 40+w ){
         for(float j = -400; j < 400 ; j += 40+w ){
           for(float k = -400; k < 400 ; k += 40+w ){
             
           //pushMatrix();
  translate(i, j, k);
  rotateX(b);
  //rotateY(PI/3);
  pushMatrix();
  //scale(  (.5*(1 + (.0001*audioScle))));
  box(30*sin(dist(i,j,k,500,500, 500)+a));
  popMatrix();
  //sphere(30*sin(dist(i,j,k,500,500, 500)+a));
  translate(-i,-j,-k);
  //popMatrix();
  

  
         //  }
         //}
       }
       //println("ok");
       //save("data/frames/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
      // if(keyPressed){
       //save("data/still/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
       }
       //if(frameCount >= 60*60){
       // exit(); 
       }
       //popMatrix();
}
