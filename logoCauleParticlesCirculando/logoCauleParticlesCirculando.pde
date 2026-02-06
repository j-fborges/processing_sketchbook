PShape logoST;
PShape logoSTchild;

PShape logoSTEstagio0;
PShape logoSTchildEstagio0;

boolean mp = false;
PGraphics animation;

PVector vel = new PVector(0,0);
int jCount0 = 0;
BufferedReader reader;
//SVertex[] shapeVertex;
PGroup particleGroup = new PGroup();
int x, y, vertexN;

void setup(){
  x = y = 500;
  size(1920,1080);
  frameRate(60);
  background(255);
  //strokeWeight(5);
  
  logoST = loadShape("cauleArvoreFolhas.svg");
  logoSTchild = logoST.getChild(0);
  
  
  logoSTEstagio0 = loadShape("cauleArvoreFolhasEstagio0.svg");
  logoSTchildEstagio0 = logoSTEstagio0.getChild(0);
  

  particleGroup.init();
  
  animation = createGraphics(width, height);

  //println(logoSTchild.getVertexCount());

}




void draw(){
  background(255);
  animation.beginDraw();
  animation.clear();
  fill(0);
  //rect(0,0,width,height);
  
  
  //particleGroup.walkToNext(500, 300);
  particleGroup.pointWalkCrescente(width/2, height/2);
  //particleGroup.pointWalk(mouseX+500, mouseY);
  
 

    animation.endDraw();
    animation.save("animation/06/frame"+frameCount+".png");
    image(animation,0,0);
//println(getChildrenVertexCount(logoST));
println(int(frameCount/60));
}

void mousePressed(){
  jCount0++; //<>//
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


class PGroup {
  
  PVector [] logoVTs;
  SVertex[] shapeVertex;
  int vIndex, lC;
  int val = 0;
  int hugval[];
  int hugval0[];
  PVector [] [] intrmVTS;
  int jCount = 0;
  int g = 6;
  void init(){
     
  
     shapeVertex = new SVertex[logoSTchild.getVertexCount()];
     hugval = new int[logoSTchild.getVertexCount()];
     hugval0 = new int[logoSTchild.getVertexCount()];
     println(logoSTchild.getVertexCount());
     intrmVTS = new PVector [1000] [logoSTchild.getVertexCount()];
     
     
     
  
     for (int i = 0; i < logoSTchild.getVertexCount(); i++){
      intrmVTS [0] [i] = new PVector(0,0);
      intrmVTS [0] [i] = logoSTchildEstagio0.getVertex(i);
      intrmVTS [999] [i] = logoSTchild.getVertex(i);
      shapeVertex[i] = new SVertex();
      shapeVertex[i].loc = logoSTchildEstagio0.getVertex(i);
      shapeVertex[i].loc0 = logoSTchildEstagio0.getVertex(i);
      shapeVertex[i].dest = logoSTchild.getVertex(i);
      hugval[i] = i;
      hugval0[i] = i;
      /*
      hugval0[i] = logoSTchild.getVertexCount() -i;
      hugval0[i]++;
          if(hugval0[i] > logoSTchild.getVertexCount()-1){
            hugval0[i] = 0;
          }
    */
  } 
    for(int j = 1; j < 999; j++){
      for (int i = 0; i < logoSTchild.getVertexCount(); i++){
        intrmVTS [j] [i] = new PVector(0,0);
      intrmVTS [j] [i].set(shapeVertex[i].init.lerp(shapeVertex[i].dest, 0.00001*j));
      }
    }
  
  }
  
   //<>//
  
  void pointWalk(float xPos, float yPos){
    pushMatrix();
    translate(xPos, yPos);
    
    
    
    
    if(frameCount%2 == 0){
      val+= 1;
      if(val >=  logoSTchild.getVertexCount()/2){
        val=0;
      }
      for(int i = 0; i < logoSTchild.getVertexCount();i++){
        hugval[i]++;
        if(hugval[i] > logoSTchild.getVertexCount()-1){
          hugval[i] = 0;
        }
      }
    }
    for(int i = 0; i < logoSTchild.getVertexCount();i+= 5){
      stroke(#3B996F);
      strokeWeight(10);
    point(shapeVertex[hugval[i]].dest.x, shapeVertex[hugval[i]].dest.y);
    }
    popMatrix();
  }
  
  void pointWalkCrescente(float xPos, float yPos){
    animation.pushMatrix();
    animation.translate(xPos, yPos);
    
    
    
    if(frameCount >= 60*12 && g<10  && frameCount%60*3==0){g++;}
    
    if(frameCount%g == 0){
      val+= 1;
      if(val >=  logoSTchild.getVertexCount()/2){
        val=0;
      }
      for(int i = 0; i < logoSTchild.getVertexCount();i++){
        hugval[i]++;
        if(hugval[i] > logoSTchild.getVertexCount()-1){
          hugval[i] = 0;
        }
      }
    }
    
    
    if(jCount<999){jCount+= 2;}
    if(jCount >= 999) { //<>//
      jCount = 999;
    }
    //println(jCount);
    
    
    for (int i = 0; i < logoSTchild.getVertexCount(); i++){
      shapeVertex[i].loc.set(intrmVTS [jCount] [i]);
    }
    
    for(int i = 0; i < logoSTchild.getVertexCount();i+= 3){
      animation.stroke(#3B996F);
      animation.strokeWeight((jCount*.012));
    animation.point(shapeVertex[hugval[i]].loc.x, shapeVertex[hugval[i]].loc.y);
    }
    animation.popMatrix();
  }
  
  void pointWalkCrescente1(float xPos, float yPos){
    pushMatrix();
    translate(xPos, yPos);
    
    
    
    
    if(frameCount%2 == 0){
      
      
        val+= 1;
        if(val >=  logoSTchild.getVertexCount()/2){
          val=0;
        }
        for(int i = 0; i < logoSTchild.getVertexCount();i++){
          hugval0[i]++;
          if(hugval0[i] > logoSTchild.getVertexCount()-1){
            hugval0[i] = 0;
          }
        }
      
    
    if(frameCount <30*3){
    for (int i = 0; i < logoSTchild.getVertexCount(); i++){
      shapeVertex[i].loc.set(shapeVertex[i].loc0.lerp(shapeVertex[hugval0[i]].dest, 0.1));
    }
      } else {
        for (int i = 0; i < logoSTchild.getVertexCount(); i++){
      shapeVertex[i].loc.set(shapeVertex[i].loc0.lerp(shapeVertex[hugval0[i]].dest, 0.1));
    }
    }
    
    for(int i = 0; i < logoSTchild.getVertexCount();i+= 5){
      stroke(#009385);
      strokeWeight(10);
    point(shapeVertex[hugval0[i]].loc.x, shapeVertex[hugval0[i]].loc.y);
    }
    
  }
  popMatrix();
  }
  
  

class SVertex{
  PVector loc = new PVector(0,0), loc0 = new PVector(0,0), vel = new PVector(0,0), acc = new PVector(0,0), dest = new PVector(0,0), tempDest = new PVector(0,0), init = new PVector(0,0);
  int xPos, yPos;
  
  
  
  
  void initReturn(int i, int xPos, int yPos){
    pushMatrix();
      translate(xPos, yPos);
   vel.set(0,0);
   acc.set(loc.lerp(dest, .1));
   acc.normalize();
   vel.add(acc);
   
   loc.add(vel);
   
   point(loc.x,loc.y);
   popMatrix();
  }
  
  void updateReturn(int i, int xPos, int yPos){
   pushMatrix();
   translate(xPos, yPos);
   acc.set(loc.lerp(dest, .1));
   acc.normalize();
   vel.add(acc);
   
   loc.add(vel);
   vel.mult(0.1);
   point(loc.x,loc.y);
   popMatrix();
  }
      
  
  
}
}