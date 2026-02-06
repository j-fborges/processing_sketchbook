import processing.video.*;

Movie m;
float mLgth;

float interval, nInterval, mPoint, minTresh, maxInter, interCount, interPoint;
boolean nP = true;

PGraphics res;

String id = nf(year()) + nf(month()) +nf(day()) +nf(hour()) + nf(minute()) + nf(second()) + nf(second());



void setup(){
  size(1280, 720);
  m = new Movie(this, "1.mp4");
  m.loop();
  m.read();
  //size(m.width, m.height, JAVA2D);
  PImage tst = m.get();
  res = createGraphics(width, height);
  
}

void draw(){
  if(nP){
    //minTresh = random(3, 10);
   //m.stop();
   mPoint = random(m.duration() - 1);
   maxInter = m.duration()- mPoint;
   if(maxInter > 10){
     interval = random(10);
   } else {
     interval = random(maxInter);
   }
   
   nP = false;
   interPoint = mPoint + interval;
   m.jump(mPoint);
   m.loop();
   interCount = 0;
  } else {
    if(m.time() >= interPoint){
      nP = true;
    }
    
    
    
  }
  res.beginDraw();
  res.image(m, 0,0, width, height);
  res.endDraw();
  res.save("data/frames/" +id+ "/frame"+frameCount+"of"+id+".jpg");
  
  if(frameCount >= 60*60){
    exit();
    println("done");
  }
  
}

void movieEvent(Movie m) {
  m.read();
}
