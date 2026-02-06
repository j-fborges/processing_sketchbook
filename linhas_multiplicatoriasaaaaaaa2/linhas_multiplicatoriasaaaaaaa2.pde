int x;
float y=1.0;
float z=0.0;
float t;
float f;
boolean w;
int cordalinha=0;
float transparencia;
void setup() {
 
  size(1200, 800);
  background(200);
  smooth();

}

void draw() {
  strokeWeight(y/500);
  f=y+cos(y)*5;
  y=z%height*t;
  z++;
  transparencia=y/3;
  stroke(cordalinha,transparencia);
println(z);
  t= random(1,2)/2;





 /* if (y==0) {
    //z=z-120;
    ;
    if (cordalinha==0) {
     
      cordalinha=cordalinha+255;
      stroke(cordalinha);
  
    } else {
      cordalinha=cordalinha-255;
      stroke(cordalinha);
    
    }
  }*/

  
for (int i=0; i<5; i++){   
    line(x, y,width, i*y+f);
    line(width, y, x, i*y+f);
}
    
    if(y>height){ y=0;  
    if (cordalinha==0) {
     
      cordalinha=cordalinha+255;
      stroke(cordalinha);
  
    } else {
      cordalinha=cordalinha-255;
      stroke(cordalinha);
    
    }
   
}}
  

  
  void keyPressed() {
    save("line.jpg");
     save("line"+year()+month()+day()+minute()+second()+".png");
  println("save");
  
  }