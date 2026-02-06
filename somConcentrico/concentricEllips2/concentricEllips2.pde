
float r1 = 0, elpH, rc;
int elpsNum, elpsIndex;
int [] elpHIndex;
ellip [] elps;

void setup(){
  size(1920, 1080, P2D);
  elps = new ellip[20];
  
  
  
    for(int i = 0; i<elps.length; i++){ //<>//
      elps[i] = new ellip();
      elps[i].init();
      if(i%2 == 0){
        elps[i].fillcolor = color(0);
      }
    }
    
    
              elpsIndex = 0;
              elps[0].r = elps[0].initR = 1;
              elps[0].headRef = elps.length-1;
              elps[elps.length-1].tailRef = 0;
              for(int i = 1; i<elps.length; i++){  
                elps[i].initR = elps[i].r = elps[i-1].r* elps[i].dVal;
  
                elps[elps.length-1-i].tailRef = elps.length-i;
                elps[i].headRef = i - 1;
                
              }
  
  noFill();
  //noStroke();
}




void draw(){
  background(255);
  rc += .005;
  elpH = 1980*map(sin(rc), -1, 1, 0, 1);
  
  
  //elps[0].r = elpH;
  elps[0].r*= 1.01;
  //stroke(255,0,0);
  //elps[0].update();
  //stroke(0);
 
  
  for(int i = 1; i<elps.length; i++){
    elps[i].r= lerp(elps[elps[i].headRef].r, elps[elps[i].tailRef].r, .5);
    //fill(elps[i].fillcolor);
    elps[i].update();
    println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
    
    /*if(elps[i].r >500){
      elps[i].r = elps[elps[i].headRef].initR * elps[i].dVal;
      println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
      
    }
    */
  }
  
  
  
  
  //println(frameRate);
}

class ellip {
  float x,y, r, initR, dVal;
  int headRef, tailRef;
  color fillcolor = color(255);
  
  void init(){
    x= width/2;
    y = height/2;
    r = 0;
    dVal = .9;
    
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
