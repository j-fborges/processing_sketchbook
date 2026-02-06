

Table output;
Table input;
String inputPath = "Bruna Andrade221612Params.csv";
String typedString = "Bruna Andrade";
String[] fontList = PFont.list();
PFont fonts;
PFont [] nFonts = new PFont[fontList.length];
int charIndex = 0;
float anchorX, anchorY ;
boolean inputMode = true;
PGraphics animation;

Customchar[] chars = new Customchar[100];
Inter i1 = new Inter();

void setup(){
  size(2000, 300);
  background(255);
  fill(0);
  frameRate(30);
  //printArray(fontList);
  
  
  animation = createGraphics(width, height);
  animation.beginDraw();
  animation.fill(0);
  i1.interSetup();
  for(int i = 0; i < fontList.length; i++){ //<>//
  
  nFonts[i] = createFont(fontList[i], 64);
  }
  println("ready!");
  
    for(int i = 0; i < typedString.length(); i++){
    chars[i] = new Customchar();
    chars[i].ccSetup();
  } 
  
  if(inputPath != ""){
  input = loadTable(inputPath, "header");
  
  for(int i = 0; i < typedString.length(); i++){ //<>//
    TableRow newRow = input.getRow(i);
    chars[i].xOS = newRow.getFloat( "xOffSet");
    chars[i].yOS = newRow.getFloat( "yOffSet");
    chars[i].s = newRow.getFloat( "charSize" );
    chars[i].fontIndex = newRow.getInt( "fontIndex" );
    chars[i].ra1 = newRow.getFloat( "randomAngle1" );
    chars[i].ra2 = newRow.getFloat( "randomAngle2" );
    
    
    
  }
  } //<>//

  anchorX= width/8;
  anchorY = height/2;
}

void draw(){
  background(255);
  animation.beginDraw();
  animation.clear();
  

  
  

  
  /*if(y> height - 192){
    y = 64;
  }*/
  
  anchorX = width/4;
  
  
  for(int i = 0; i < typedString.length(); i++){ //<>//
   chars[i].drawChar(i);
   //chars[i].update();
  }
    
      
   animation.endDraw();
   animation.save( "data/frames/typedString"+typedString+frameCount+ ".png");
   image(animation,0,0);
   
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
   interUnit.stroke(255,0,0);
   interUnit.strokeWeight(20);
     interUnit.point(chars[charIndex].xhome, chars[charIndex].yhome+50);
   
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
  float size;
  PGraphics charUnit;
  float xhome, yhome = height/2;
  float xOS, yOS;
  float xPos, yPos;
  float theta, ra1, ra2;
  boolean anglecheck = true;
 
  void ccSetup(){
   
   
   fontIndex = int(random(fontList.length));
   strokeWeight(1);
   xPos = random(width);
   yPos = height;
   //theta = random(TWO_PI);
   ra1 = radians(random(-7, 7));
   ra2 = radians(random(-7, 7));
  }
  
  void drawChar(int i) {
    
    
    xhome = anchorX;
    xhome = xhome + xOS;
    yhome = height/2;
    yhome = yhome + yOS;
    
    
    xPos = lerp(xPos,xhome,0.1);
    yPos = lerp(yPos,yhome,0.1);
    //theta = lerp(theta,0,0.05);
    
    
      if(frameCount%10 ==0){
      if(anglecheck == true) {
      theta = ra1;
      anglecheck = false;
    } else {
    theta = ra2;
    anglecheck = true;
  }
      
      size = s;
      size = s + random(-10, 10);
      }
      

    animation.textFont(nFonts[fontIndex]);
    textFont(nFonts[fontIndex]);
    textSize(s);
    animation.textSize(s);
    animation.textAlign(CENTER);
    animation.fill(0);
    
    animation.pushMatrix();
    animation.translate(xPos, yPos);
    animation.rotate(theta);
    
    animation.text(typedString.charAt(i), 0, 0);
    animation.popMatrix();
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
        
        if(charIndex >= typedString.length()){ charIndex = 0;
        }
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
          println(chars[charIndex].yOS);
          break;
          case 'a':
          chars[charIndex].yOS--;
          println(chars[charIndex].yOS);
          break;
          
          case 'w':
          chars[charIndex].xOS++;
          println(chars[charIndex].xOS);
          break;
          case 's':
          chars[charIndex].xOS--;
          println(chars[charIndex].xOS);
          break;
          case 'p':
          chars[charIndex].ra1 = radians(random(-7, 7));
          chars[charIndex].ra2 = radians(random(-7, 7));
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
     output.addColumn("randomAngle1");
     output.addColumn("randomAngle2");
   
     
     
     for(int i = 0; i <typedString.length(); i++){
       TableRow newRow = output.addRow();
       
       String carac = typedString.substring(i,i+1);
       newRow.setInt("charIndex", i);
       newRow.setString("character", carac);
       newRow.setInt("fontIndex", chars[i].fontIndex);
       newRow.setFloat("xOffSet", chars[i].xOS);
       newRow.setFloat("yOffSet", chars[i].yOS);
       newRow.setFloat("charSize", chars[i].s);
       newRow.setFloat("randomAngle1", chars[i].ra1);
       newRow.setFloat("randomAngle2", chars[i].ra2);
       
     
     }
     
     saveTable(output, "data/"+ typedString + day() + hour() + minute()+ second() +"Params.csv");
     
     
     break;
  }
}