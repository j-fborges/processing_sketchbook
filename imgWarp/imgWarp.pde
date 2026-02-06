import processing.opengl.*;

int gap;
int num_lines;
float z_value;
PImage img;
float value;
color[] myarr;
boolean dosave=true;


void setup(){
size(1000, 800, OPENGL);
background(0);
strokeWeight(0.2);

noLoop();

gap = 8;
z_value = 50;
num_lines = floor(height/gap);


PImage img = loadImage("image.jpg");// black and white image with a blur for  smooth warping lines
image(img,0,0);
loadPixels();

myarr= new color[pixels.length];

for (int i=0; i <(width*height) -1; i++){
float brg = brightness(pixels[i]);
myarr[i] = abs ((int) brg);
}
}

void draw(){
background(0);
stroke(255);
strokeWeight(1);
fill(0);
smooth();
pushMatrix();

translate(width/2, height/2);

rotateX(PI/6);
rotateZ(0);

scale(1);
translate(-width/2,-height/2);

for (int i=0; i < num_lines; i++){
beginShape();
for ( int j=0; j < width; j++){ // x resolution

value = map (myarr[i*gap*width+j],0, 255, 0, z_value);
vertex(j, i*gap, value);

}
endShape();

}

popMatrix();
save("image.tif");

if(dosave) {
endRaw();
dosave=false;
}

}
