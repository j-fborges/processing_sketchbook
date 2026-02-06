Sqr[] sqrs = new Sqr[0];
Spot[] spots = new Spot[0];
int[] dirVals = {0, 1, 0, -1};
int[] dSpotI = new int[0];

// ----------------------- Instruções: --------------------------------//

// um criador de padrões a partir da exploração de um grid.

// O cDSz pode ser no máximo 2.5 vezes maior que o uniSz.



// --------------------------------------- Anotações -------------------------//
// # --  uniSz = 40 com uniASzMax = 70, 75, e 80  com o uniSz como forma de checagem ficam legais.
// # -- com o uniSz = 5 e o uniASzMax = 10 e o uniSzMax como parametro de checagem fica legal, cria uma textura que serviria para folhas de uma arvore.
// # -- com o uniSz = 2 e o uniASzMax = 10 e o uniSzMax como parametro de checagem dá um erro pois acaba com os 'spots' disponíveis. --------------------------- fazer uma alteração nisso????????/
// # -- testar fazer o aSz modulado por um array com valores em proporção específica.
// # -- pode se usar uma imagem para modular onde o padrão vai ser feito ou as cores dos módulos.
// # -- pode se usar um traçado como referência para a geração de um caminho, implementar.
// # -- pode se fazer com que varios padroes destes com parametros randomizados comecem onde se clica com o mouse.
// # -- controlar todas as variaveis por teclas.
// --------------------------------------- Anotações Antigas: (feitas antes de novas implementações) -------------------------//
// na linha 257, onde está encontrado o "if" que checa a disponibilidade de espaços o valor raio de checagem pode ser alterado. Duas possibilidades testadas e boas são o valor do 'uniSz', mais formal, e o 'uniASzMax' - que faz efeitos diversos.
// --------------------------------------------------------------------------------------------------------------------//

int uniSz = 3,         // "universal size" ------------ tamanho do modulo geral, que cria o grid.
uniMarginSz = 0,       //  "universal margin size" ------------ tamanho da margem geral de todos os objetos
uniASzMax =4,         // "universal acutal size maximum" ------------ Tamanho maximo do objeto que vai ser desenhado dentro ou fora do espaço do modulo. Os tamanhos são gerados a partir de randomização, tendo um máximo ou mínimo
uniASzMin =2;         // "universal actual size minimum" ------------- Tamanho minimo.
float cDSz = 3;              // "colision detection size" ---------------- Distancia para detecção de disponibilidade para cada "spot".
PImage img;
int w, h;

int sqrsN, spotsN, pSpotsN = 1, occupiedN;





void setup(){
  
 size(2000,1000);
 background(255);
 frameRate(60*3);
 rectMode(RADIUS);
 img = loadImage("escrito-01.jpg");
}

void draw(){
 if(sqrsN > 0){
   for(int i = 0; i <sqrsN; i++){
    sqrs[i].disp();
    /*
    for(int j = 0; j < spots.length; j++){
      fill(255,0,0);
      int spotXC = spots[j].xPos + (spots[j].sXDir*(uniSz +uniMarginSz));
      int spotYC = spots[j].yPos + (spots[j].sYDir*(uniSz +uniMarginSz));
     //ellipse(spotXC, spotYC, (uniSz +uniMarginSz)*2,(uniSz +uniMarginSz)*2);
     
    }*/
   }
 }
 createSqr(); 
}

void mousePressed(){
  //println("pressed");
 cDSz = random(0, uniSz*3);
}

class dir{
  
}

class Sqr{
 int xPos, yPos, sz, marginSz, refXPos, refYPos, rSpot, sXDir, sYDir, aSz, rDSpotI;
 PVector[] anchors;
 PVector loc;
 int[] anchorXDir, anchorYDir, anchorXDirI, anchorYDirI;
 int xDirValI= 0, yDirValI = 0;
 
 void sortSpot(){
   rDSpotI = (int)random(dSpotI.length);
   rSpot = dSpotI[rDSpotI];
   
   if(spots[rSpot].occupied == true){
    sortSpot(); 
   }
 }
 
 void firstInit(){
   anchors = new PVector[4];
   anchorXDir = new int[4];
   anchorYDir = new int[4];
   anchorXDirI = new int[4];
   anchorYDirI = new int[4];
   
   xDirValI = 0;
   yDirValI = 3;
   
  xPos = (int)random(width);
  yPos = (int)random(height);
  
  loc = new PVector(xPos, yPos);
  aSz = (int)random(uniASzMin,uniASzMax);
  sz = uniSz;
  marginSz = uniMarginSz;
  for(int i = 0; i<anchors.length; i++){
    xDirValI += 1;
    yDirValI += 1;
    if(xDirValI >= dirVals.length){ xDirValI = 0; }
    if(yDirValI >= dirVals.length){ yDirValI = 0; } 
    
    anchorXDir[i] = dirVals[xDirValI];
    anchorYDir[i] = dirVals[yDirValI];
    anchorXDirI[i] = xDirValI;
    anchorYDirI[i] = yDirValI;
    anchors[i] =  new PVector();
    
   anchors[i].x = xPos + (anchorXDir[i])*(sz+marginSz);
   anchors[i].y = yPos + (anchorYDir[i])*(sz+marginSz);
  }
 }
 
 void init(){
   anchors = new PVector[3];
   anchorXDir = new int[3];
   anchorYDir = new int[3];
   anchorXDirI = new int[3];
   anchorYDirI = new int[3];
  
  sortSpot();

  refXPos = spots[rSpot].xPos;
  refYPos = spots[rSpot].yPos;
  
  aSz = (int)random(uniASzMin,uniASzMax);
  sz = uniSz;
  marginSz = uniMarginSz;
  //println("rspot: " + rSpot);
  
  sXDir = spots[rSpot].sXDir;
  sYDir = spots[rSpot].sYDir;
  
  xPos = refXPos + (sXDir*(sz+ marginSz)); // falta calcular se o sz(tamanho do novo quadrado, que aqui corresponde ao deslocamento do ponto central do novo quadrado em relação ao que esta sendo usado de referencia para criar) é positivo ou negativo, definido pelo angulo do ponto central do quadrado referencia com sua respectiva ancora que esta sendo usada. 
  yPos = refYPos + (sYDir*(sz+ marginSz));
  
  loc = new PVector(xPos, yPos);
  
  spots[rSpot].occupied = true;
  dSpotI = remove(dSpotI, rDSpotI);
  occupiedN += 1;
  
  xDirValI = spots[rSpot].sXDirI;
  yDirValI = spots[rSpot].sYDirI;
  
  xDirValI -= 1;
  yDirValI -= 1;
  if(xDirValI < 0){ xDirValI = 3; }
  if(yDirValI < 0){ yDirValI = 3; } 
  xDirValI -= 1;
  yDirValI -= 1;
  if(xDirValI < 0){ xDirValI = 3; }
  if(yDirValI < 0){ yDirValI = 3; } 
  
  
  for(int i = 0; i<anchors.length; i++){
    xDirValI += 1;
    yDirValI += 1;
    if(xDirValI >= dirVals.length){ xDirValI = 0; }
    if(yDirValI >= dirVals.length){ yDirValI = 0; } 
    
    
    anchors[i] =  new PVector();
    
    anchorXDir[i] = dirVals[xDirValI];
    anchorYDir[i] = dirVals[yDirValI];
    anchorXDirI[i] = xDirValI;
    anchorYDirI[i] = yDirValI;
    
    
   anchors[i].x = xPos + (anchorXDir[i]*(sz+marginSz)); 
   anchors[i].y = yPos + (anchorYDir[i]*(sz+marginSz)); 
  }
 }
 
 void disp(){
   
   noStroke();
   fill(img.get(xPos, yPos));
   rect(xPos, yPos, aSz,aSz);
 }
}

class Spot{
 int xPos,yPos, sSqrIndex, sXDir, sYDir , sXDirI, sYDirI;
 boolean occupied;
 PVector loc;
 int[] anchorXDir, anchorYDir;
 
 void firstInit(int i){
   occupied = false;
   dSpotI[i] = i;
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i].x; //valor do ponto de referencia já somado com o raio do quadrado e a largura da margem.
   yPos = (int)sqrs[sqrsN-1].anchors[i].y;
   
   loc = new PVector(xPos, yPos);
   
   sXDir = sqrs[sqrsN-1].anchorXDir[i];
   sYDir = sqrs[sqrsN-1].anchorYDir[i];
   sXDirI = sqrs[sqrsN-1].anchorXDirI[i];
   sYDirI = sqrs[sqrsN-1].anchorYDirI[i];
   
   sSqrIndex = sqrsN-1;
 }
 
 void init(int i){
   occupied = false;

   dSpotI[i -occupiedN] = i;
   
  
   xPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].x;
   yPos = (int)sqrs[sqrsN-1].anchors[i-pSpotsN].y;
   
   loc = new PVector(xPos, yPos);
   
   sXDir = sqrs[sqrsN-1].anchorXDir[i-pSpotsN];
   sYDir = sqrs[sqrsN-1].anchorYDir[i-pSpotsN];
   sXDirI = sqrs[sqrsN-1].anchorXDirI[i-pSpotsN];
   sYDirI = sqrs[sqrsN-1].anchorYDirI[i-pSpotsN];
   
   sSqrIndex = sqrsN-1;
 }
 
}

void createSqr(){
  sqrsN += 1;
  sqrs = (Sqr[]) expand(sqrs, sqrsN);
  sqrs[sqrsN-1] = new Sqr();
  
  if(sqrsN==1){
   sqrs[sqrsN-1].firstInit();
   
   spotsN += 4;
  spots = (Spot[]) expand(spots, spotsN);
  dSpotI = (int[]) expand(dSpotI, spotsN);
  
  for(int i = pSpotsN -1; i < spotsN; i++){
    
    spots[i] = new Spot();
    spots[i].firstInit(i);
   }
  } else {
    sqrs[sqrsN-1].init();
    
    spotsN += 3;
  spots = (Spot[]) expand(spots, spotsN);
  dSpotI = (int[]) expand(dSpotI, spotsN - occupiedN);
  
  for(int i = pSpotsN; i < spotsN; i++){
  
  spots[i] = new Spot();
  spots[i].init(i);
  }
  }
  
 pSpotsN = spotsN;
 
 check();
}



void check(){
  //println("occupied");
  for(int j = 0; j < dSpotI.length; j+=1){
    for(int i = 0; i < sqrsN; i+=1){
      //if(sqrs[i].xPos + (sqrs[i].sXDir*(sqrs[i].sz+ sqrs[i].marginSz))
      if(j>=dSpotI.length){
       j -= 1; //<>//
      };
      int spotXC = spots[dSpotI[j]].xPos + (spots[dSpotI[j]].sXDir*(uniSz +uniMarginSz));
      int spotYC = spots[dSpotI[j]].yPos + (spots[dSpotI[j]].sYDir*(uniSz +uniMarginSz));
      //println("occupied");
      if(dist(sqrs[i].xPos, sqrs[i].yPos, spotXC, spotYC)<cDSz){
        spots[dSpotI[j]].occupied = true;
        dSpotI = remove(dSpotI, j); //<>//
        
        occupiedN += 1;
        println("occupied");
      }
      
    }
  }
}

void analise(){
}

int[] remove(int array[], int item) {
  int outgoing[] = new int[array.length - 1];
  System.arraycopy(array, 0, outgoing, 0, item);
  System.arraycopy(array, item+1, outgoing, item, array.length - (item+1));
  return outgoing;
}
