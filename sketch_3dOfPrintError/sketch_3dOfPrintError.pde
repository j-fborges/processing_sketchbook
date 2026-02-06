float a, b, c,s;
float x,y,z, w;
String year = nf(year()), month = nf(month()), day = nf(day()), hour = nf(hour()), minute = nf(minute()), second = nf(second());

PGraphics print;
int pW,pH;
float tC = 7;

void setup(){
  size(1920, 1080, P3D);
  pW = round(width * tC);
  pH = round(height * tC);
  print = createGraphics(pW,pH, P3D);
  //fullScreen(P3D);
  //noFill();
  noStroke();
  print.noStroke();
  //stroke(255);
  //fill(255,255,255,50);
  //perspective(PI,float(width)/float(height), 1000, 1000 );
  
  
}

void draw(){
  a+= .01;
  b+= .00001;
  c += .001;
  s += .01;
//background(0);
//lights();
print.beginDraw();
if(mousePressed && mouseButton == RIGHT) {stroke(255); strokeWeight(.5); print.stroke(255); print.strokeWeight(.5);}else {noStroke(); print.noStroke(); }
if(mousePressed && mouseButton == LEFT){ x = random(50, 750); y = random(50, 750); z =random(50, 750); w=200;}
if(w>1)w=w*.99;
pointLight(255,255,255,x,y,z);
print.pointLight(255,255,255,x*tC,y*tC,z*tC);
//shininess(50*sin(s));
spotLight(200*sin(c), 30, 70, 0,0,-100, 150,150,0, PI, 0);
print.spotLight(200*sin(c), 30, 70, 0,0,-100*tC, 150*tC,150*tC,0, PI, 0);
camera(400 + map(mouseX, 0, width, -3000, 3000), 400 + map(mouseY, 0, height, -3000, 3000), - 1200, 400, 400, 0.0, 
       0.0, 1, 0.0);
       
       print.camera(400*tC + map(mouseX*tC, 0, width*tC, -3000*tC, 3000*tC), 400*tC + map(mouseY*tC, 0, height*tC, -3000*tC, 3000*tC), - 1200*tC, 400*tC, 400*tC, 0.0, 
       0.0, 1, 0.0);
       //perspective(PI/3.0, width/height, ((height/2.0) / tan(PI*60.0/360.0))/10.0, ((height/2.0) / tan(PI*60.0/360.0))*10.0);
       
       for(float i = 0; i < 800; i += 40+w){
         for(float j = 0; j < 800; j += 40+w){
           for(float k = 0; k < 800; k += 40+w){
             
           //pushMatrix();
  translate(i, j, k);
  rotateX(b);
  //rotateY(PI/3);
  box(30*sin(dist(i,j,k,500,500, 500)+a));
  //sphere(30*sin(dist(i,j,k,500,500, 500)+a));
  translate(-i,-j,-k);
  //popMatrix();
  
  print.translate(i*tC, j*tC, k*tC);
  print.rotateX(b);
  //rotateY(PI/3);
  print.box(tC*30*sin(dist(i*tC,j*tC,k*tC,500*tC,500*tC, 500*tC)+a));
  //sphere(30*sin(dist(i,j,k,500,500, 500)+a));
  print.translate(-i*tC,-j*tC,-k*tC);
  //popMatrix();
  

  
           }
         }
       }
       print.endDraw();
       println("ok");
       save("data/frames/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
       if(keyPressed){
       print.save("data/still/"+ year + month + day + hour + minute + second+ "/" + year + month + day + hour + minute + "3dSpiral"+frameCount+".jpg");
       }
       if(frameCount >= 60*60){
        exit(); 
       }
}
