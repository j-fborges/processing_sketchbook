PImage img;

int width=600;
int height=600;
int x1;
int y1;
int x2;
int y2;
int sx=10;
int sy=100;
int iter=100;

void setup(){
  size(width,height);

  img=loadImage("rain.jpg");
  image(img,0,0);
 
  for (int h=0;h<iter;h++)
  {
    sx=int(random(5,30));
    sy=int(random(50,130));
 
  loadPixels();
  x1=int(random(0,width-sx-1));
  y1=int(random(0,height-sy-1));
  x2=int(random(0,width-sx-1));
  y2=int(random(0,height-sy-1));
 
  for (int i=0; i<sx ;i++)
  {
    for (int j=0; j<sy;j++)
  {
    color temp=pixels[(x1+i)*width + (y1+j)];
    pixels[(x2+i)*width + (y2+j)]=pixels[(x1+int(random(0,i)))*width+(y1+int(random(0,j)))];
    pixels[(x1+i)*width + (y1+j)]=temp;
  }}
  updatePixels();
  }
};