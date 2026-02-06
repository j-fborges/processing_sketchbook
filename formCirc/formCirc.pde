float x, y,
xp = .01,
yp = .01,
xSz = 50,
ySz = 50,
xA = width/2,
yA = height/2;

boolean isA = false,
isW = false,
isS = false,
isE = false,
isD = false,
isR = false,
isF = false,
isQ = false;

void setup() {
  size(500, 500);
  
  xA = width/2;
  yA = height/2;
}

void draw(){
  if(isQ) xp+=.001;
  if(isA) xp-=.001;
  if(isW) xA+=.1;
  if(isS) xA-=.1;
  if(isW) yA+=.1;
  if(isS) yA-=.1;
  x+= xp;
  y+= yp;
  
  point(xA+(cos(x)*xSz),yA+ (sin(y)*ySz));
}


void keyPressed(){
  switch(keyCode){
    case 'a':
      isA = true;
    break;
    case 'A':
      isA = true;
    break;
    case 'q':
      isQ = true;
    break;
    case 'Q':
      isQ = true;
    break;
    case 'w':
      isW = true;
    break;
    case 'W':
      isW = true;
    break;
    case 's':
      isS = true;
    break;
    case 'S':
      isS = true;
    break;
    case 'e':
      isE = true;
    break;
    case 'E':
      isE = true;
    break;
    case 'd':
      isD = true;
    break;
    case 'D':
      isD = true;
    break;
    case 'r':
      isR = true;
    break;
    case 'R':
      isR = true;
    break;
    case 'f':
      isF = true;
    break;
    case 'F':
      isF = true;
    break;
  }
}

void keyReleased(){
  switch(keyCode){
    case 'a':
      isA = false;
    break;
    case 'A':
      isA = false;
    break;
    case 'q':
      isQ = false;
    break;
    case 'Q':
      isQ = false;
    break;
    case 'w':
      isW = false;
    break;
    case 'W':
      isW = false;
    break;
    case 's':
      isS = false;
    break;
    case 'S':
      isS = false;
    break;
    case 'e':
      isE = false;
    break;
    case 'E':
      isE = false;
    break;
    case 'd':
      isD = false;
    break;
    case 'D':
      isD = false;
    break;
    case 'r':
      isR = false;
    break;
    case 'R':
      isR = false;
    break;
    case 'f':
      isF = false;
    break;
    case 'F':
      isF = false;
    break;
  }
}
