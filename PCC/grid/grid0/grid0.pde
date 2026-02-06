Grid g = new Grid();
float baseTxtTypoSz, moduleXSz, moduleYSz, moduleSz, bTypeSz = 12, leadingSz = bTypeSz*1.25;
String[] text;
txtBlock text1;



void setup(){
  size(750, 1000);
  g.init();
  text = loadStrings("data/text.txt");
  //text1 = join(text, " ");

  textSize(bTypeSz);
  textLeading(leadingSz);
  
  text1 = new txtBlock("data/text.txt", 12);
  
  
}



void draw(){
  g.disp();
}




class Grid{
  float gXPos, gYPos, gXSz, gYSz;
  int gModuLnWidthN, gModuLnHeightN, moduN, moduI = 0;
  Module [] gridMs;
  
  void init(){
   gXSz = .8*width;
  gYSz = .8*height;
  gXPos = (width/2) - (gXSz/2);
  gYPos = (height/2) - (gYSz/2); 
  
  gModuLnWidthN =(int)(gXSz/leadingSz);
  gModuLnHeightN =(int)(gYSz/leadingSz);
  moduN = gModuLnWidthN * gModuLnHeightN;
  gridMs = new Module[moduN];
  
  for(int i = 0; i < gModuLnHeightN; i++){
    for(int j = 0; j < gModuLnWidthN; j++){
      
      gridMs[moduI] = new Module((j*leadingSz)+gXPos, (i*leadingSz)+gYPos);
      moduI += 1;
    }
  }
  
  gXSz = gModuLnWidthN * leadingSz;
  gYSz = gModuLnHeightN * leadingSz;
  
  
  }
  
  
  void disp() {
    fill(255);
    rect(gXPos, gYPos, gXSz, gYSz);
    
    
    for(int i = 0; i < gridMs.length; i++){
      gridMs[i].disp();
    }
    fill(0);
    //text(text[2], gridMs[0].mXPos, gridMs[0].mYPos+(leadingSz*.24), gXSz, gYSz );
    text1.disp(gridMs[0].mXPos, gridMs[0].mYPos, 4*leadingSz, 10*leadingSz );
  }
    
}
  
  


class Module{
  float mXPos, mYPos, mSz, mXSz, mYSz, mLeadingSz;
  int mXI, mYI;
  Module(float xPos, float yPos){
    mXPos = xPos;
    mYPos = yPos;
    
    mLeadingSz = leadingSz;
    mSz = leadingSz;
    mXSz = leadingSz;
    mYSz = leadingSz;
  }
  
  void init(){
 
  }
  
  void disp(){
   rect(mXPos, mYPos, mXSz, mYSz); 
  }
}

class txtBlock{
 float bXPos, bYPos, bSz, bXSz, bYSz, bBaseTypeSz, bLeadingSz, lTxtHeight = 0,hab,blb;
 int bXI, bYI, possibleParagsN, fPossibleParagsN;
 String[] tBText, tBContinuedText ;
 float[] paragHts;
 boolean pHtsCalculated = false, childTBCheck = false, checked = false;
 color bTcolor = color(0, 255),
 bBcolor = color(255, 0);
 
  txtBlock(String fileDir, float tSz){
   tBText = loadStrings(fileDir);
   paragHts = new float[tBText.length];
   bBaseTypeSz = tSz;
   bLeadingSz = bBaseTypeSz * 1.25;
 }
 
 void init(){
   
 }
 
 void disp(float xPos, float yPos, float xSz, float ySz){
   textSize(bTypeSz);
   textLeading(leadingSz);
   fill(bTcolor);
   if(tBText.length == 1){
   text(tBText[0], xPos, yPos+(leadingSz*.24), xSz, ySz );
   } else {
     if(pHtsCalculated == false){
      for(int i = 1; i < tBText.length; i++){
        lTxtHeight += ((ceil(textWidth(tBText[i])/xSz))* bLeadingSz); //<>//
         
        if(paragHts[i-1]+(ceil(textWidth(tBText[i])/xSz)) > ySz && childTBCheck == false){
          possibleParagsN = i;
          println("a");
          float excedingTxtLnN = (paragHts[i-1] + (ceil(textWidth(tBText[i])/xSz))) - (xSz*(ySz/bLeadingSz));
          float paragLnLimitN = (ceil(textWidth(tBText[i])/xSz)) - excedingTxtLnN;
          float paragLnLimitNWidth = paragLnLimitN*xSz;
          float paragLength = tBText[i].length();
          
          for(int j = 0; j < tBText[i].length(); j++){
            String sParag = tBText[i].substring( 0, j);
            
            float sParagWidth = textWidth(sParag);
            int cI = j, lParag = i, rParagsN = (paragHts.length) - i;
            tBContinuedText = new String[rParagsN];
            
            if(sParagWidth > paragLnLimitNWidth && checked == false){
              tBContinuedText[0] = tBText[i].substring( j-1, tBText[i].length());
              for(int k = 1; k < rParagsN; k++){
                tBContinuedText[k] = tBText[i+k];
              }
              checked = true;
            }
          }
       childTBCheck = true;
      } else{
        
        possibleParagsN = tBText.length;
      }
      
        paragHts[i] = lTxtHeight;
      }
      pHtsCalculated = true;
     }
     for(int i = 0; i < possibleParagsN; i++){
     text(tBText[i], xPos, (yPos + paragHts[i])+(bLeadingSz*.24), xSz, ySz);
     }
   }
   
   
   
 }
 
}
