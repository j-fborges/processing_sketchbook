void setup(){
  size(1000,500);
}

void draw(){
  
}

class Cube {
 float xA1Pos, yA1Pos, xB1Pos, yB1Pos, xC1Pos, yC1Pos, xD1Pos, yD1Pos, xA2Pos, yA2Pos, xB2Pos, yB2Pos, xC2Pos, yC2Pos, xD2Pos, yD2Pos;
 
 float 
 PVector A1, B1, C1, D1, A2, B2, C2, D2;
 
 Cube(float xPos, float yPos, float Sz) {
   xA1Pos = xPos - (Sz/2);
   yA1Pos = yPos - (Sz/2);
   
   xB1Pos = xPos + (Sz/2);
   yB1Pos = yPos - (Sz/2);
   
   xC1Pos = xPos - (Sz/2);
   yC1Pos = yPos + (Sz/2);
   
   xD1Pos = xPos + (Sz/2);
   yD1Pos = yPos + (Sz/2);
   
   xA2Pos = xPos - (Sz/2) + ;
   yA2Pos = yPos - (Sz/2) + ;
   
   xB2Pos = xPos + (Sz/2);
   yB2Pos = yPos - (Sz/2);
   
   xC2Pos = xPos - (Sz/2);
   yC2Pos = yPos + (Sz/2);
   
   xD2Pos = xPos + (Sz/2);
   yD2Pos = yPos + (Sz/2);
   
   
   A1 = new PVector(xA1Pos, yA1Pos);
   B1 = new PVector(xB1Pos, yB1Pos);
   C1 = new PVector(xC1Pos, yC1Pos);
   D1 = new PVector(xD1Pos, yD1Pos);
   
 }
 
 
 
}
   
   
 }
 
}
