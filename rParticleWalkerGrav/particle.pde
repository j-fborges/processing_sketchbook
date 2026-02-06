class Particle {
      PVector pos, vel, acc;
      float mass;
      
    
    void init(){
      pos = new PVector(random(0, width), random(height));
      vel = new PVector(0,0);
      acc = new PVector(0,0);
      
    }
    void walk(){
      acc = acc.set(random(-5,5), random(-5,5));
     vel =  vel.add(acc);
     vel = vel.mult(0.5);
     pos = pos.add(vel);
     if(pos.x < 0-width/2){pos.x=width+ width/2;}
     if(pos.x > width+ width/2){ pos.x = 0 -width/2;}
     if(pos.y < 0-height/2){pos.y=height+height/2;}
     if(pos.y > height+height/2){ pos.y = 0-height/2;}
    }
}
