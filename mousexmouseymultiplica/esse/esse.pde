float a = 0;
float b;
int c;
int d;


void setup(){
size (1920,1080);
background (255);}

void draw(){

a+=0.5;
b=a%255;


  background (255);
int x = int(random(400));
int y = int(random(400));
int larg = int(random(400));
int alt = int(random(400));

int q = int(random(400));
int w = int(random(400));
int z = int(random(400));
int k = int(random(400));


noStroke();

  //fill(0);
//ellipse(x,x,x,x);
      // fill(125); 
       // ellipse(x,y,y,x);
        
        
 fill(b,b);
  ellipse(x, y, larg, alt);
  fill(b+20,b);
    ellipse(y,x , larg, alt);
    fill(b+40,b);
      ellipse(alt,y, larg,x );
      fill(b+60,b);
        ellipse(larg, alt,x,y);
        
}