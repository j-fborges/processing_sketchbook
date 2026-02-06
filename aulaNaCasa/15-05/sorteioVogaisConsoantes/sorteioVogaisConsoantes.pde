PFont font1;
char vocs[] = { 'a', 'e', 'i', 'y', 'o', 'u'} ;
char cons[] = { 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','x','w','x','z'};
String a[] = { "a", "z", "e", "d", "o"};
String b[] = { "a", "z", "e", "d", "o"};
String list[] = PFont.list();
boolean vocCons;
String nWord0, nWord1;
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
  frameRate(60);
  background(0);
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
}

void draw(){
  fC++;
  if(fC == 16){
    a[0] = str(vocs[round(random(vocs.length-1))]);
    a[2] = str(vocs[round(random(vocs.length-1))]);
    a[4] = str(vocs[round(random(vocs.length-1))]);
    
    b[1] = str(cons[round(random(cons.length-1))]);
    b[3] = str(cons[round(random(cons.length-1))]);
    
    fC = 0;
  }
  fill(0, 5);
  rect(-1,-1, width+1, height+1);
  y+= 1;
  
  //sN = round(random(10));
  //font1 = createFont(list[round(random(list.length -1))], 32);
  //textFont(font1);
 /* for(int i = 0; i< sN; i ++){
    nWord = nWord + str(cons[round((int)random(cons.length-1))]) + str(vocs[round((int)random(vocs.length-1))]);
  }
  */
  //nWord0 = str(vocs[round(random(vocs.length-1))]) + "z" + str(vocs[round(random(vocs.length-1))]) + "d" + str(vocs[round(random(vocs.length-1))]);
  //nWord1 = "a" + str(cons[round(random(cons.length-1))]) + "e" + str(cons[round(random(cons.length-1))]) + "o";
  
  fill(255,0,0);
  text(a[0], x, y);
  text("z", x + cD, y);
  text(a[2], x + (cD*2), y);
  text("d", x + (cD*3), y);
  text(a[4], x + (cD*4), y);
  
  
  fill(0,0,255);
  text("a", x1, y);
  text(b[1], x1 + cD, y);
  text("e", x1 + (cD*2), y);
  text(b[3], x1 + (cD*3), y);
  text("o", x1 + (cD*4), y);
  
  if(y>height+50){ y = -50;}

  save("anim/00/frame" + frameCount + ".png");
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
