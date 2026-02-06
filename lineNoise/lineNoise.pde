void sLine(float xPos, float yPos, float lnsz, float angle){
  background(255);
  result.beginDraw();
  print.beginDraw();
  pointer.beginDraw();
  pointer.clear();
  
  

  //float a = 0;
  //float a = PVector.angleBetween(nDir, pDirs[0]);
  //float a = nDir.heading();
  //float a = (nDir.heading() + pDirs[0].heading());
  //println(a);
  float vertexXa = cos(PI+angle+aDir+aA)*(lnsz)+xPos;
  float vertexYa = sin(PI+angle+aDir+aA)*(lnsz)+yPos;
  float vertexX2a = cos(TWO_PI+angle+aDir+aA)*(lnsz)+xPos;
  float vertexY2a = sin(TWO_PI+angle+aDir+aA)*(lnsz)+yPos;
  pointer.line(vertexXa,vertexYa, vertexX2a, vertexY2a);
    
    
  if(df>1){
    for(float i = 0; i<lnsz; i= i+df){
      float vertexX = cos(PI+angle+aDir+aA)*i+xPos;
      float vertexY = sin(PI+angle+aDir+aA)*i+yPos;
      float vertexX2 = cos(TWO_PI+angle+aDir+aA)*i+xPos;
      float vertexY2 = sin(TWO_PI+angle+aDir+aA)*i+yPos;

  
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
