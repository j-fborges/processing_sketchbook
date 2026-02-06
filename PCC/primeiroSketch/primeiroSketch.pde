
Object[] sqrs = new Object[5];
boolean allOk = false;

int savedI, savedJ;
int fc;
void setup() {
  size(500, 500);
  background(255);
  strokeWeight(4);
  for(int i = 0; i < sqrs.length; i++){
    sqrs[i] = new Object();
    sqrs[i].init();
    sqrs[i].gen();
  }
  noLoop();
  thread("check");
}

void draw() {
  background(255);
   fdraw();
   noLoop();
   /*
for(int i = 0; i < sqrs.length; i++){
    println("||-- index: " + i + " -- || -- xPos: " + sqrs[i].xPos + " -- || -- yPos: " + sqrs[i].yPos + " -- || -- sz: " + sqrs[i].sz);
   }
  */
  //loop();
}

void check(){
  fc = fc +1;
  println("phase: 'check'  || frameCount: " + fc);
  for(int i = 0; i < sqrs.length; i++){
    println("phase: 'check - 'i' iteration'  || frameCount: " + fc + "  ||  'i' iteration: " +i);
      for(int j = 0; j < sqrs.length; j++){
        //println("phase: 'check - 'j' iteration'  || frameCount: " + fc + "||  'i' iteration: " +i+ "||  'j' iteration: " +j);
        if(i!=j){
         if(sqrs[i].xPos >= (sqrs[j].xPos - sqrs[j].marginSz) && sqrs[i].xPos <= ((sqrs[j].xPos + sqrs[j].sz)+ sqrs[j].marginSz) || sqrs[i].yPos >= (sqrs[j].yPos - sqrs[j].marginSz) && sqrs[i].yPos <= ((sqrs[j].yPos + sqrs[j].sz)+ sqrs[j].marginSz)){
           sqrs[i].ok = false;
           savedI = i;
           savedJ = j;
           thread("savedRegen");
         }
        }
      }
  }
  thread("fCheck");
}


void savedCheck(){
  fc = fc +1;
  println("phase: 'savedCheck'  || frameCount: " + fc);
  for(int i = savedI; i < sqrs.length; i++){
    //println("phase: 'savedCheck - 'i' iteration'  || frameCount: " + fc + "  ||  'i' iteration: " +i + " ||  saved I: " + savedI);
      for(int j = 0; j < sqrs.length; j++){
        //println("phase: 'savedCheck - 'j' iteration'  || frameCount: " + fc + "||  'i' iteration: " +i+ "||  'j' iteration: " +j);
        if(i!=j){
         if(sqrs[i].xPos >= (sqrs[j].xPos - sqrs[j].marginSz) && sqrs[i].xPos <= ((sqrs[j].xPos + sqrs[j].sz)+ sqrs[j].marginSz) || sqrs[i].yPos >= (sqrs[j].yPos - sqrs[j].marginSz) && sqrs[i].yPos <= ((sqrs[j].yPos + sqrs[j].sz)+ sqrs[j].marginSz)){
           sqrs[i].ok = false;
           savedI = i;
           thread("savedRegen");
         }
        }
      }
  }
  thread("check");;
}

void regen(){
  for(int i = 0; i < sqrs.length; i++){
    if(sqrs[i].ok == false){
      sqrs[i].gen();
    }
  }
}

void savedRegen(){
  fc = fc +1;
  println("phase: 'savedRegen'  || frameCount: " + fc + "savedI: " + savedI);

    if(sqrs[savedI].ok == false){
      sqrs[savedI].gen();
      sqrs[savedI].ok = true;
    }
    thread("savedCheck");

}

void fCheck(){
  allOk = true;
  for(int i = 0; i < sqrs.length; i++){
    if(sqrs[i].ok == false){
     allOk = false;
     thread("check");
    }
  }
  redraw();
}

void fdraw(){
  fc = fc +1;
  println("phase: 'fdraw'  || frameCount: " + fc );
  for(int i = 0; i < sqrs.length; i++){
    sqrs[i].disp();
  }
}


class Object {
  float xPos, yPos, xSz , ySz, regisX, regisY, regisXsize, regisYsize, marginSz, sz;
  color clr;
  boolean ok;
  
  void init(){
    ok = false;
  }
  
  
  void gen(){
   xPos = random(width);
   yPos = random(height);
   
   sz = random(0, 100);
   marginSz = random(0,10);
   
  }
  
  
  void disp(){
   rect(xPos, yPos, sz, sz); 
  }
  
}
