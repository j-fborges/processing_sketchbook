float a1 = random(-PI,PI);
float a2 = random(-PI,PI);
float dif = abs(a1-a2);
float a;
int pPosCounter = 0;
PVector [] pPos = new PVector [15];
int [] [] pPosRefInd = new int [15] [15];
float [] pPosAngle = new float [15];
float [] pPosACos = new float [15];
float [] pPosASin = new float [15];
float rCos, rSin;
void setup(){
  size(500,500);
frameRate(10);
for (int i = 0; i < pPosRefInd.length; i++){
  pPos[i] = new PVector();
}

for (int i = 0; i < pPosRefInd.length; i++){
 for(int j = 0; j < pPos.length; j++){
   
   pPosRefInd [i][j] = j + i;
   if(pPosRefInd[i][j] >= pPos.length) { 
     int excess = pPosRefInd[i][j] - pPos.length;
     pPosRefInd[i][j] = excess;
   }
 }
}

if(dif > PI){
  dif = TWO_PI-dif;
}
text(nf(a1) + " " + nf(a2) + " " + nf(dif), 50,50  );
}

void draw(){
  a = atan2(mouseY - pmouseY , mouseX - pmouseX);
  dif = a1-(atan2(mouseY-(height/2), mouseX-(width/2)));
  if(dif > PI){
  dif = TWO_PI-dif;
}

pPosCounter +=1;
      if(pPosCounter >= pPos.length) { pPosCounter = 0; }
      pPos[pPosCounter].set(mouseX,mouseY);
      
      pPosAngle[pPosCounter] = atan2(mouseY - pPos[pPosRefInd[1][pPosCounter]].y, mouseX - pPos[pPosRefInd[1][pPosCounter]].x);
      //pPosAngle[pPosCounter] = atan2(mouseY - pmouseY, mouseX - pmouseX);
      pPosACos[pPosCounter] = cos(pPosAngle[pPosCounter]);
      pPosASin[pPosCounter] = sin(pPosAngle[pPosCounter]);
      rCos = 0;
      rSin = 0;
      for(int i = 0; i < pPos.length; i++){
        
        rCos += pPosACos[pPosCounter];
        rSin += pPosASin[pPosCounter];
      }
        rCos /= pPos.length;
        rSin /= pPos.length;
  
  clear();
  stroke(255);
line(mouseX, mouseY, pmouseX, pmouseY);
  text(nf(a1) + " " + nf(a2) + " " + nf(dif), 50,50  );
text(nf(atan2(mouseY-(height/2), mouseX-(width/2))), 100, 100);
text(nf(a), 300, 300);
line(300, 300,  300 + (rCos*50) , 300 + (rSin*50));
line(400, 400,  400 + (cos(pPosAngle[pPosCounter])*50) , 400 + (sin(pPosAngle[pPosCounter])*50));
arc(50, 50, 80, 80, 0 , radians(270), PIE);
if(mousePressed){
 println("ok");  //<>//
}
//text(nf(dif)
}
