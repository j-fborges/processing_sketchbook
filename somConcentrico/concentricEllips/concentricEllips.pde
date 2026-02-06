
float r1 = 0, elpH, rc;
int elpsNum, elpsIndex;
ellip [] elps;

void setup(){
  
  size(1920, 1080, P2D);
  elps = new ellip[80];
  
  for(int i = 0; i<elps.length; i++){ //<>//
    elps[i] = new ellip();
    elps[i].init();
    if(i%2 == 0){
      elps[i].fillcolor = color(0);
    }
  }
  
  elpsIndex = 0;
  noStroke();
  elps[elpsIndex].r =1;
  
}

void draw(){
  background(255);
  rc += .005;
  elpH = 1980*map(sin(rc), -1, 1, 0, 1);
  
  //elps[elpsIndex].r= elps[elpsIndex].r *1.01;
  elps[0].r = elpH;
  
  for(int i = 1; i<elps.length; i++){  
    elps[i].r = elps[i-1].r* .9;
  }
  
  
  
  
  for(int i = 0; i<elps.length; i++){
    fill(elps[i].fillcolor);
    elps[i].update();
  }
  
  println(frameRate);
}

class ellip {
  float x,y, r;
  color fillcolor = color(255);
  
  void init(){
    x= width/2;
    y = height/2;
    r = 0;
    
    
  }
  
  void update(){
    
    //strokeWeight(r*.01);
    if(r>=2){
   ellipse(x, y, r,r); 
    }
    
    /*if(r> 1920){
     r = 0; 
    }*/
  }
}
