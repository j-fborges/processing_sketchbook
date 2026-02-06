Table radList;
float r1 = 0, rc;
int elpsNum, elpsIndex, elpsH, elpsF, pElpsF;
int [] elpHIndex, sizeOrder;
FloatList radOrder, radGroup;
ellip [] elps;
boolean ordered;
PGraphics animation;


  int ellipseNumber = 20;                  //control
  int rLimit = 500;                        //control

//elps[elps.length-1] -- anchor
void setup(){
  size(1920, 1080, P2D);
  animation = createGraphics(width, height, P2D);
  radList = new Table();
  radList.addColumn("index");
  radList.addColumn("radius");
  
  if(ellipseNumber%2 == 0){ ellipseNumber+=1; }
  
  elps = new ellip[ellipseNumber];
  sizeOrder = new int[ellipseNumber];
  radOrder = new FloatList();
  radGroup = new FloatList();
  
  
    for(int i = 0; i<elps.length; i++){
      radGroup.append(0);
      radGroup.append(0);
      elps[i] = new ellip();
      elps[i].init();
      if(i%2 == 0){
        elps[i].fillcolor = color(0);
      }
    }
    
    
              elpsIndex = 0;
              elps[0].initR = 1;
              elps[0].r = 1;       // CONTROL -- onde começa -- valor mínimo 1
              elps[0].eHeadRef = elps[0].headRef = elps.length-1;
              elps[0].eTailRef = elps[0].tailRef = 1;
              
              elps[elps.length-1].eHeadRef = elps.length-2;
              elps[elps.length-1].eTailRef = 0;
              //elps[0].h = true;
              
              for(int i = 1; i<elps.length-1; i++){  
                
                elps[elps.length-1-i].eTailRef = elps[elps.length-1-i].tailRef = elps.length-i;
                elps[i].eHeadRef = elps[i].headRef = i - 1;
                
                
                elps[i].r = elps[elps[i].headRef].r* elps[i].dVal;
                elps[i].initR = elps[elps[i].headRef].initR* elps[i].dVal;
              }
              
              elps[elps.length-1].initR = elps[elps.length-1].r = 0;
              elps[elps.length-1].headRef = elps.length-1;
              elps[elps.length-1].tailRef = elps.length-1;
              elps[elps.length-1].floor = true;
              pElpsF = elpsF = elps.length-1;
  
  //noFill();
  //noStroke();
  
  ordered = false;
}




void draw(){
  background(255);
  animation.beginDraw();
  animation.clear();
  rc += .005;
  //elpH = 1980*map(sin(rc), -1, 1, 0, 1);
  
  
  //elps[0].r = elpH;
  
  //if(elps[elpsH].r == 0){ elps[elpsH].r = 1;}
  elps[elpsH].r*= 1.01;
  //stroke(255,0,0);
  
  //stroke(0);
  
  
  //elps[0].currentR= lerp(elps[elps[0].tailRef].r, elps[elps[0].headRef].r, elps[0].dVal);
  //elps[0].r= lerp(elps[elps[0].tailRef].r, elps[elps[0].headRef].r, elps[0].dVal);
  
  
  for(int i = 0; i<elps.length; i+=1){
    
    if(i != elpsF && elps[i].floor == true){
      elps[i].headRef = elps[i].eHeadRef;
      elps[i].tailRef = elps[i].eTailRef;
      //elps[i].r = 0;
      elps[i].floor = false;
    }
    
    
    if(i != elpsH && i != elpsF){
      elps[i].r = lerp(elps[elps[i].tailRef].r, elps[elps[i].headRef].r, elps[i].dVal); 
    }
    
    if(elps[sizeOrder[i]].r >rLimit){
      elps[sizeOrder[i]].r = 0;
      //elps[i].r = elps[elps[i].headRef].initR*elps[i].dVal;
      //println(" --- | loop: " + frameCount +" --- | index: " + i + " --- | radius = " + elps[i].r + " --- |" );
      if(sizeOrder[i] == elpsH && elps[sizeOrder[i]].floor == false){
        //elpsH = sizeOrder[int((sizeOrder.length)/2)];
        elpsH = elps[sizeOrder[i]].eTailRef;
        if(frameCount>920){
        println("--- h ---" + elpsH); //<>//
        }
        pElpsF = elpsF = sizeOrder[i];
        //elps[elps[i].eHeadRef].r = 0;
        elps[sizeOrder[i]].headRef = sizeOrder[i];
        elps[sizeOrder[i]].tailRef = sizeOrder[i];
        elps[sizeOrder[i]].floor = true;
        
      }
    }
   
    
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
  }
  
  
  for(int i = 0; i<elps.length; i+=1){
    //animation.stroke((int)map(i, elps.length-1, 0, 0, 255), 0,0);
    //strokeWeight((int)map(i, 0, 19, 0, 5));
    animation.fill(elps[sizeOrder[i]].fillcolor);
    //animation.fill(color((int)random(255),(int)random(255),(int)random(255)));
    elps[sizeOrder[i]].update();
    
      
    
  }
  
  //println(frameRate);
  animation.endDraw();
  //if(mousePressed){
    //if(frameCount>900){
    image(animation,0,0);
    //}
  //}
  println(frameCount);
  if(frameCount>927){
    println("ok"); //<>//
  }
}

class ellip {
  float x,y, r, initR, dVal, currentR, vertA, dotA;
  int headRef, tailRef, eHeadRef, eTailRef, vertN;
  color fillcolor = color(255);
  boolean h, floor;
  PShape shape;
  
  void init(){
    x= width/2;
    y = height/2;
    r = 0;
    dVal = .65;    //CONTROL  --  de .5 a .01
    h = false;
    floor = false;
    vertN = 6;
    dotA = (2*PI)*.001;
  }
  
  void update(){
    
    //strokeWeight(r*.01);
    if(r>=2){
      
   //animation.ellipse(x, y, r,r);
   //vertA = 2*PI/vertN;
   //shape = createShape();
   //shape.beginShape();
   /*
   for(int i = 1; i < vertN+1; i++){
     //shape.vertex(sin(vertA*i-1)*(r/2), cos(vertA*i-1)*(r/2));
     //animation.line((sin(vertA*(i-1))*(r/2))+x,(cos(vertA*(i-1))*(r/2))+y,(sin(vertA*i)*(r/2))+x,(cos(vertA*i)*(r/2))+y);
   }
   //shape.endShape(CLOSE);
   //animation.shape(shape, x, y);
   */
   
     for(float i = 0; i < 2*PI; i+= dotA){
       point((sin(i)*r)+x,(cos(i)*r)+y);
     }
     
    }
    
    
    
  }
}
