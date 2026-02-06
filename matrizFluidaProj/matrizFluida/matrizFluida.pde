float a, s;

void setup(){
  size(1000,500);
  
  //noFill();
}

void draw(){
  a += .07; 
  //s = mouseX;
  //background(255);
  for(int i = 0; i <= width; i+= 20){
    //fill(
    for(int j = 0; j <= height; j += 20){
      
      //fill(random(255));
      s = dist(mouseX, mouseY, i, j);
      ellipse(i, j, (s/10)*sin((s/5)+a), (s/10)*sin((s/5)+a));
    }
  }
}
