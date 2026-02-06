import processing.pdf.*;

float rs=50;
float ro=255;
float mxX;
float mxY;
float myX, myY, mxyX, mxyY;
int mirror = 3;
int mc;
String fileType = "PNG";
String signature = "JPFB";
String pieceName = "SQUARES";

int dia = day();
int ano = year();
int mes = month();
int minuto = minute();
int segundo = second();
int milisegundo = millis();
int hora = hour();
String datetime = String.valueOf(dia);

void setup(){
  size(700, 700);
  background(255);
  beginRecord(PDF, pieceName+"por"+signature+".pdf");
  println(displayHeight);
  
}

void draw(){
  // translate(width/2, height/2);
  rectMode(CENTER);
  fill(255, ro);
  stroke(0, ro);
  //println(mc);
  
  
    
    
      if(mousePressed == true && mirror == 1){
        
        if(mouseX > width/2){       // mirror effect
          mxX= (width) - mouseX;
          mxY=  mouseY;
          rect(mouseX , mouseY, rs , rs);
          rect(mxX, mxY, rs, rs);
        }
        if(mouseX < width/2){
          mxX = (mouseX * -1) + width;
          mxY = mouseY;
          rect(mouseX , mouseY, rs , rs);
          rect(mxX, mxY, rs, rs);
        }
        if(mouseX == width/2){
          rect(mouseX, mouseY, rs , rs);
        }
      }
    
      if(mousePressed == true && mirror == 3){
        
        if(mouseX > width/2 && mouseY < height/2){
          mxX = (width) - mouseX;
          mxY = mouseY;
          myX = (width) - mouseX;
          myY = - mouseY + height;
          mxyX = mouseX;
          mxyY = - mouseY + height;
          rect(mouseX, mouseY, rs, rs);
          rect(mxX, mxY, rs, rs);
          rect(myX, myY, rs, rs);
          rect(mxyX, mxyY, rs, rs);
        }
        if(mouseX < width/2 && mouseY < height/2){
          mxX = (mouseX * -1) + width;
          mxY = mouseY;
          myX = mouseX;
          myY = - mouseY + height;
          mxyX = - mouseX + width;
          mxyY = - mouseY + height;
          rect(mouseX, mouseY, rs, rs);
          rect(mxX, mxY, rs, rs);
          rect(myX, myY, rs, rs);
          rect(mxyX, mxyY, rs, rs);
        }
        if(mouseX < width/2 && mouseY > height/2){
          mxX = mouseX;
          mxY = - mouseY + height;
          myX = - mouseX + width;
          myY = - mouseY + height;
          mxyX = - mouseX + width;
          mxyY = mouseY;
          rect(mouseX, mouseY, rs, rs);
          rect(mxX, mxY, rs, rs);
          rect(myX, myY, rs, rs);
          rect(mxyX, mxyY, rs, rs);
        }
        if(mouseX > width/2 && mouseY > height/2){
          mxX = - mouseX + width;
          mxY = - mouseY + height;
          myX = - mouseX + width;
          myY = mouseY;
          mxyX = mouseX;
          mxyY = - mouseY + height;
          rect(mouseX, mouseY, rs, rs);
          rect(mxX, mxY, rs, rs);
          rect(myX, myY, rs, rs);
          rect(mxyX, mxyY, rs, rs);
        }
        if(mouseX == width/2 || mouseY == height/2){
          rect(mouseX, mouseY, rs, rs);
        }     
      }



  if(keyPressed == true){
    if( key == 'q' || key == 'Q'){
      rs--;
    }
    if( key == 'w' || key == 'W'){
      rs++;
    }
    if( key == 'a' || key == 'A'){
      ro--;
    }
    if( key == 's' || key == 'S'){
      ro++;
    }
    if( key == ENTER ){
    endRecord();
    }
  }
}
  
 
 
