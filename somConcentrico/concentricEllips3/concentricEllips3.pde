Table radList;
float r1 = 0, elpH, rc;
int elpsNum, elpsIndex;
int [] elpHIndex, sizeOrder;
FloatList radOrder, radGroup;
ellip [] elps;
boolean ordered;
PGraphics animation;

  int ellipseNumber = 400;                  //control


void setup(){
  size(1920, 1080, P2D);
  animation = createGraphics(width, height, P2D);
  radList = new Table();
  radList.addColumn("index");
  radList.addColumn("radius");
  
  elps = new ellip[ellipseNumber];
  sizeOrder = new int[ellipseNumber];
  radOrder = new FloatList();
  radGroup = new FloatList();
  
  
    for(int i = 0; i<elps.length; i++){ //<>//
      radGroup.append(0);
      radGroup.append(0);
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
  
  ordered = false;
}




void draw(){
  if(frameCount%2 == 0) background(255);
  animation.beginDraw();
  animation.clear();
  rc += .005;
  elpH = 1980*map(sin(rc), -1, 1, 0, 1);
  
  
  //elps[0].r = elpH;
  
  elps[0].r*= 1.01;
  
  //stroke(255,0,0);
  
  //stroke(0);
  
  
  for(int i = 1; i<elps.length; i+=1){
    elps[i].r= lerp(elps[elps[i].tailRef].r, elps[elps[i].headRef].r, elps[i].dVal); 
    
    //stroke((int)map(i, 0, 19, 0, 255), 0,0);
    //strokeWeight((int)map(i, 0, 19, 0, 5));
    
    //println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
    
    /*if(elps[i].r >500){
      elps[i].r = elps[elps[i].headRef].initR * elps[i].dVal;
      println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
      
    }
    */
  }
  
  if(ordered == false){                    
    for(int i = 0; i<elps.length; i+=1){
      radGroup.set(i,elps[i].r);
      radOrder.set(i,elps[i].r);
    }
    radOrder.sortReverse();
    
    
        for(int i = 0; i<elps.length; i+=1){
          for(int j = 0; j<elps.length; j+=1){
          
            if(radOrder.get(i) == radGroup.get(j)){
              sizeOrder[i] = j;
            }
          }
        }
        //ordered = true;
    //println(sizeOrder);
    //println(radOrder);
  }
  
  
  for(int i = 0; i<elps.length; i+=1){
    //animation.fill(elps[sizeOrder[i]].fillcolor);
    elps[sizeOrder[i]].update();
    if(elps[i].r >4000){
      elps[i].r = elps[i].initR;
      println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
      
    }
  }
  
  //println(frameRate);
  animation.endDraw();
  if(frameCount%2 == 0){
    image(animation,0,0);
  }
  
  println(frameRate);
}

class ellip {
  float x,y, r, initR, dVal;
  int headRef, tailRef, cheadRef, ctailRef;
  color fillcolor = color(255);
  
  void init(){
    x= width/2;
    y = height/2;
    r = 0;
    dVal = .5;    //CONTROL  --  de .5 a .01
    
  }
  
  void update(){
    
    //strokeWeight(r*.01);
    if(r>=2){
   animation.ellipse(x, y, r,r); 
    }
    
    /*if(r> 1920){
     r = 0; 
    }*/
  }
}
