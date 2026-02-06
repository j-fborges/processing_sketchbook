float a = 0;
float b;
float c;
int d;
boolean g;
int h;
int j;
int larg;
int alt;
int x;
int y;

void setup(){
size (1920,1080);
background (255);}


        


void circulos (int x , int y) {        
 noStroke();
  fill(b,b);
  ellipse(x, y, larg, alt);
  fill(b+20,b);
    ellipse(y,x , larg, alt);
    fill(b+40,b);
      ellipse(alt,y, larg,x );
      fill(b+60,b);
        ellipse(larg, alt,x,y);
}

void draw(){

a+=0.5;
b=a%10;
c=a%50;

if (c==8) {
  //background (255,1);
}

//h++;
//int h = int(random(1920));
//int j = int(random(1080));
int z = int(random(400));
int k = int(random(400));

x = int(random(400)); //somar!!!
y = int(random(400));
larg = int(random(400));
alt = int(random(400));

circulos(z,k);





        
}