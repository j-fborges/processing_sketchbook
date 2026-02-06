

void setup(){
  
}

void draw(){
  
}

class Grid{
 PVector pos;
 float wdth, hght, moduleSz;
 int xModuleLength, yModuleLength, modN;
 int [] freeMods = new int [0];
 Module [] mods;
 Module nMod;
 RectObj [] rects;
 int nRectId;
 
 
 
 Grid(float x_, float y_, float wdth_, float hght_, float moduleSz_){
   pos = new PVector(x_, y_);
   wdth = wdth_;
   hght = hght_;
   moduleSz = moduleSz_;
   
   xModuleLength = floor((pos.x + wdth)/moduleSz);
   xModuleLength = floor((pos.y + hght)/moduleSz);
   
   int jCount = 0, iCount = 0;
   
   for(float j = pos.y; x_ < pos.y + hght; j += moduleSz){
     for(float i = pos.x; x_ < pos.x + wdth; i += moduleSz){
       nMod =  new Module(i, j, iCount + (jCount*xModuleLength));
       mods = (Module[]) append(mods, nMod);
       freeMods = (int[]) append(freeMods, iCount + (jCount*xModuleLength));
       iCount += 1;
     }
     jCount += 1;
   }
   
 }
 
 void nRect(){
   nRectId = freeMods[round(random(freeMods.length-1))];
   
   
   
 }
 
 
 void sortFreeMods(){
   
 }
 
}

class Module{
  PVector pos;
  int id;
  boolean occupied = false;
  
  Module(float x_, float y_, int id_){
    
   pos = new PVector(x_, y_);
   id = id_;
    
  }
  
}

class RectObj{
  
}
