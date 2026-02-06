PFont font1;
char vocs[] = { 'a', 'e', 'i', 'y', 'o', 'u'} ;
char cons[] = { 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','x','w','x','z'};
String a[] = { "a", "z", "e", "d", "o"};
String b[] = { "a", "z", "e", "d", "o"};
String p[] = { "p", "a", "l", "a", "v", "r", "a"};
String list[] = PFont.list();
boolean vocCons;
String nWord0, nWord1, nWord;
float x = 150,
y = -20,
x1 = 500,
y1,
cD = 75;
int sN, fI, fC;
PFont fList[];
PFont rFont;

void setup(){
  size(1000,1000);
  frameRate(10);
  background(255);
  printArray(list);
  font1 = createFont("Source Code Pro ExtraLight", 150);
  textFont(font1);
  fList = new PFont[list.length];
  /*for(int i = 1; i< list.length ; i ++){
    fList[i] = createFont(list[i], 32);
  }
  sF();
  textFont(fList[fI]);
  */
  
  //textFont(createFont(list[(int)random(list.length)] , 100));
  textFont(font1);
  
  //sF();
  
  println("OKKKKK");
  fill(0);
}

void draw(){
  background(255);
  
  for(int i = 0; i < round(random(p.length-1)); i++){
    nWord = nWord + p[round(random(p.length-1))];
  }
  
  //sN = round(random(10));
  //font1 = createFont(list[round(random(list.length -1))], 32);
  //textFont(font1);
 /* for(int i = 0; i< sN; i ++){
    nWord = nWord + str(cons[round((int)random(cons.length-1))]) + str(vocs[round((int)random(vocs.length-1))]);
  }
  */
  //nWord0 = str(vocs[round(random(vocs.length-1))]) + "z" + str(vocs[round(random(vocs.length-1))]) + "d" + str(vocs[round(random(vocs.length-1))]);
  //nWord1 = "a" + str(cons[round(random(cons.length-1))]) + "e" + str(cons[round(random(cons.length-1))]) + "o";
  
 
  text(nWord, width/2 - 200, height/2);
  
  
  nWord = "";
}

void sF(){
  fI = round(random(list.length -1));
  rFont = createFont(list[fI] , 100);
  textFont(rFont);
  println(list[fI]);
  if(rFont == null){ sF();}
}

void keyPressed(){
  sF();
}
