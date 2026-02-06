

Table output;
String typedString = "Bruna Andrade";
String[] fontList = PFont.list();
PFont fonts;
PFont [] nFonts = new PFont[fontList.length];
int charIndex = 0;
float anchorX, anchorY ;
boolean inputMode = true;

Customchar[] chars = new Customchar[100];
Inter i1 = new Inter();

void setup(){
  size(2000, 1000);
  background(255);
  fill(0);
  frameRate(60);
  //printArray(fontList);
  i1.interSetup();
  for(int i = 0; i < fontList.length; i++){ //<>//
  
  nFonts[i] = createFont(fontList[i], 64);
  }
  println("ready!");
  
    for(int i = 0; i < typedString.length(); i++){
    chars[i] = new Customchar();
    chars[i].ccSetup();
  }

  anchorX= width/2;
  anchorY = height/2;
}

void draw(){
  background(255);
  

  
  

  
  /*if(y> height - 192){
    y = 64;
  }*/
  
  anchorX = width/2;
  
  
  for(int i = 0; i < typedString.length(); i++){ //<>//
   chars[i].drawChar(i);
   //chars[i].update();
  }
    
      
   
   
i1.update();
  
  //noLoop();
}
class Inter {
  PGraphics interUnit;
  
 void interSetup(){
   interUnit = createGraphics(width,height);
 }
 void calculate(){
   interUnit.beginDraw();
   interUnit.clear();
   interUnit.line(chars[charIndex].x, chars[charIndex].y, chars[charIndex+1].x, chars[charIndex+1].y);
   interUnit.endDraw();
   
 }
 
 void update(){
   
   image(interUnit, 0,0);
   interUnit.beginDraw();
 }
}
class Customchar {
  int fontIndex = 0;
  float s = 64;
  PGraphics charUnit;
  float x, y = height/2;
  float xOS, yOS;
  
  void ccSetup(){
   
   
   fontIndex = int(random(fontList.length));
   strokeWeight(1);
  }
  
  void drawChar(int i) {
    
    
    x = anchorX;

    textFont(nFonts[fontIndex]);
    textSize(s);
    fill(0);
    
    text(typedString.charAt(i), x+xOS, y+yOS);
     //<>//
    anchorX += textWidth(typedString.charAt(i));
  }

}

void mousePressed(){
  redraw();
}

void keyPressed(){
  
   switch(keyCode){
        case RIGHT:
        charIndex ++;
        
        if(charIndex >= typedString.length() -1) charIndex = typedString.length() -1;
        //println(typedString.charAt(charIndex));
        i1.calculate();
        break;
        case LEFT:
        charIndex --;
        if(charIndex < 0) charIndex = 0;
        i1.calculate();
        //println(typedString.charAt(charIndex));
        break;
        case UP:
        chars[charIndex].fontIndex ++;
        if(chars[charIndex].fontIndex >= fontList.length) chars[charIndex].fontIndex = fontList.length;
        
        
        
        break;
        case DOWN:
        chars[charIndex].fontIndex --;
        if(chars[charIndex].fontIndex <= 0) chars[charIndex].fontIndex = 0;
        
        break;
        default:
        break;
      }
      
      
    
        switch(key){
          
          
           case '8':
          chars[charIndex].s++;
          break;
          
          case '2':
          chars[charIndex].s--;
          break;
          
          case 'q':
          chars[charIndex].yOS++;
          break;
          case 'a':
          chars[charIndex].yOS--;
          break;
          
          case 'w':
          chars[charIndex].xOS++;
          break;
          case 's':
          chars[charIndex].xOS--;
          break;
            
            
        }
      
  
}



void keyReleased(){
  //typedString = typedString + key;
  switch(key){
    case 'z':
          chars[charIndex].fontIndex = (int)random(fontList.length);
          break;
          
          case 'x':
          for(int i = 0; i <typedString.length(); i++){
          chars[i].fontIndex = (int)random(fontList.length);
          }
          break;
  }
  switch(keyCode){
   case ENTER:
     output = new Table();
     
     output.addColumn("charIndex");
     output.addColumn("character");
     output.addColumn("fontIndex");
     output.addColumn("xOffSet");
     output.addColumn("yOffSet");
     output.addColumn("charSize");
   
     
     
     for(int i = 0; i <typedString.length(); i++){
       TableRow newRow = output.addRow();
       
       String carac = typedString.substring(i,i+1);
       newRow.setInt("charIndex", i);
       newRow.setString("character", carac);
       newRow.setInt("fontIndex", chars[i].fontIndex);
       newRow.setFloat("xOffSet", chars[i].xOS);
       newRow.setFloat("yOffSet", chars[i].yOS);
       newRow.setFloat("charSize", chars[i].s);
       
     
     }
     
     saveTable(output, "data/"+ typedString + day() + hour() + minute()+ second() +"Params.csv");
     
     
     break;
  }
}