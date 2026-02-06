float angle = 1;

void setup(){
 size(500,500, P2D); 
 background(255);
 noStroke();
 strokeWeight(20);
 frameRate(720);
}

void draw(){
  //println(frameRate);
  fill(255, 10);
  rect(0,0, width,height);
  angle += 1;
 pushMatrix();
   fill(255,200,50);
   translate(width/2, height/2);
   ellipse(0,0,1,1);
   
   rotate(radians(angle));
   translate(50, 0);
   fill(50, 200, 255, 00);
   ellipse(0,0,1,1);
   
   
     pushMatrix();
       rotate(radians(angle*618));
       translate(50,0);
       fill(50,255,200);
       ellipse(0,0,5,5);
     popMatrix();
     
     
     /*pushMatrix();
       rotate(radians(angle*2));
       translate(15,0);
       
       fill(50, 200, 50);
       ellipse(0,0,6,6);
     popMatrix();
     */
     
     
 popMatrix();
}