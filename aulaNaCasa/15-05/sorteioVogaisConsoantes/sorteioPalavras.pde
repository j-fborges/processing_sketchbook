PFont font1;
char vocs[] = { 'a', 'e', 'i', 'y', 'o', 'u'} ;
char cons[] = { 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','x','w','x','z'};
String list[] = PFont.list();
boolean vocCons;
String nWord;
float x = 100,
y = 100;
int sN, fI;
PFont fList[];

void setup(){
  size(1000,1000);
  background(0);
  printArray(list);
  font1 = createFont(list[3], 32);
  textFont(font1);
  fList = new PFont[list.length];
  for(int i = 1; i< list.length ; i ++){
    fList[i] = createFont(list[i], 32);
  }
  println("OKKKKK");
}

void draw(){
  sN = round(random(10));
  //font1 = createFont(list[round(random(list.length -1))], 32);
  sF();
  textFont(fList[fI]);
  //textFont(font1);
  for(int i = 0; i< sN; i ++){
    nWord = nWord + str(cons[round((int)random(cons.length-1))]) + str(vocs[round((int)random(vocs.length-1))]);
  }
  text(nWord, x, y);
  x += textWidth(nWord) + 10;
  
  if( x >= width -100 - (textWidth(nWord)*1.5)){
   y += 60;
   x = 100;
  }
  
  nWord = "";
  
  if(y >= height -100){
   background(0);
   y = 100;
  }
}

void sF(){
  fI = round(random(list.length -1));
  if(fList[fI] == null){ sF();}
}
