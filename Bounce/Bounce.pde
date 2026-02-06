// Ball Bounces Off Angles
// Adapted from Keith Peters' Algorithm 
// from his book Foundation HTML5 Animation with JavaScript.




PShape l;
GSeg [] ground;
int segs = 1;
float [] peakHeights;




// center, rotation and length of inclined segment.
float gx, gy, rot, len;

PVector grav, acc;

Ball b;

void setup(){
  size(1000,1000);
  //frameRate(3);
  grav = new PVector(0,.5);
  acc = new PVector(0,0);
  ground = new GSeg [segs];
  peakHeights = new float [segs+1];
  //initialize variables.
  
  b = new Ball();
  
  b.posx = random(width);
  b.posy = random(height);
  b.radius = random(40);
  
  b.velx = random(-2,2);
  b.vely = random(-2,2);
  l = createShape();
 
  for(int i = 0; i < segs+1; i++){
    peakHeights[i]= random(800,900);
  }
  
  
  for(int i = 0; i < segs; i++){
    
    //if(i!=segs-1){
    ground[i] = new GSeg((width/segs)*i, peakHeights[i], (width/segs)*(i+1), peakHeights[i+1]);
    //} else { ground[i] = new GSeg((width/segs)*i, peakHeights[i], (width/segs)*(i), peakHeights[i+1]);
   // }
  }
  
  l.beginShape();
  l.fill(255,0,0);
  for(int i = 0; i< segs; i++){
   b.checkInclineCollision(ground[i]);
   l.vertex(ground[i].x1, ground[i].y1);
   l.vertex(ground[i].x2, ground[i].y2);
  }
  l.vertex(ground[segs-1].x2, height);
  l.vertex(ground[0].x1, height);
  l.endShape(CLOSE);
}
  
void draw(){
  background(255);
  // fill and draw triangle(inclined ramp): (0,400), (width,height), (0, height)
  // use fill(r,g,b) and triangle(x1,y1,x2,y2,x3,y3)
  ground[0].rot = ((width / 2 - mouseX) * 0.1) * PI / 180;
  
  for(int i = 0; i< segs; i++){
    //line(ground[i].x1, ground[i].y1,ground[i].x2, ground[i].y2);
    ground[i].updt();
  }
  
  //shape(l,0,0);

  
  b.updt();
  b.checkWallsCollision();  
  for(int j = 0; j < segs; j++){
    ground[j].getBounds();
    //if(bIntersects(ground[j].boundBox, b)){
      for(int i = 0; i< segs; i++){
       b.checkInclineCollision(ground[i]);
      }
   // }
  }
  
  
println("ok");   //<>//
}









class GSeg{
  float x1, y1;
  float x2, y2;
  float x, y;
  float len, rot;
  float lnWidth,lnHeight;
  
  BndBox boundBox;
  
  GSeg(float x1_, float y1_, float x2_, float y2_){
    x1 = x1_;
    y1 = y1_;
    x2 = x2_;
    y2 = y2_;
    
    len = dist(x1,y1, x2,y2);
    
    
    
    rot = atan2(y2 - y1, x2-x1);
    
    //x = lerp(x1, x2, .5);
    x= (x1+x2)/2;
    //y = lerp(y1, y2, .5);
    y= (y1+y2)/2;
    //getBounds();
    
    boundBox = new BndBox();
  }
  
  void getBounds() {
    if (rot == 0) {
    float minX = min(this.x1, this.x2),
    minY = min(this.y1, this.y2),
    maxX = max(this.x1, this.x2),
    maxY = max(this.y1, this.y2);
    
    boundBox.x = x + minX;
    boundBox.y = y + minY;
    boundBox.wdth = maxX - minX;
    boundBox.hght = maxY - minY;
    
        } else {
        float sin = sin(rot);
        float cos = cos(rot),
        x1r = cos * x1 + sin * y1,
        x2r = cos * x2 + sin * y2,
        y1r = cos * y1 + sin * x1,
        y2r = cos * y2 + sin * x2;
        
        boundBox.x = x + min(x1r, x2r);
        boundBox.y = y + min(y1r, y2r);
        boundBox.wdth = max(x1r, x2r) - min(x1r, x2r);
        boundBox.hght = max(y1r, y2r) - min(y1r, y2r);
        }
    }
    
    
    void updt(){
      pushMatrix();
      translate(x,y);
      rotate(rot);
      line(-len/2, 0, len/2, 0);
      popMatrix();
    }
}

class BndBox {
  float x, y, wdth, hght;
  
}

boolean intersects( BndBox rectA, BndBox rectB) {
 
return !(rectA.x + rectA.wdth < rectB.x ||
rectB.x + rectB.wdth < rectA.x ||
rectA.y + rectA.hght < rectB.y ||
rectB.y + rectB.hght < rectA.y);
}

boolean bIntersects( BndBox rectA, Ball b_){
  boolean isIt;
  float midRectX = (rectA.x + rectA.wdth)/2, midRectY = (rectA.y + rectA.hght)/2;
  float a = atan2(b_.posy - midRectY, b_.posx - midRectX);
  if((rectA.x + rectA.wdth) < b_.posx - cos(a) || b_.posx + cos(a) < rectA.x || rectA.y + rectA.hght < b_.posy - sin(a) || b_.posy + sin(a) < rectA.y){
  isIt = true;
} else {
 isIt = false; 
}
return isIt;
}

class Ball{
  float posx, posy;
  float radius;
  float velx, vely, gravy = 0.2;
  
  BndBox boundBox;
  
  void getBounds() {
    
    float minX = min(posx-radius, posx+radius),
    minY = min(posy-radius, posy+radius),
    maxX = max(posx-radius, posx+radius),
    maxY = max(posy-radius, posy+radius);
    
    boundBox.x = posx + minX;
    boundBox.y = posy + minY;
    boundBox.wdth = maxX - minX;
    boundBox.hght = maxY - minY;
    
    }
  
 
  void checkInclineCollision(GSeg g){
    // check incline collision and reverse direction
    // use coordinate rotation trick, see lecture video for more details. 
    
    // (dx, dy) is relative position of ball with respect to (gx,gy)
    float dx = posx - g.x;
    float dy = posy - g.y;
    
    
    // compute cosine, sine of rot angle, use Processing's cos() and sin().
    float cosine = cos(g.rot);
    float sine = sin(g.rot);
    
    
    // rotate (dx,dy) to new coordinate (dx_,dy_)
    // rotate (velx, vely) to (velx_,vely_)
    // see lecture video for the formulas
    // use rotation matrix 
    float dx_ = cosine * dx + sine * dy;
    float dy_ = - sine * dx + cosine * dy;
    float velx_ = cosine * velx + sine * vely;
    float vely_ = - sine * velx + cosine * vely;
    float posx_ = cosine * posx + sine * posy;
    float posy_ = -sine * posx + cosine * posy;
    // once rotated, it is easy to see when to bounce
    // and how to bounce(negate vertical velocity in rotated coordinate)
    // remember to realign dy_ before bouncing
    if (dy_ > -radius/2) { //no video se coloca dy_ > -radius
    //if(dy_ > 0){ posy -= dy;}
      //posy -= radius/200;
      //posy = posy + dy_;
      posy += dy_/200;
      vely_*= -.8;
      //posx = cosine * posx_ - sine * posy_;
      //posy = + sine * posx_ - cosine * posy_;
    }
    
    // rotate everything back to restore the original 
    // coordinate axis.
    dx = cosine * dx_ - sine * dy_;
    dy = sine * dx_ + cosine * dy_;
    velx = cosine * velx_ - sine * vely_;
    vely = sine * velx_ + cosine * vely_;
    
    // update posx and posy
    
    
    posx += velx;
    posy += vely;
  }

  void checkWallsCollision(){
    // check if posx passes right wall
    // realign posx to right wall and change direction
    if(posx > width - radius){
      posx = width - radius;
      velx = -.9*velx;
    }
     
    // check if posx passes left wall
    // realign posx to left wall and change direction
    if(posx < radius){
      posx = radius;
      velx = -.9*velx;
    }
      
  
    
    // check if posy passes top wall
    // realign posy to top wall and change direction
    // fill in your code below
    if(posy < radius){
      posy = radius;
      vely *= -.9;
  
    }
    
  }
  
  void updt(){
  // move ball (optionally add GRAVITY)
  // add velocity to position
  acc.set(0,0);
  //acc.add(grav);
  //velx += acc.x;
  //vely += acc.y;
  vely += gravy;
  posx += velx;
  posy += vely;
  
  fill(0);
  ellipse(posx, posy, radius, radius);
  
}

}
