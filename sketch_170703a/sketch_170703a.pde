int posX = 320;
int posY = 240;
int limitX = 1024;
int limitY = 780;
Boolean XMORE = true;
Boolean YMORE = true;
void setup()
{
  size(1024, 780);
  background(128);
  fill(0,150,255);
  stroke(0,0,255);
}

void draw()
{
  rect(posX,posY,100,100);
  if (XMORE){
      posX++;
  }else{
      posX--;
  }
  if (YMORE){
      posY++;
  }else{
      posY--;
  }
  if (posX+100 >= limitX){
    XMORE = !XMORE;
  }
    if (posY+100 >= limitY ){
    YMORE = !YMORE;
  }
}