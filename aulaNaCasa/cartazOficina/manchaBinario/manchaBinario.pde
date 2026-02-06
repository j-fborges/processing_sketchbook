import processing.svg.*;
import processing.pdf.*;
String bin [] = {"0", "1"};
String list[] = PFont.list();
PFont fnt1;
boolean one = false;
PFont fList[];
int sN, fI;
PGraphics result;
PFont font1;


void setup(){
 size(1000,1000);
  //background(0);
  printArray(list);
  
  //result = createGraphics(width, height, PDF, "data/"+ nf(millis())+ nf(second()) + nf(hour())+ nf(month())+"result.svg" );
  result = (PGraphicsPDF) createGraphics(width, height, PDF, "data/"+ nf(millis())+ nf(second()) + nf(hour())+ nf(month())+"result.pdf");
  fList = new PFont[list.length];
  for(int i = 1; i< list.length ; i ++){
    fList[i] = createFont(list[i], 32);
  }
  //font1 = createFont(list[3], 32);
  beginRecord(result);
  
  println("OKKKKK");
  fill(0);
  
  
}

void draw(){
  
  //for(int j = 0; j<10; j++){
    //result = createGraphics(width, height, SVG, "data/"+ nf(millis())+ nf(second()) + nf(hour())+ nf(month())+"result.svg" );
    //result.beginDraw();
    //println(j);
    //for(int i = 0; i<3000; i++){
    //result.beginDraw();
    sF();
    textFont(fList[fI], random(100));
    
    int a = round(random(0,1));
    text(str(a), random(100,900), random(100, 900));
    //rect(random(width), random(height), random(300), random(300));
    
    
    //}
    //result.dispose();
    //result.endDraw();
    //result.dispose();
  //}
 // exit();
 //image(result, 0,0);
}

void mousePressed(){
  //result.endDraw();
  //result.dispose();
  endRecord();
  exit();
}

void sF(){
  fI = round(random(list.length -1));
  if(fList[fI] == null){ sF();}
}
