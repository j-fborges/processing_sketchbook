// usar % ou dividir o x do/ou (100 + x) para efeitos loucos
  
  size(600,600);
  background(255);





    int h=0;
  h++;
  
  
noStroke();
smooth();
for (int y = -10; y <= 700; y += 60) {
for (int x = -50; x <= 700; x += 60) {

fill(0, 76);
ellipse(x + y%1.37, y + 10*(x%8), (100 + x), 80); // AQUI


}
}