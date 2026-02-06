boolean axis = true;
boolean alt = true;
boolean Vstroke = true;
float t;
float df=1; //dot frequency
float lnsz = 1; //line size
float tc = 8.5; //times*canvas
int fc = 1; //frame count
float lnwt = 1; //line weight
float lnaa = 100; //line alpha
float wheelPwr = .05; //potencia da roda do mouse
int bType;
int mType;
int vertexN = 1;
float angle;
float cxp = width/2, cyp =height/2;
int kType;
int bHue=255;
int bBright = 0;
int bSatu = 255;
int bAlpha = 100;
int fHue=0;
int fBright = 0;
int fSatu = 0;
int fAlpha = 100;
int cHue=0;
int cBright = 0;
int cSatu = 0;
int cAlpha = 100;
int pWidth, pHeight;
int tS = 0; //times saved
color mBrush = color (255, 255, 255, 100);
float inc; //mouseWheel comand Var
String sCat = "gravurasFeira"; //save category
String sLoc = day()+"."+month()+"."+year()+"."+hour()+"."+minute()+"."+millis();
String sDay = day()+"."+month()+"."+year();

color mFill = color (0, 0, 0, 100);
color mbackground = color (0, 0, 0, 100);
PGraphics result;
PGraphics pointer;
PGraphics print;

boolean isQ, isA, isW, isS, isE, isD;

void settings(){
  size(800,1000);
}

void setup(){
  pWidth = int( width * tc);
  pHeight = int( height*tc);
  result = createGraphics(width,height);
  pointer = createGraphics(width,height);
  print = createGraphics(pWidth, pHeight);
  cursor(CROSS);
  frameRate(60);
  colorMode(HSB, 255, 255, 255, 100);
  mBrush = color (255, 255, 255, 100);
  mFill = color (0, 0, 255, 100);
  mbackground = color (0, 0, 255, 100);
  pointer.beginDraw();
  result.beginDraw();
  result.background(255);
  print.beginDraw();
  //print.background(255);
  print.strokeWeight(1*tc);
  print.fill(0);
}

boolean checkKey( int k, boolean b){
  switch(k) {
     case 'q': 
     return isQ = b;
     
     case 'Q': 
     return isQ = b;
     case 'a': 
     return isA = b;
     case 'A': 
     return isA = b;
     case 'w': 
     return isW = b;
     case 'W': 
     return isW = b;
     case 's': 
     return isS = b;
     case 'S': 
     return isS = b;
     case 'e': 
     return isE = b;
     case 'E': 
     return isE = b;
     case 'd': 
     return isD = b;
     case 'D': 
     return isD = b;

     default:
     
     return b;
     
  }
}

void keyPressed(){
  checkKey(keyCode, true);
 /* switch(keyCode){
    case '1':
      mType = 0;
       bType = 0;
       angle=0;
       cxp = width/2;
      cyp = height/2;
      mBrush = color(bHue, bSatu, bBright, bAlpha);
      pointer.stroke(mBrush);
      result.stroke(mBrush);
      print.stroke(mBrush);
    break;
    
    case
  }
  */
  if(key == '1' || key == '!'){
     mType = 0;
     bType = 0;
     angle=0;
     cxp = width/2;
    cyp = height/2;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
    }
  if(key == '2' || key == '@'){
     mType = 0;
     bType = 1;
     df = 1;
     angle=0;
     cxp = width/2;
    cyp = height/2;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush); 
  }
  if(key == '3' || key == '#'){
    mType = 0;
    vertexN = 3;
    bType = 2;
    df = .001;
    angle=0;
    cxp = width/2;
    cyp = height/2;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);

    mFill = color(fHue, fSatu, fBright, fAlpha);
    pointer.fill(mFill);
    result.fill(mFill);
    print.fill(mFill);

  }
  if(key == '4' || key == '$'){
    vertexN = 3;
    bType = 3;
    df = .001;
    angle=0;
    cxp = width/2;
    cyp = height/2;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
  }
  if(key == '5' || key == '%'){
    cxp = width/2;
    cyp = height/2;
    bType = 4;
    df =1;
    angle=0;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
  }
 /* 
  switch(keyCode){
    case 'q':
      angle = angle +.01;
    break;
    
    case 'Q':
      angle = angle +.01;
    break;
    
    case 'a':
      angle = angle -.01;
    break;
    
    case 'A':
      angle = angle -.01;
    break;
    
    case 'w':
      if(bType==1 || bType==4){
      df = df + .1;
    }
    if(bType==2 || bType == 3){
      if(df<1){
        df = df + .001;
      } else {
        df =1;
      }
    }
  
    break;
    
    case 'W':
    if(bType==1 || bType==4){
      df = df + .1;
    }
    if(bType==2 || bType == 3){
      if(df<1){
        df = df + .001;
      } else {
        df =1;
      }
    }
      
    break;
    
    case 's':
      if(bType==1 || bType==4){
      if(df>1){
      df= df -.1;
      } else {
        df = 1;
      }
    }
    if(bType==2 || bType == 3){
     if(df>.001){
        df=df-.001;
        } else {
          df = .001;
        }
      }
    break;
    
    case 'S':
      if(bType==1 || bType==4){
      if(df>1){
      df= df -.1;
      } else {
        df = 1;
      }
    }
    if(bType==2 || bType == 3){
     if(df>.001){
        df=df-.001;
        } else {
          df = .001;
        }
      }
    break;
  }
  
  */
  
  
  

  
  if(key == 'e' || key == 'E'){
   kType = 1;
  }
  if(key == 'Z' || key == 'z'){
    if(vertexN>3){
      vertexN = vertexN - 1;
    } else {
      lnwt = 3;
    }
  }
    if(key == 'x' || key == 'X'){
      vertexN = vertexN + 1;
  }
 if(key == 'u' || key == 'U'){
   kType = 11;
 }
 if(key == 'i' || key == 'I'){
   kType = 12;
 }
 if(key == 'o' || key == 'O'){
   kType = 13;
 }
 if(key == 'p' || key == 'P'){
   kType = 14;
 }
 if(key == 'h' || key == 'H'){
   kType = 21;
 }
 if(key == 'j' || key == 'J'){
   kType = 22;
 }
 if(key == 'k' || key == 'K'){
   kType = 23;
 }
 if(key == 'l' || key == 'L'){
   kType = 24;
 }
 if(key ==' '){
   result.beginDraw();
   result.fill(color(cHue, cSatu, cBright, cAlpha));

   result.rect(-10,-10, width+10,height+10);

   result.fill(mFill);
   print.beginDraw();
   print.fill(color(cHue, cSatu, cBright, cAlpha));

   print.rect(-10,-10, width+10,height+10);

   print.fill(mFill);

 }
 if(key == '0'){
   mType = 0;
  }
   if(key == '9'){
   mType = 1;
  }
   if(key == '8'){
   mType = 2;
  }
  if(key == 'r'|| key == 'R'){
   if(bType==2){
     if(Vstroke == true){
       Vstroke = false;
       pointer.noStroke();
       result.noStroke();
       print.noStroke();

     } else {
       Vstroke = true;
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);

  }
 }
}
  
  if(key == BACKSPACE){
   result.clear();
   result.beginDraw();
   result.background(255);
   print.clear();
   //print.background(255);
  }
  
  if(keyCode == 't' || keyCode == 'T'){
    if(alt == true){
      alt = false;
    } else {
      alt = true;
       mFill = color(fHue, fSatu, fBright, fAlpha);
      pointer.fill(mFill);
      result.fill(mFill);
    }
  }
    
  if(key == CODED){
    if(keyCode == SHIFT){
    if(axis == true){
      axis = false;
    } else {
      axis = true;
    }
  }
  if(keyCode == CONTROL){
    cHue=fHue;
    cBright = fBright;
    cSatu = fSatu;
    cAlpha = fAlpha;
  }
    
  }
  
  if(key == ENTER){
    tS +=1;
    print.save("finalDocs/" +sDay+ "/" + sLoc+"/N"+ tS+ "." + sCat +".png");
    result.save("catalog/" + sLoc +".N"+ tS+ "." + sCat +".jpg");
  }
  
  
      
  
  if(key == ESC){
    exit();
  }
  
}




void mouseWheel(MouseEvent me) {
  if (kType == 0){
    switch(bType){
      case 0:
        //inc = mousePressed && (mouseButton == RIGHT) ? -.1 : -.5; // a primeira opção, no caso o -.1, é utilizada caso o botao direito do mouse estiver apertado.
        inc = - wheelPwr * lnwt;
        
        
        lnwt = constrain(lnwt + me.getCount()*inc, 1, width*.7);
        pointer.strokeWeight(lnwt);
        result.strokeWeight(lnwt);
        print.strokeWeight(lnwt*tc);
      break;
      
      case 4:
        inc = - wheelPwr * lnsz;
        lnsz = lnsz + me.getCount()*inc;
      break;
      
      default:
        inc = - wheelPwr * lnsz;
        lnsz = constrain(lnsz + me.getCount()*inc, 1, width*.7);
        break;
    }
    
    /*if(bType == 0){
      
    } else if(bType!=4){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -5;
    lnsz = constrain(lnsz + me.getCount()*inc, 1, width*.7);
    } else { final int inc = keyPressed & keyCode == CONTROL ? -1 : -5;
    lnsz = lnsz + me.getCount()*inc;
    }*/
  }
  if (kType == 1){
    final float inc = keyPressed & keyCode == CONTROL ? -.1 : -.5;
    lnwt = constrain(lnwt + me.getCount()*inc, 1, width*.7);
    pointer.strokeWeight(lnwt);
    result.strokeWeight(lnwt);
    print.strokeWeight(lnwt*tc);
  }

    if (kType == 11){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    bHue = constrain(bHue + me.getCount()*inc, 1, 255);
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);

  }
  if (kType == 12){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    bBright = constrain(bBright + me.getCount()*inc, 1, 255);
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
  }
  if (kType == 13){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    bSatu = constrain(bSatu + me.getCount()*inc, 1, 255);
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
  }
    if (kType == 14){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    bAlpha = constrain(bAlpha + me.getCount()*inc, 1, 100);
    mBrush = color(bHue, bSatu, bBright, bAlpha);
    pointer.stroke(mBrush);
    result.stroke(mBrush);
    print.stroke(mBrush);
  }
  if (kType == 21){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    fHue = constrain(fHue + me.getCount()*inc, 1, 255);
    mFill = color(fHue, fSatu, fBright, fAlpha);
    pointer.fill(mFill);
    result.fill(mFill);
    print.fill(mFill);
  }
  if (kType == 22){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    fBright = constrain(fBright + me.getCount()*inc, 1, 255);
    mFill = color(fHue, fSatu, fBright, fAlpha);
    pointer.fill(mFill);
    result.fill(mFill);
    print.fill(mFill);
  }
  if (kType == 23){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    fSatu = constrain(fSatu + me.getCount()*inc, 1, 255);
    mFill = color(fHue, fSatu, fBright, fAlpha);
    pointer.fill(mFill);
    result.fill(mFill);
    print.fill(mFill);
  }
    if (kType == 24){
    final int inc = keyPressed & keyCode == CONTROL ? -1 : -2;
    fAlpha = constrain(fAlpha + me.getCount()*inc, 1, 100);
    mFill = color(fHue, fSatu, fBright, fAlpha);
    pointer.fill(mFill);
    result.fill(mFill);
    print.fill(mFill);
  }
}

void keyReleased(){
  kType = 0;
  
  checkKey(keyCode, false);
}



void mouseDragged(){
  if(mouseButton == CENTER){
    pointer.point(mouseX, mouseY);
    cxp = mouseX;
    cyp = mouseY;
  }
}


void sPoint(float xPos, float yPos){
  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  pointer.point(xPos, yPos);
  if(mousePressed==true){
      if(mouseButton == LEFT){
        
        result.point(xPos, yPos);
        print.point(xPos*tc, yPos*tc);

        
        
    }
  }
}


void sLine(float xPos, float yPos, float lnsz, float angle){
  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  float vertexXa = cos(PI+angle)*(lnsz)+xPos;
  float vertexYa = sin(PI+angle)*(lnsz)+yPos;
  float vertexX2a = cos(TWO_PI+angle)*(lnsz)+xPos;
  float vertexY2a = sin(TWO_PI+angle)*(lnsz)+yPos;
  pointer.line(vertexXa,vertexYa, vertexX2a, vertexY2a);
    
    
  if(df>1){
    for(float i = 0; i<lnsz; i= i+df){
      float vertexX = cos(PI+angle)*i+xPos;
      float vertexY = sin(PI+angle)*i+yPos;
      float vertexX2 = cos(TWO_PI+angle)*i+xPos;
      float vertexY2 = sin(TWO_PI+angle)*i+yPos;

  
    if(mousePressed==true){
      if(mouseButton == LEFT){
            result.point(vertexX,vertexY);
            result.point(vertexX2,vertexY2);
            print.point(vertexX*tc,vertexY*tc);
            print.point(vertexX2*tc,vertexY2*tc);
         }
        }
       }
      } else {

    
      if(mousePressed==true){
        if(mouseButton == LEFT){
              result.line(vertexXa,vertexYa, vertexX2a, vertexY2a);
              print.line(vertexXa*tc,vertexYa*tc, vertexX2a*tc, vertexY2a*tc);
            }
      }
      }
  
}

void sShapeF(float xPos, float yPos, int vertexN, float shapeSz, float angle){
  background(255);
  pointer.beginDraw();
  pointer.clear();
  result.beginDraw();
  result.pushMatrix();
  print.beginDraw();
  print.pushMatrix();
  pointer.pushMatrix();
  pointer.translate(xPos, yPos);
  result.translate(xPos, yPos);
  print.translate(xPos*tc, yPos*tc);

  float vertexcX = cos(radians(360/vertexN));
  float vertexcY = sin(radians(360/vertexN));
  float a = atan2(vertexcX,vertexcY);
  pointer.rotate(-a+angle);
  result.rotate(-a+angle);
  print.rotate(-a+angle);
  if(vertexN == 4){
    pointer.rotate(QUARTER_PI);
    result.rotate(QUARTER_PI);
    print.rotate(QUARTER_PI);

  } else if(vertexN % 2 == 0){
    pointer.rotate(HALF_PI);
    result.rotate(HALF_PI);
    print.rotate(HALF_PI);
 
  }

  
  pointer.beginShape();
  result.beginShape();
  print.beginShape();

  

      for(int j = 0; j < vertexN; j++){
        float vertexX = cos(radians(j*(360/vertexN)));
        float vertexY = sin(radians(j*(360/vertexN)));
        pointer.vertex(vertexX*shapeSz, vertexY*shapeSz);
        
        
        if(mousePressed==true){
      if(mouseButton == LEFT){
            result.vertex(vertexX*shapeSz, vertexY*shapeSz);
            print.vertex(vertexX*(shapeSz*tc), vertexY*(shapeSz*tc));
             }
           }
         }
        
       
  pointer.endShape(CLOSE);
  result.endShape(CLOSE);
  print.endShape(CLOSE);
  pointer.popMatrix();
  result.popMatrix();
  print.popMatrix();
}

void sShapeNF(float xPos, float yPos, int vertexN, float shapeSz, float dotFrequency, float angle){
  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  pointer.pushMatrix();
  result.pushMatrix();
  print.pushMatrix();
  pointer.translate(xPos, yPos);
  result.translate(xPos, yPos);
  print.translate(xPos*tc, yPos*tc);
  float vertexcX = cos(radians(360/vertexN));
  float vertexcY = sin(radians(360/vertexN));
  float a = atan2(vertexcX,vertexcY);
  pointer.rotate(-a+angle);
  result.rotate(-a+angle);
  print.rotate(-a+angle);
  if(vertexN == 4){
    pointer.rotate(QUARTER_PI);
    result.rotate(QUARTER_PI);
    print.rotate(QUARTER_PI);
  } else if(vertexN % 2 == 0){
    pointer.rotate(HALF_PI);
    result.rotate(HALF_PI);
    print.rotate(HALF_PI);
  }

  pointer.noFill();
  pointer.beginShape();
  result.beginShape(POINTS);
  print.beginShape(POINTS);
  
  
      for(int j = 0; j < vertexN; j++){
        float vertexX = cos(radians(j*(360/vertexN)));
        float vertexY = sin(radians(j*(360/vertexN)));
        pointer.vertex(vertexX*shapeSz, vertexY*shapeSz);
        for(float i = 0; i < 1; i = i + dotFrequency + vertexN*.0001){
          float vertexX2 = cos(radians((j-1)*(360/vertexN)));
          float vertexY2 = sin(radians((j-1)*(360/vertexN)));
          float vertexLerpX = lerp(vertexX, vertexX2, i);
          float vertexLerpY = lerp(vertexY, vertexY2, i);
          
          if(mousePressed==true){
      if(mouseButton == LEFT){
            result.vertex(vertexX*shapeSz, vertexY*shapeSz);
            result.vertex(vertexLerpX*shapeSz, vertexLerpY*shapeSz);
            print.vertex(vertexX*(shapeSz*tc), vertexY*(shapeSz*tc));
            print.vertex(vertexLerpX*(shapeSz*tc), vertexLerpY*(shapeSz*tc));
         }
        }
        }
      }
       
  pointer.endShape(CLOSE);
  result.endShape(CLOSE);
  result.endShape(CLOSE);
  print.endShape(CLOSE);
  print.endShape(CLOSE);

  pointer.popMatrix();
  result.popMatrix();
  print.popMatrix();

}

void sShape(float xPos, float yPos, int vertexN, float shapeSz, float dotFrequency, float angle){
  if(alt == true){
    sShapeF(xPos, yPos, vertexN, shapeSz, angle);
  } else {
    sShapeNF(xPos, yPos, vertexN, shapeSz, dotFrequency, angle);
  }
}

void sOrbitalShape(float xPos, float yPos, int vertexN, float dotFrequency, float angle){
  
  float tmx = (mouseX - (xPos));
  float tmy = (mouseY - (yPos));

  
  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  pointer.pushMatrix();
  result.pushMatrix();
  print.pushMatrix();

  pointer.translate(xPos, yPos);
  result.translate(xPos, yPos);
  print.translate(xPos*tc, yPos*tc);
  float vertexcX = cos(radians(360/vertexN));
  float vertexcY = sin(radians(360/vertexN));
  float a = atan2(vertexcX,vertexcY);
  pointer.rotate(-a+angle);
  result.rotate(-a+angle);
  print.rotate(-a+angle);

  
  
  
  if(vertexN == 4){
    pointer.rotate(QUARTER_PI);
    result.rotate(QUARTER_PI);
    print.rotate(QUARTER_PI);

  } else if(vertexN % 2 == 0){
    pointer.rotate(HALF_PI);
    result.rotate(HALF_PI);
    print.rotate(HALF_PI);

  }

  pointer.noFill();
  pointer.beginShape();
  result.beginShape(POINTS);
  print.beginShape(POINTS);

  
  
      for(int j = 0; j < vertexN; j++){
        float vertexX = (cos(radians(j*(360/vertexN))))*6;
        float vertexY = (sin(radians(j*(360/vertexN))))*6;
        pointer.vertex(vertexX*tmx, vertexY*tmy);
        for(float i = 0; i < 1; i = i + dotFrequency + vertexN*.0001){
          float vertexX2 = (cos(radians((j-1)*(360/vertexN))))*6;
          float vertexY2 = (sin(radians((j-1)*(360/vertexN))))*6;
          float vertexLerpX = lerp(vertexX, vertexX2, i);
          float vertexLerpY = lerp(vertexY, vertexY2, i);
          
          if(mousePressed==true){
      if(mouseButton == LEFT){
            result.vertex(vertexX*tmx, vertexY*tmy);
            result.vertex(vertexLerpX*tmx, vertexLerpY*tmy);
            print.vertex(vertexX*(tmx*tc), vertexY*(tmy*tc));
            print.vertex(vertexLerpX*(tmx*tc), vertexLerpY*(tmy*tc));
         }
        }
        }
      }
       
  pointer.endShape(CLOSE);
  result.endShape(CLOSE);
  result.endShape(CLOSE);
  print.endShape(CLOSE);
  print.endShape(CLOSE);
  pointer.popMatrix();
  result.popMatrix();
  print.popMatrix();
}

void eBrushVAR1(float xPos, float yPos, float angle, float lnsz){
  int ed;
  float tmx = (mouseX - (xPos));
  float tmy = (mouseY - (yPos));
  float x, y, w , z;
  float lnszex, lnszey;
    
  if(tmx > 0){
    lnszex = + (lnsz*2);
    } else {
    lnszex = - (lnsz*2);  
    }
   if(tmy > 0){
     lnszey = + (lnsz*2);
      } else {
      lnszey = - (lnsz*2);
      }
      background(255);
      result.beginDraw();
      print.beginDraw();
      pointer.beginDraw();
      pointer.clear();
      pointer.noFill();
      pointer.pushMatrix();
      result.pushMatrix();
      print.pushMatrix();
      pointer.translate(xPos, yPos);
      result.translate(xPos, yPos);
      print.translate(xPos*tc, yPos*tc);
      pointer.rotate(angle);
      result.rotate(angle);
      print.rotate(angle);
      pointer.ellipse(0, 0, ((tmx)*12), ((tmy)*12));
      pointer.ellipse(0, 0, ((tmx)*12)+(lnszex), ((tmy)*12)+(lnszey));
    

  
  if(mousePressed == true){
    if(mouseButton == LEFT){
      if(axis == true){
        ed = 1;
      } else {
        ed = -1;
      }
      
      if((tmx < 0 && tmy < 0) || (tmx > 0 && tmy >0)){
    t= t + ed;
    } else { 
      t = t - ed;
    }



        for(float i = .9; i<df ; i= i + .1){
            x = (cos(t*i) * (tmx)*6);
            y = (sin(t*i) * (tmy)*6);

        
          if(tmx > 0){
              w = x + (cos(t*i)*lnsz);
              
              } else {
                w = x - (cos(t*i)*lnsz);
                
            }
          if(tmy > 0){
              z = y + (sin(t*i)*lnsz);
              } else {
                z = y - (sin(t*i)*lnsz);
            }
            
          if(lnsz == 0){
              result.point( x , y );
              print.point( x*tc , y*tc );

              
            }
          if(lnsz > 0 || lnsz < 0){
              result.line (x , y , w , z);
              print.line (x*tc , y*tc , w*tc , z*tc);

            }
        }
    }
  }
  pointer.popMatrix();
  result.popMatrix();
  print.popMatrix();
}

void eBrushVAR2(float xPos, float yPos, float angle, float lnsz){
  int ed;
  float tmx = (mouseX - (xPos));
  float tmy = (mouseY - (yPos));
  float x, y, w , z;
  float lnszex, lnszey;

  
  if(tmx > 0){
    lnszex = + (lnsz/6);
    } else {
    lnszex = - (lnsz/6);  
    }
   if(tmy > 0){
     lnszey = + (lnsz/6);
      } else {
      lnszey = - (lnsz/6);
      }
      
      

  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  pointer.noFill();

  pointer.beginShape();
 for(int j = 0; j < 40; j++){
    float vertexX = (cos(angle + radians((j)*(360/40)))*tmx*6)+xPos;
    float vertexY = (sin(radians((j)*(360/40)))*tmy*6)+yPos;
    pointer.vertex(vertexX, vertexY);
 }
 pointer.endShape(CLOSE);
 
 pointer.beginShape();
 for(int j = 0; j < 40; j++){
    float vertexX = (cos(angle + radians((j)*(360/40)))*6*(tmx+lnszex))+xPos;
    float vertexY = (sin(radians((j)*(360/40)))*6*(tmy+lnszey))+yPos;
    pointer.vertex(vertexX, vertexY);
 }
 pointer.endShape(CLOSE);
  
  
  if(mousePressed == true){
    if(mouseButton == LEFT){
      if(axis == true){
        ed = 1;
      } else {
        ed = -1;
      }

      if((tmx < 0 && tmy < 0) || (tmx > 0 && tmy >0)){
        t= t + ed;
        } else { 
          t = t - ed;
        }

        for(float i = .9; i<df ; i= i + .1){
            x = (cos(t*i+angle) * (tmx)*6) +xPos;
            y = (sin(t*i) * (tmy)*6) +yPos;

        
          if(tmx > 0){
              w = x + (cos(t*i+angle)*lnsz);

              } else {
                w = x - (cos(t*i+angle)*lnsz);

            }
          if(tmy > 0){
              z = y + (sin(t*i)*lnsz);

              } else {
                z = y - (sin(t*i)*lnsz);

            }
            
          if(lnsz == 0){
              result.point( x , y );
              print.point( x*tc , y*tc );
              
            }
          if(lnsz > 0 || lnsz < 0){
              result.line (x , y , w , z);
              print.line (x*tc , y*tc , w*tc , z*tc);
            }
        }
    }
  }
}

void eBrush(float xPos, float yPos, float angle, float lnsz){
  if(alt == true){
    eBrushVAR1(xPos, yPos, angle, lnsz);
  } else {
    eBrushVAR2(xPos, yPos, angle, lnsz);
  }
}

void mouseBrush(float xPos, float yPos){
  if(bType==0){
    sPoint(xPos, yPos);
   }
  if(bType==1){
     sLine(xPos, yPos, lnsz, angle);
   }
  if(bType==2){
     sShape(xPos, yPos, vertexN, lnsz, df, angle);
   }
}

void centerBrush(){
  if(bType==3){
   sOrbitalShape(cxp, cyp, vertexN, df, angle);
 }
 if(bType==4){
   eBrush(cxp, cyp, angle, lnsz);
 }
}

void mirror(){
 if(mType == 0){
   mouseBrush(mouseX, mouseY);
 }
 if(mType == 1){
   if(mouseX > cxp){
   result.beginDraw();
   pointer.beginDraw();
          float mxX= (cxp*2) - mouseX;
          mouseBrush(mouseX , mouseY);
          mouseBrush(mxX, mouseY);
        }
        if(mouseX < cxp){
          float mxX = (mouseX * -1) + (cxp*2);
          mouseBrush(mouseX , mouseY);
          mouseBrush(mxX, mouseY);
        }
 }
 if(mType == 2){
  result.beginDraw();
  pointer.beginDraw();
        if(mouseX > width/2 && mouseY < height/2){
          float mxX = (cxp*2) - mouseX;
          float mxY = mouseY;
          float myX = (cxp*2) - mouseX;
          float myY = - mouseY + cyp*2;
          float mxyX = mouseX;
          float mxyY = - mouseY + cyp*2;
          mouseBrush(mouseX, mouseY);
          mouseBrush(mxX, mxY);
          mouseBrush(myX, myY);
          mouseBrush(mxyX, mxyY);
        }
        if(mouseX < width/2 && mouseY < height/2){
          float mxX = (mouseX * -1) + cxp*2;
          float mxY = mouseY;
          float myX = mouseX;
          float myY = - mouseY + cyp*2;
          float mxyX = - mouseX + cxp*2;
          float mxyY = - mouseY + cyp*2;
          mouseBrush(mouseX, mouseY);
          mouseBrush(mxX, mxY);
          mouseBrush(myX, myY);
          mouseBrush(mxyX, mxyY);
        }
        if(mouseX < width/2 && mouseY > height/2){
          float mxX = mouseX;
          float mxY = - mouseY + cyp*2;
          float myX = - mouseX + cxp*2;
          float myY = - mouseY + cyp*2;
          float mxyX = - mouseX + cxp*2;
          float mxyY = mouseY;
          mouseBrush(mouseX, mouseY);
          mouseBrush(mxX, mxY);
          mouseBrush(myX, myY);
          mouseBrush(mxyX, mxyY);
        }
        if(mouseX > width/2 && mouseY > height/2){
          float mxX = - mouseX + cxp*2;
          float mxY = - mouseY + cyp*2;
          float myX = - mouseX + cxp*2;
          float myY = mouseY;
          float mxyX = mouseX;
          float mxyY = - mouseY + cyp*2;
          mouseBrush(mouseX, mouseY);
          mouseBrush(mxX, mxY);
          mouseBrush(myX, myY);
          mouseBrush(mxyX, mxyY);
        }  
      }
        
        
}

void draw(){
  
  if(isQ){
      angle = angle +.002;  
  }
  if(isA){

    angle = angle - .002;

  }
  if(isW){
    if(bType==1 || bType==4){
      df = df + .05;
    }
    if(bType==2 || bType == 3){
      if(df<1){
        df = df + .001;
      } else {
        df =1;
      }
    }
  }
  if(isS){
    if(bType==1 || bType==4){
      if(df>1){
      df= df -.05;
      } else {
        df = 1;
      }
    }
    if(bType==2 || bType == 3){
     if(df>.001){
        df=df-.001;
        } else {
          df = .001;
        }
      }
    }


  if(bType <= 2){
    mirror();
  } else {
    centerBrush();
  }


  
  result.endDraw();
  pointer.endDraw();
  image(result,0,0);
  image(pointer,0,0);


}
