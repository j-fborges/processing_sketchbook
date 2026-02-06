float a, b, c;

void setup(){
  size(1000,1000);
  rectMode(CENTER);
  frameRate(60);
}

void draw(){
  translate(width/2, height/2);
  a += .001;
  
  //b += .1;
  for(float i = 1000 ; i > 0 ; i = i - 1){
    b += .1;
    c += .00000001;
    rotate(c);
    rect(0*sin(b),0, i* sin(i*a), i*cos(a*i+(mouseX*.001)));
    //rect(width/2,height/2, i, i);
  }
  println(frameCount);
}
