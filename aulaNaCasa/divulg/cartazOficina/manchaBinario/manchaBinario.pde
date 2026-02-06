String bin [] = {"0", "1"};
String list[] = PFont.list();
PFont fnt1;
boolean one = false;
PFont fList[];
int sN, fI;

void setup(){
 size(1000,1000);
  background(0);
  printArray(list);
  
  fList = new PFont[list.length];
  for(int i = 1; i< list.length ; i ++){
    fList[i] = createFont(list[i], 32);
  }
  println("OKKKKK");
}

void draw(){
  sF();
  textFont(fList[fI], random(100));
  int a = round(random(0,1));
  text(str(a), random(200,400), random(200, 400));
  
  
  
}

void sF(){
  fI = round(random(list.length -1));
  if(fList[fI] == null){ sF();}
}
