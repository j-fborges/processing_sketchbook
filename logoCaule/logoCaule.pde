PShape logoST;
PShape logoSTchild;

PShape logoEstagio0, logoEstagio1, logoEstagio2, logoEstagio3, logoEstagio4;
PShape  logoEstagio0Child,logoEstagio1Child, logoEstagio2Child, logoEstagio3Child, logoEstagio4Child;

PImage img;
boolean mp = false;
PrintWriter vertexloc;
String line;
String[] coord;
PVector vel = new PVector(0,0);
PVector [] locEstagio1, locEstagio4;


BufferedReader reader;
SVertex[] shapeVertex;
float g = 0;
int x, y;
PGraphics animation;

void setup(){
  x = y = 500;
  size(1920,1080);
  frameRate(30);
  background(255);
  logoEstagio0 = loadShape("cauleLogoEstagio0.svg");
  logoEstagio1 = loadShape("cauleLogoEstagio1.svg");
  logoEstagio2 = loadShape("cauleLogoEstagio2.svg");
  logoEstagio3 = loadShape("cauleLogoEstagio3.svg");
  logoEstagio4 = loadShape("cauleLogoEstagio6.svg");
  logoEstagio0Child = logoEstagio0.getChild(0);
  logoEstagio1Child = logoEstagio1.getChild(0);
  logoEstagio2Child = logoEstagio2.getChild(0);
  logoEstagio3Child = logoEstagio3.getChild(0);
  logoEstagio4Child = logoEstagio4.getChild(0);
  println(logoEstagio1Child.getVertexCount());
  println(logoEstagio2Child.getVertexCount());
  println(logoEstagio3Child.getVertexCount());
  println(logoEstagio4Child.getVertexCount());
  println("ok");
  //logoVTs = new PVector[getChildrenVertexCount(logoST)];
  shapeVertex = new SVertex[logoEstagio4Child.getVertexCount()];
  vertexloc = createWriter("positions.txt");
  reader = createReader("positions.txt");
  for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
    //logoVTs[i] = logoSTchild.getVertex(i);
    shapeVertex[i] = new SVertex();
    shapeVertex[i].loc = shapeVertex[i].init;
    shapeVertex[i].dest0 = logoEstagio0Child.getVertex(i);
    shapeVertex[i].dest = logoEstagio1Child.getVertex(i);
    shapeVertex[i].dest2 = logoEstagio2Child.getVertex(i);
    shapeVertex[i].dest3 = logoEstagio3Child.getVertex(i);
    shapeVertex[i].dest4 = logoEstagio4Child.getVertex(i);
    //vertexloc.println(logoVTs[i].x + " , "+logoVTs[i].y);
  strokeWeight(1);
     
    
  }
  vertexloc.flush();
    vertexloc.close();
  
   coord = loadStrings(reader);
   img = loadImage("152x152.png");
   animation = createGraphics(width, height);
   for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        shapeVertex[i].update(i);
      }
}




void draw(){
  background(255);
  fill(0);
  //rect(0,0,width,height);
  //shape(logoSTchild,width/5,height/4);
  animation.beginDraw();
  animation.clear();
  animation.shape(logoEstagio4Child,width/2,height/2);
  
  
  
    if(frameCount > 30*0 && frameCount < 30*2){
    
      for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        shapeVertex[i].updateReturn2(i);
      }
    }
    
    if(frameCount > 30*2 && frameCount < 30*4){
    
      for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        shapeVertex[i].updateReturn3(i);
      }
    }
    
    if(frameCount > 30*4 && frameCount < 30*7){
    
      for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        shapeVertex[i].updateReturn4(i);
      }
    }
    
    if(frameCount > 30*7 && frameCount < 30*10){
      g+=.001;
    
      for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        
        
        shapeVertex[i].updateReturnf(i, g);
      }
      println(" --- " + (.012 +g));
    }
    if(frameCount > 30*10 && frameCount < 30*1){
    
      for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
        shapeVertex[i].updateReturnff(i);
      }
    }
    animation.endDraw();
    animation.save("animation/04/frame"+frameCount+".png");
    image(animation,0,0);
    println(frameCount);
}






void mousePressed(){
  if(mouseButton == LEFT){
    mp = true;
    for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
      //shapeVertex[i].initReturn(i );
    }
  }
  if(mouseButton == RIGHT){
    mp = false;
    for (int i = 0; i < logoEstagio4Child.getVertexCount(); i++){
      shapeVertex[i].initNoise(i, x , y);
    }
  }

}


  int getChildrenVertexCount(PShape shape){
  int vertexCount = 0;
  for(PShape child : shape.getChildren()){
    vertexCount += child.getVertexCount();
  }
  int childCount = shape.getChildCount();
  println("Vertex count:", vertexCount);
  println("Child shapes:", childCount);
  println("Vert/children", vertexCount/float(childCount), "\n");
  return vertexCount;
  }
  
  
  void printChildVertices(PShape shape){
  for(int i=0; i<shape.getChildCount(); i++){
    PShape child = shape.getChild(i);
    for(int j=0; j<child.getVertexCount();j++){
      PVector vert = child.getVertex(j);
      println(vert);
    }
  }
  println("");
}


class SVertex{
  PVector loc = new PVector(0,0), init = new PVector(0,0), vel = new PVector(0,0), acc = new PVector(0,0), dest2 = new PVector(0,0), dest0 = new PVector(0,0), dest3 = new PVector(0,0), dest4 = new PVector(0,0), dest = new PVector(0,0);
  int xPos, yPos;
  
  
  void initNoise(int i, int xPos, int yPos) {
    pushMatrix();
      translate(xPos, yPos);
      vel.set(0.5, 0.5);
      vel.rotate(radians(random(360)));
      acc.set(0.5, 0.5);
      acc.rotate(radians(random(360)));
      vel.add(acc);
      loc.add(vel);
      
      point(loc.x,loc.y);
      
      
    popMatrix();
      
  }
  
  void update(int i){
    
    
    logoEstagio4Child.setVertex(i,loc.x,loc.y);
    
  }
  
  void updateReturn0(int i){
   loc.set(init.lerp(dest2, .017));
   
   logoEstagio4Child.setVertex(i,loc.x,loc.y);
  }
  
  void updateReturn2(int i){
   loc.set(init.lerp(dest2, .02));
   
   logoEstagio4Child.setVertex(i,loc.x,loc.y);
  }
  
  
  
  void updateReturn3(int i){
   loc.set(loc.lerp(dest3, .02));
   
   logoEstagio4Child.setVertex(i,loc.x,loc.y);
  }
      
      
  
  
  void updateReturn4(int i){
   loc.set(loc.lerp(dest4, .012));
   
   logoEstagio4Child.setVertex(i,loc.x,loc.y);
  }
  
  void updateReturnf(int i, float g){
   
   loc.set(loc.lerp(dest4, .012+g));
   
   logoEstagio4Child.setVertex(i,loc.x,loc.y);
   
  }
  
  void updateReturnff(int i){
   
   
   
   logoEstagio4Child.setVertex(i,dest4.x,dest4.y);
   
  }
  
}