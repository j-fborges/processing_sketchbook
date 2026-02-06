float a;
float s;
void setup(){
  size(2000,1000);
  
  noiseSeed((long)random(10000));
}

void draw(){
  if(mousePressed){
    for(float i = 0; i <width; i=i+mouseX/20){
     for(float ii = 0; ii <height ; ii+= mouseX/20){
       ellipse(i+((noise(i, ii ,a)* 15)+5)*sin(i+a), ii+((noise(i, ii, a)* 15)+5)*cos(a+ii), 20, 20);
       a += .0001;
     }
    }
  }
}
