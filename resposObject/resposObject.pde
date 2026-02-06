PGraphics pointer, result, print;

void setup(){
  
}

class Brush {
 float xPos, yPos,
 angle,
 pF, // point Frequency
 lnSz,
 strkWght;
 
 boolean pivotedBrush, mirrored, mirroredAngle;
 int brushType;
 
 void update(){
   switch(brushType){
     case 0:
     strkWght
     break;
     
   }
 }
 
 void inscribe(){
    result.beginDraw();
    print.beginDraw();
    pointer.beginDraw();
    pointer.clear();
    
  switch(brushType){
    
    case 0: 
      pointer.point(xPos, yPos);
        if(mousePressed==true && mouseButton == LEFT){
            result.point(xPos, yPos);
            print.point(xPos*tc, yPos*tc);
          }
      }
    break;
    
    case 1:
    
      float vertexXa = cos(PI+angle)*(lnSz)+xPos;
      float vertexYa = sin(PI+angle)*(lnSz)+yPos;
      float vertexX2a = cos(TWO_PI+angle)*(lnSz)+xPos;
      float vertexY2a = sin(TWO_PI+angle)*(lnSz)+yPos;
      pointer.line(vertexXa,vertexYa, vertexX2a, vertexY2a);
      
  
    
  }
 }
 
}
