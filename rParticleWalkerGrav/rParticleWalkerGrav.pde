//fazer um programa com um walker que é a média de duas particulas aleatórias

Walker w1;
Particle p1,p2;

void setup(){
  size(2000, 1000);
  background(255);
  
  w1 = new Walker();
  
  p1 = new Particle();
  p2 = new Particle();
  
  p1.init();
  p2.init();
  
  w1.init();
}

void draw(){
  //background(255);
  p1.walk();
  p2.walk();
  
  w1.display();
  w1.update();
  
}
