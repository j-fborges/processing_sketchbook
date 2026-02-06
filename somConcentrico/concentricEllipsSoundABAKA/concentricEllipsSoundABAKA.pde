import processing.sound.*;


AudioIn input;
Amplitude rms;

Table radList;
float r1 = 0, rc;
int elpsNum, elpsIndex, elpsH, elpsF, pElpsF;
int [] elpHIndex, sizeOrder;
FloatList radOrder, radGroup;
ellip [] elps;
boolean ordered;
PGraphics animation;
int audioScle;
float audioScleParam = 3.5;

  int ellipseNumber = 20;                  //control
  int rLimit = 700;                        //control

//elps[elps.length-1] -- anchor
void setup(){
  size(970, 540, P2D);
  animation = createGraphics(width, height, P2D);
  radList = new Table();
  radList.addColumn("index");
  radList.addColumn("radius");
  
  
  //Create an Audio input and grab the 1st channel
    input = new AudioIn(this, 0);
    
    // start the Audio Input
    input.start();
    
    // create a new Amplitude analyzer
    rms = new Amplitude(this);
    
    // Patch the input to an volume analyzer
    rms.input(input);
    input.amp(.7);
  
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
  
  if(keyPressed){
     if(key == 'q'){
      audioScleParam += .1;
    }
    
    if(key == 'a'){
      audioScleParam -= .1;
    } 
  }
  
  audioScle = int( map(rms.analyze(), 0, audioScleParam, 1, 1000));
  

  
  if(elps[elpsH].r == 0){ elps[elpsH].r = 1;}

  elps[elpsH].r*= (1.00 + (.0001*audioScle));

  
  fill(0);
  text(nf(audioScleParam), width -200, height -100);
  

  
  
  for(int i = 0; i<elps.length; i+=1){
    
    if(i != elpsF && elps[i].floor == true){
      elps[i].headRef = elps[i].eHeadRef;
      elps[i].tailRef = elps[i].eTailRef;

      elps[i].floor = false;
    }
    
    
    if(i != elpsH && i != elpsF){
      elps[i].r = lerp(elps[elps[i].tailRef].r, elps[elps[i].headRef].r, (.001*audioScle)+.35); 
    }
    
    if(elps[sizeOrder[i]].r >rLimit){
      elps[sizeOrder[i]].r = 0;

      if(sizeOrder[i] == elpsH && elps[sizeOrder[i]].floor == false){

        elpsH = elps[sizeOrder[i]].eTailRef;
         //<>//
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
 
  }
  
  
  for(int i = 0; i<elps.length; i+=1){

    animation.fill(elps[sizeOrder[i]].fillcolor);

    elps[sizeOrder[i]].update();
    
      
    
  }
  
  //println(frameRate);
  animation.endDraw();

    image(animation,0,0);

 //<>//
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
    
    
    if(r>=2){
      
   animation.ellipse(x, y, r,r);
   
    }
    
    
    
  }
}
