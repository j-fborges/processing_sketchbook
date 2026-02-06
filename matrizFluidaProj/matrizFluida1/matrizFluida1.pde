/*
Autorship: João PFB. 30/04/2019.

Notas: 

*/

float prog, // variável que aumenta conforme passa o tempo, criando a animação.
x = 10, //variável genérica para teste de estética.
y = .00000001, //variável genérica para teste de estética.
sz, //tamanho da célula.
fTpD, //fator tamanho em relação a distância.
fATpD, //fator acrescimo de tamanho em relação a distância. 
s; // distância de um ponto até a posição de cada célula da matriz, criando toda a concentricidade, USADA AQUI NO MOUSE.


boolean isA = false,
isQ = false;

void setup(){
  size(1000,1000);
  
  //noFill();
}

void draw(){
  if(isA){
   y-=.001;
   println( "x: " + x);
  }
  
  if(isQ){
    y+=.001;
    println( "x: " + x);
  }
  
  y+=.0002;
  
  prog += .07; 
  //s = mouseX;
  //background(255);
  fill(255);
  for(int i = 0; i <= width; i+= 20){
    //fill(
    for(int j = 0; j <= height; j += 20){
      
      //fill(random(255));
      s = dist(width/2, height/2, i, j);
      //fTpD = (s/10);                       // define um tamnho inicial para célula. Aqui definido pela distância da posição da célula em relação a posição do mouse. 
      //fATpD = sin((s/5)+prog);             // define uma proporção para o tamanho final da célula em relação a uma variavel crescente, formando a animação em loop usando a função seno. Aqui utilizada a variável 'prog'. A variável 's' presente fornece um ponto diferente de partida no loop de acrescimos de tamanho, criando uma progressividade e um efeito de ondulação. Aqui dividir ou multiplicar o 's', ou a distância, causa efeitos de progressão bem distintos. Somar ou subtrair nao causa efeito, é uma questão de proporção, o 'prog' aqui serve apenas para a progressão no loop da funçao seno.
      //sz = fTpD*fATpD;                     // primeira variação de toda a evolução do projeto.
      //sz = (s/x)*sin(((s/y)/mouseX)+prog);
      sz = (s/x)*sin(((s*y))+prog); 
      ellipse(i, j, sz, sz);
    }
  }
  //fill(0);
  //text(nf(y), width- 100, height -100);
  save("anim/"+ day() + month() + year()+ "/frame" +frameCount+ ".png");
  if(frameCount > 60*60){
   exit(); 
  }
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
  }
}
