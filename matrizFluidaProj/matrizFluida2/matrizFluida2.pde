/*
Autorship: JOAOpfb. 30/04/2019.

Notas: 

*/
String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());

float prog, // variável que aumenta conforme passa o tempo, criando a animação.
x = 1, //variável genérica para teste de estética.
y = .00000001, //variável genérica para teste de estética.
sz, //tamanho da célula.
fTpD, //fator tamanho em relação a distância.
fATpD, //fator acrescimo de tamanho em relação a distância. 
s, // distância de um ponto até a posição de cada célula da matriz, criando toda a concentricidade, USADA AQUI NO MOUSE.
t,
tn,
k;

boolean isA = false,
isQ = false,
isW = false,
isS = false,
isE = false,
isD = false;

void setup(){
  size(1000,1000);
  noStroke();
  //noFill();
  fill(255);
  //strokeWeight(2);
}

void draw(){
  if(isA){
   y-=.01;
   println( "x: " + x);
  }
  
  if(isQ){
    y+=.01;
    println( "x: " + x);
  }
  
  if(isS){
   x-=.01;
   println( "x: " + x);
  }
  
  if(isW){
    x+=.01;
    println( "x: " + x);
  }
  
  if(isD){
   k-=.01;
   println( "x: " + x);
  }
  
  if(isE){
    k+=.01;
    println( "x: " + x);
  }
  
  prog += .1; 
  //s = mouseX;
  //background(255);
  //fill(255);
  for(int i = 0; i <= width; i+= 20){
    //fill(
    for(int j = 0; j <= height; j += 20){
      
      //fill(random(255));
      s = dist(width/2, height/2, i, j);
      t = map(s, 0, width/2, 0, 100);
      
      //fTpD = (s/10);                       // define um tamnho inicial para célula. Aqui definido pela distância da posição da célula em relação a posição do mouse. 
      //fATpD = sin((s/5)+prog);             // define uma proporção para o tamanho final da célula em relação a uma variavel crescente, formando a animação em loop usando a função seno. Aqui utilizada a variável 'prog'. A variável 's' presente fornece um ponto diferente de partida no loop de acrescimos de tamanho, criando uma progressividade e um efeito de ondulação. Aqui dividir ou multiplicar o 's', ou a distância, causa efeitos de progressão bem distintos. Somar ou subtrair nao causa efeito, é uma questão de proporção, o 'prog' aqui serve apenas para a progressão no loop da funçao seno.
      //sz = fTpD*fATpD;                     // primeira variação de toda a evolução do projeto.
      //sz = (s/x)*sin(((s/y)/mouseX)+prog);
      sz = (s/10)*sin(((s/x)*((pow(y, s/10))))+(t*k)+prog); //quando as distancias sao multiplicadas dentro de uma funçao seno criam padroes diferentes de quando as funçoes seno sao somadas entre si. Podem ser multiplicadas exponencialmente.
      tn = (s/10)*sin(((s/x)*((pow(y, s/10))))+(t*k)+prog); 
      fill(map(tn, -width/5, width/5, 0, 255));
      ellipse(i, j, sz, sz);
    }
  }
  fill(255);
  //text(nf(x), width- 100, height -100);
  //text(nf(frameRate), width- 100, height -50);
  save("data/frames/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "matriz2D"+frameCount+".jpg");
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
  }
}
