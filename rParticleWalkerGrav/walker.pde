class Walker{
  PVector pos, vel, acc, grav;
  float rxprop, ryprop;
  float rxrate, ryrate;
  int ratedirx, ratediry;
  float rx, ry;
  float dist;
  void init(){
    pos = new PVector(random(width), random(height));
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    rxrate = random(-1, 1);
    ryrate = random(-1, 1);
  }
  
  void display(){
   ellipse(pos.x, pos.y, 10, 10); 
  }
  
  void update(){
    rx = random(0,100);
    ry = random(0,100);
    if(rx> 50){ ratedirx = -1;} else {ratedirx =1;}
    if(ry> 50){ ratedirx = -1;} else {ratediry =1;}
    rxrate += ratedirx* .005;
    ryrate += ratediry* .005;
   rxprop+= rxrate;
   ryprop+= ryrate;
   pos.x = lerp(p1.pos.x, p2.pos.x, cos(rxprop)); 
   pos.y = lerp(p1.pos.y, p2.pos.y, sin(ryprop)); 
   //println( pos.x+"  "+ pos.y);
  }
  
  void gravitateTo(){
    grav = new PVector(0,0);
    dist = pos.dist(p1.pos);
    
    grav = grav.setMag(p1.mass/dist*dist));
    grav = grav.setAngle(
  }
    
    
  
}
