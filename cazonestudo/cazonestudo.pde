int x = 50;
int y = x*3;
int a;
int s;

void setup(){
  size(600,600);
  
}

void draw(){
  background(255,255,255,100);
  a=a+1;
  //println(a);
  stroke(10);
  strokeWeight(s);
  line(x,100, 400, 400);
  line(x+a,100, 400+a, 400);
  line(x + 2*a, 100, 400+2*a,400);
  if(a> 100){
    a=0;
  }
  if(a>50){
    s=10;
} else {
  if(a>20 && a<30 ){
    s=5;
  } else {
  s = 1;
  }
}

if(mousePressed==true){
  rectMode(CENTER);
  rect(mouseX,mouseY,50,50);
}

}