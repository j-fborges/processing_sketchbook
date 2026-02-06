import processing.video.*;
Movie movie; 
float a,
s,
b,
c,
d,
t,
k,
l;

int cc, fR = 60, vD = 60;
PGraphics vid;

void setup(){
  size(1920,1080);
  movie = new Movie(this, "testmovie.mov");
  movie.loop();
  vid = createGraphics(width, height);
  frameRate(fR);
  vid.beginDraw();
  vid.noStroke();
  //noFill();
}

void draw(){
  vid.beginDraw();
  vid.clear();
  a += .01; 
  //b += .01;
  c += .01;
  b += sin(mouseY*0.01);
  //d += .005;
  //s = mouseX;
  //background(255);
  for(float i = 0; i <= width + 0; i+= abs(map(((40*sin(d))), 0, 40, 2, 100))){
    k+= 0;
    //l+= .005;
    for(float j =  0; j <= height; j += 2){
      l+= .00001;
      
      s = dist(width/2, height/2, i, j);
      t = map(s, 0, width/2, 0, mouseX);
      //fill(map(s*sin(s+b), 0, width/3, 0, 255));
      vid.fill(map(((s/10)+(sin(b)*20))*sin((s/5)+a), 0, width/10, 255, 0), map(((s/10)+(sin(b)*20))*sin((s/5)+a), 0, width/10, 0, 100));
      //ellipse(i, j, ((s/10)+(sin(s+b)*40))*sin((s/5)+a), ((s/10)+(sin(s+b)*40))*sin((s/5)+a));
      vid.ellipse(i+(sin(l)*(j*.1)), j, ((s/20)+(sin(b+t)*40))*sin((s/5)+a)+(sin(l)*(j*.1)), ((s/20)+(sin(b+t)*40))*sin((s/5)+a)+(sin(l)*(j*.1)));
    }
  }
  vid.endDraw();
  if(cc<= fR*vD){
  vid.save("img/anim0/frame" + cc+ ".png");
  } else {
   println("ok"); 
   exit();
  }
  cc+=1;
}
