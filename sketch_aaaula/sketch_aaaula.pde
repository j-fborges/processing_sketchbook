int x=30; 
int y=400;
int r = 0; // fator bagunça
void setup(){
size(400,400);  
}
void draw(){
  r = (int)random(2, 40);
//line(0,0,400,400);
stroke(255);
line(400,0,x,y);
stroke(
line(0,0, 400-x, y);
x= x+30;
  //x = x + r;
println(x);
if(x>width){ x=0; y=y-20;} //se x for pra pqp volta pro comeawdh uwdg swugdw
}
