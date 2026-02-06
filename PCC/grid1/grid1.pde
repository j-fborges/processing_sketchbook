Grid g = new Grid();
float baseTxtTypoSz, moduleXSz, moduleYSz, moduleSz, bTypeSz = 12, leadingSz = bTypeSz*1.25;
String[] text;
txtBlock text1, text2;



void setup(){
  size(750, 1000);
  g.init();
  text = loadStrings("data/text.txt");
  //text1 = join(text, " ");

  textSize(bTypeSz);
  textLeading(leadingSz);
  
  text1 = new txtBlock();
  text2 = new txtBlock();
  text1.fileInit("data/text.txt", 12);
  text2.arrayInit( 12);
}



void draw(){
  g.disp();
}




class Grid{
  float gXPos, gYPos, gXSz, gYSz;
  int gModuLnWidthN, gModuLnHeightN, moduN, moduI = 0;
  Module [] gridMs;
  boolean reInit = false;
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
      //gridMs[i].disp();
    }
    fill(0);
    //text(text[2], gridMs[0].mXPos, gridMs[0].mYPos+(leadingSz*.24), gXSz, gYSz );
    text1.disp(gridMs[0].mXPos, gridMs[0].mYPos, 20*leadingSz, 22*leadingSz );
    if(reInit == false && text1.tBContinuedText != null ){
     
    text2.reInit(text1.tBContinuedText);
    reInit = true;
    
    }
    
    //text2.disp( gridMs[0].mXPos, gridMs[40*20].mYPos, 40*leadingSz, 12*leadingSz );
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
 float bXPos, bYPos, bSz, bXSz, bYSz, bBaseTypeSz, bLeadingSz, lTxtHeight = 0, totalHt, hab,blb;
 int bXI, bYI, possibleParagsN, fPossibleParagsN;
 String[] tBText, tBContinuedText ;
 float[] paragHts;
 boolean pHtsCalculated = false, childTBCheck = false, checked = false;
 color bTcolor = color(0, 255),
 bBcolor = color(255, 0);
 
  txtBlock(){
   
 }
 
 void fileInit(String fileDir, float tSz){
   tBText = loadStrings(fileDir);
   paragHts = new float[tBText.length];
   bBaseTypeSz = tSz;
   bLeadingSz = bBaseTypeSz * 1.25;
 }
 
 void arrayInit(float tSz){ //<>//
   //tBText = stringDir;
   //paragHts = new float[tBText.length];
   bBaseTypeSz = tSz;
   bLeadingSz = bBaseTypeSz * 1.25;
 }
 
 void disp(float xPos, float yPos, float xSz, float ySz){
   textSize(bTypeSz);
   textLeading(leadingSz);
   fill(bTcolor);
     if(pHtsCalculated == false){
      for(int i = 0; i < tBText.length; i++){
        lTxtHeight += ((ceil(textWidth(tBText[i])/xSz))* bLeadingSz);
        
         hab = +(ceil(textWidth(tBText[i])/xSz)); blb = ySz; //<>//
         
         if(childTBCheck == false){
           float blockWd = (xSz -xPos)*(ySz/bLeadingSz);
           blockWd = abs(blockWd);
           
           possibleParagsN = tBText.length;
            if(((lTxtHeight - ((ceil(textWidth(tBText[i])/xSz))* bLeadingSz))*(xSz -xPos))+(textWidth(tBText[i])) > blockWd && childTBCheck == false){ //algo errado aqui //<>//
              possibleParagsN = i+1;
              println("a"); //<>//
              float excedingTxtLnN = ((lTxtHeight - ((ceil(textWidth(tBText[i])/xSz))* bLeadingSz)) + (ceil(textWidth(tBText[i])/xSz))) - (xSz*(ySz/bLeadingSz));
              float paragLnLimitN = (ceil(textWidth(tBText[i])/xSz)) - excedingTxtLnN;
              float paragLnLimitNWidth = paragLnLimitN*xSz;
               //<>//
              
              for(int j = 1; j < tBText[i].length(); j++){
                String sParag = tBText[i].substring( 0, j);
                println("b");
                float sParagWidth = textWidth(sParag);
                int  rParagsN = (paragHts.length) - i;
                
                
                  if(sParagWidth > blockWd && checked == false){
                    tBContinuedText = new String[rParagsN];
                    println("c");
                    tBContinuedText[0] = tBText[i].substring( j-1, tBText[i].length()); //<>//
                    print(tBContinuedText[0]); //<>//
                    for(int k = 1; k < rParagsN; k++){
                      tBContinuedText[k] = tBText[(k+i)]; //<>//
                    }
                    childTBCheck = true; //<>//
                    checked = true;
                  }
                
              }
              //print(tBContinuedText[0]);
          }
         }
      
        paragHts[i] = lTxtHeight - ((ceil(textWidth(tBText[i])/xSz))* bLeadingSz); //<>//
      }
      
      pHtsCalculated = true;
     }
     for(int i = 0; i < possibleParagsN; i++){
     text(tBText[i], xPos, (yPos + paragHts[i])+(bLeadingSz*.24), xSz, ySz);
     }
   
 }
 
 void reInit(String[] stringDir){
   tBText = stringDir;
   paragHts = new float[tBText.length];
   tBContinuedText = new String[0];
 }
 

}
