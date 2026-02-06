/*
Autorship: João PFB. 30/04/2019.

*/

float a, // variável que aumenta conforme passa o tempo, criando a animação.
sz, //tamanho da célula.
fTpD, //fator tamanho em relação a distância.
fATpD, //fator acrescimo de tamanho em relação a distância. 
s; // distância de um ponto até a posição de cada célula da matriz, criando toda a concentricidade, USADA AQUI NO MOUSE.

void setup(){
  size(1000,500);
  
  //noFill();
}

void draw(){
  a += .07; 
  //s = mouseX;
  //background(255);
  for(int i = 0; i <= width; i+= 20){
    //fill(
    for(int j = 0; j <= height; j += 20){
      
      //fill(random(255));
      s = dist(mouseX, mouseY, i, j);
      //fTpD = (s/10);                       // define um tamnho inicial para célula. Aqui definido pela distância da posição da célula em relação a posição do mouse. 
      //fATpD = sin((s/5)+a);                // define um acrescimo para o tamanho da célula em relação a uma variavel crescente, formando a animação em loop usando a função seno. Aqui utilizada a variável 'a'. A variável 's' presente fornece um ponto diferente de partida no loop de acrescimos de tamanho, criando uma progressividade e um efeito de ondulação.
      //sz = fTpD*fATpD;                     // primeira variação de toda a evolução do projeto.
      sz = (s/10)*sin((s/5)+a); 
      ellipse(i, j, sz, sz);
    }
  }
}
