int x;
float y=1.0;
float z=0.0;
float t;
float f;
boolean w;
int cordalinha=0;

void setup() {
 
  size(600, 600);
  background(155);

}

void draw() {
  f=y+cos(y)*5;
  y=z%height*t;
  z++;
println(y);
  t= random(1,2);





  if (y==0) {
    //z=z-120;
    ;
    if (cordalinha==0) {
     
      cordalinha=255;
      stroke(255,50);
  
    } else {
      cordalinha=0;
      stroke(0,100);
    
    }
  }

  
for (int i=0; i<5; i++){   
    line(0, y,width, i*y+f);
    line(x+200, y, x+400, i*y+f);
   
}
  

  }
  void keyPressed() {
    save("line.jpg");
     save ("line"+year()+month()+day()+minute()+second()+".jpg");
  println("save");
  }