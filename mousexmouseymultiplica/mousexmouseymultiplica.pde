//  Vmos aqui:
//  - definindo funcoes;
//  - valor de retorno de funcoes
//  - retangulos com tamanho e posicao modificados em funcao do mouse

//  void -> tipo da funcao. Aqui void significa que a funcao nao vai 
//retornar nenhum valor quando terminar de ser executada 

boolean limpaATela = false;
float i;

void setup()  //  setup eh uma funcao nativa do Processing
{
 size(400,400);
 background(255);
 
 //  vamos imprimir na tela o valor retornado por esta chamada da funcao multiplica(..)
 println(multiplica(2,6.1));
 println(mouseX, mouseY);
  
}


void draw()  //  draw eh uma funcao nativa do Processing
{
  
  if(limpaATela == true) {
    fill(0, i); //?duvida? porque só escurece até certo ponto?
    rect(0,0,400,400); //background sobre void draw() para renovar sempre
  }
  fill(255);
  rect (mouseX,mouseY,55,55);
 rect (200,200, mouseX,mouseY);
}

//  Esta funcao eh nossa, nao eh nativa do Processing. A estamos criando neste momento
float multiplica(float a, float b) {
  return a*b;
}


void keyPressed() {
    save("line.jpg");
     save ("square"+year()+month()+day()+minute()+second()+".jpg");
  println("save");
  }


//  Essa funcao eh nativa do Processing. Vai ser executada enquanto 
// o mouse estiver pressionado
void mousePressed() {
  limpaATela = true;
  i= i+1;
}
void mouseReleased(){
 limpaATela = false; 
}