class Particle {
      PVector pos, vel, acc, grav;
      float mass, sz;
    
    void init(float x, float y){
      pos = new PVector(x, y);
      vel = new PVector(0,0);
      acc = new PVector(0,0);
      grav = new PVector(0,0);
    }
    void walk(){
      acc = acc.set(random(-5,5), random(-5,5));
     vel =  vel.add(acc);
     //vel = vel.mult(0.5);
     pos = pos.add(vel);
     if(pos.x < 0-width/2){pos.x=width+ width/2;}
     if(pos.x > width+ width/2){ pos.x = 0 -width/2;}
     if(pos.y < 0-height/2){pos.y=height+height/2;}
     if(pos.y > height+height/2){ pos.y = 0-height/2;}
    }
    void update(){
     vel = vel.add(acc);
     vel = vel.mult(.99);
     pos = pos.add(vel);
    }
    void display(){
     ellipse(pos.x, pos.y, dist(pos.x, pos.y, width/2, height/2)/8, dist(pos.x, pos.y, width/2, height/2)/8); 
    }
    
    void gravitateTo(Particle x){
    float g;
    float dist;
    float mag;
    dist = pos.dist(x.pos);
    mag = (x.mass/(dist*dist));
    //grav.setMag(mag);
    setLength(grav, mag);
    //println();
    g = PVector.angleBetween(pos, x.pos);
    setAngle(grav,g);
    
    vel = vel.add(grav);
    
  }
  
  void gravitateTo2(Particle x){
    float g;
    float dist;
    float mag;
    float angleTo;
     angleTo = atan2(x.pos.y - pos.y, x.pos.x - pos.x);
    
    
    dist = pos.dist(x.pos);
    mag = (x.mass/(dist*dist));
    
    grav.x = cos(angleTo)*mag;
    grav.y = sin(angleTo)*mag;
    
    
    vel = vel.add(grav);
    
  }
}
