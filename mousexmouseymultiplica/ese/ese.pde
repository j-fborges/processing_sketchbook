



void setup(){
size (400,400);
background (255);}

void draw(){

  
int b = int (random(400));

int[] a = {b};
int c = min(a);

int d = int (random(400));

int[] e = {d};
int f = min(e);

int z = int (random(400));

int[] g = {z};
int i = min(g);

int y = int (random(400));

int[] j = {y};
int h = min(j);


  ellipse ( c, f, i, h);
  ellipse (h,f, i, c);
  ellipse (i, c ,f,h);

}