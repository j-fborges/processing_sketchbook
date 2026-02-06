PShape ilca;
PShape maria;

PGraphics animation;
PGraphics mariaG;
PGraphics ilcaG;

float z, zp, zp2;
void setup(){
 size(1900, 1000);
 background(255);
 ilca = loadShape("ilcaVec.svg");
 maria = loadShape("mariaVec2.svg");
 //maria = maria.getChild(0);
 animation = createGraphics(width, height);
 //mariaG = createGraphics(width, height, P3D);
 //ilcaG = createGraphics(width, height, P3D);
 z = 0.01;
 zp = 1;
 zp2 = 1;
 maria.scale(z);
 //maria.disableStyle();
 println("ok");
}


void draw(){
  maria.resetMatrix();
  
    if(frameCount%100 == 0)  {zp2*=1.1;}
    if(frameCount%3 == 0)  {zp2*=1.1;}
    //if(frameCount%30 == 0)  {zp= zp +.5*zp2;}
    zp= zp +.2*zp2;
  z += 0.01*zp; //<>//
  println(" --- | frameRate: " + frameRate +" --- | loop: " + frameCount +" --- | z: " + z +" --- | zp: " + zp);
  animation.beginDraw();
  animation.clear();
  background(255);
                        /*
                          mariaG.beginDraw();
                          mariaG.clear();
                          mariaG.translate(0,0, +z);
                          mariaG.shape(maria, width/2, height/2);
                          
                          mariaG.endDraw();
                        */
  maria.scale(z);
  animation.shape(maria, width/2, height/2);
  
        //animation.image(mariaG, 0, 0);
  animation.endDraw();
  image(animation, 0,0);
  
}
