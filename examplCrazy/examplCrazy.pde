int n = 70;
float t = 0;
int div = 100;
float d = 0.0;
float xPos, yPos;
float r;
void setup(){
  size(1920, 1080);
  d = width / (float)n;
  noStroke();
  fill(255);
}

void draw(){
  background(0);
  fill(255);
  for(int x = 0; x < n; x++){
    for(int y = 0; y < n; y++){
       xPos = d*(x + 0.5);
       yPos = d*(y + 0.5);
       r = roundPlaces((sin(t * map(floor(dist(xPos,yPos, width/2, height/2)), 0, width/2, 5, 1)) * d), 4 );
      ellipse(xPos, yPos, r, r);
    }
    //println(r);
  }
  
  fill(255, 0, 0);
  t += TWO_PI/div;
  //println(d);
  
  //noLoop();
}
void keyPressed(){
 loop(); 
 println(r);
}
void mousePressed(){
  noLoop();
  println("go");
 //println(sin(t * map(floor(dist(round(mouseX/d)*d,round(mouseY/d)*d, width/2, height/2)), 0, width/2, 5, 1)));
}

void mouseMoved(){
  println((t * map(floor(dist(mouseX,mouseY, width/2, height/2)), 0, width/2, 5, 1)));
}


 float roundPlaces(float value, float places){
  float mult = pow(10,places);
  float rst = (round(value * mult))/ mult;
  return rst;
  
}
