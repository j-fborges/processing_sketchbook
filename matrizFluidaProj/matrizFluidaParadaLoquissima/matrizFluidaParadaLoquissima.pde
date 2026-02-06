float a,
s,
b,
c,
d,
t,
k,
l;




void setup(){
  size(1000,500);
  noStroke();
  //noFill();
}

void draw(){
  a += .07; 
  //b += .01;
  c += .01;
  b += sin(mouseY*0.01);
  //d += .005;
  //s = mouseX;
  //background(255);
  for(float i = 0; i <= width + 0; i+= abs(map(((40*sin(d))), 0, 40, 20, 100))){
    k+= 0;
    //l+= .005;
    for(float j =  (sin(k)*50); j <= height + (sin(k)*50); j += 7){
      l+= .0001;
      
      s = dist(width/2, height/2, i, j);
      t = map(s, 0, width/2, 0, mouseX);
      //fill(map(s*sin(s+b), 0, width/3, 0, 255));
      fill(map(((s/10)+(sin(b)*20))*sin((s/5)+a), 0, width/10, 255, 0));
      //ellipse(i, j, ((s/10)+(sin(s+b)*40))*sin((s/5)+a), ((s/10)+(sin(s+b)*40))*sin((s/5)+a));
      ellipse(i+(sin(l)*(j*.1)), j, ((s/20)+(sin(b+t)*40))*sin((s/5)+a)+(sin(l)*(j*.1)), ((s/20)+(sin(b+t)*40))*sin((s/5)+a)+(sin(l)*(j*.1)));
    }
  }
}
