Ball[] balls = new Ball[0];
Ball Nball;
int bN = 8;
int [] [] collisions = new int[0][2];
int [] nCol = new int [2];
int [] [] avCols = new int[0][2];
Col[] cols = new Col[0];
Col nColision;

void setup() {
  size(640, 360);
  
  for(int i = 0; i < bN; i++){
    Ball Nball = new Ball(random(width), random(height), random(40), i);
    balls = (Ball[]) append(balls, Nball);
    
  }
  collisions = new int[0][2];
  for(int i = 0; i < balls.length; i++){
   for(int j = 0; j < balls.length; j++){
     if(i != j && isThere(i,j) == false){
       balls[i].collisionCheck(balls[j]);
     }
   }
  }
  if(collisions.length > 0){
    for(int i=0; i<collisions.length; i++){
       balls[collisions[i][0]].collisionSolve(balls[collisions[i][1]]);
    }
  }
}

void draw() {
  background(51);



  for(int i = 0; i < balls.length; i++){
    
    if(mousePressed){
      balls[i].sRad = 2;
    }
    balls[i].update();
    balls[i].checkBoundaryCollision();
    
    
    
    balls[i].display();
  }
  collisions = new int[0][2];
  for(int i = 0; i < balls.length; i++){
   for(int j = 0; j < balls.length; j++){
     if(i != j && isThere(i,j) == false){
       balls[i].collisionCheck(balls[j]);
     }
   }
  }
  if(collisions.length > 0){
    for(int i=0; i<collisions.length; i++){
       balls[collisions[i][0]].collisionSolve(balls[collisions[i][1]]);
    }
  }
  
}

class Ball {
  PVector position;
  PVector velocity;
  PVector gPwr;
  int ind;
  float radius, sRad, fRad, m;
  boolean g = false;
  

  Ball(float x, float y, float r_, int i_) {
    position = new PVector(x, y);
    velocity = PVector.random2D();
    velocity.mult(3);
    gPwr = new PVector(0,0);
    radius = r_;
    m = radius*.1;
    sRad = 1;
    fRad = radius*sRad;
    ind = i_;
  }

  void update() {
    position.add(velocity);
    if(sRad == 2){ g = true; } else { g= false;}
    fRad = radius*sRad;
    sRad = lerp(sRad, 1, .05);
    
    //gPwr = velocity.normalize().mult(map(sRad, 2,1.9, radius/2, 0));
  }

  void checkBoundaryCollision() {
    if (position.x > width-fRad) {
      position.x = width-fRad;
      velocity.x *= -1;
      if(g){ velocity.x *= (radius/2)/12;}
    } else if (position.x < fRad) {
      position.x = fRad;
      velocity.x *= -1;
      if(g){ velocity.x *= (radius/2)/12;}
    } else if (position.y > height-fRad) {
      position.y = height-fRad;
      velocity.y *= -1;
      if(g){ velocity.y *= (radius/2)/12;}
    } else if (position.y < fRad) {
      position.y = fRad;
      velocity.y *= -1;
      if(g){ velocity.y *= (radius/2)/12;}
    }
  }
  
  void collisionCheck(Ball other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.position, position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = fRad + other.fRad;

    if (distanceVectMag < minDistance) {
      int [] nCol = new int [2];
      nCol[0] = min(ind, other.ind);
      nCol[1] = max(ind, other.ind);
      collisions = (int[][]) append(collisions, nCol);
    }
  }

  void collisionSolve(Ball other) {

    // Get distances between the balls components
    PVector distanceVect = PVector.sub(other.position, position);

    // Calculate magnitude of the vector separating the balls
    float distanceVectMag = distanceVect.mag();

    // Minimum distance before they are touching
    float minDistance = fRad + other.fRad;

    if (distanceVectMag < minDistance) {
      
      
      float distanceCorrection = (minDistance-distanceVectMag)/2;
      PVector d = distanceVect.copy();
      PVector correctionVector = d.normalize().mult(distanceCorrection);
      other.position.add(correctionVector); //<>//
      position.sub(correctionVector);
      
      

      // get angle of distanceVect
      float theta  = distanceVect.heading();
      // precalculate trig values
      float sine = sin(theta);
      float cosine = cos(theta);

      /* bTemp will hold rotated ball positions. You 
       just need to worry about bTemp[1] position*/
      PVector[] bTemp = {
        new PVector(), new PVector()
      };

      /* this ball's position is relative to the other
       so you can use the vector between them (bVect) as the 
       reference point in the rotation expressions.
       bTemp[0].position.x and bTemp[0].position.y will initialize
       automatically to 0.0, which is what you want
       since b[1] will rotate around b[0] */
      bTemp[1].x  = cosine * distanceVect.x + sine * distanceVect.y;
      bTemp[1].y  = cosine * distanceVect.y - sine * distanceVect.x;

      // rotate Temporary velocities
      PVector[] vTemp = {
        new PVector(), new PVector()
      };

      vTemp[0].x  = cosine * velocity.x + sine * velocity.y;
      vTemp[0].y  = cosine * velocity.y - sine * velocity.x;
      vTemp[1].x  = cosine * other.velocity.x + sine * other.velocity.y;
      vTemp[1].y  = cosine * other.velocity.y - sine * other.velocity.x;

      /* Now that velocities are rotated, you can use 1D
       conservation of momentum equations to calculate 
       the final velocity along the x-axis. */
      PVector[] vFinal = {  
        new PVector(), new PVector()
      };

      // final rotated velocity for b[0]
      vFinal[0].x = ((m - other.m) * vTemp[0].x + 2 * other.m * vTemp[1].x) / (m + other.m);
      vFinal[0].y = vTemp[0].y;

      // final rotated velocity for b[0]
      vFinal[1].x = ((other.m - m) * vTemp[1].x + 2 * m * vTemp[0].x) / (m + other.m);
      vFinal[1].y = vTemp[1].y;

      // hack to avoid clumping
      bTemp[0].x += (vFinal[0].x*3);
      bTemp[1].x += (vFinal[1].x*3);

      /* Rotate ball positions and velocities back
       Reverse signs in trig expressions to rotate 
       in the opposite direction */
      // rotate balls
      PVector[] bFinal = { 
        new PVector(), new PVector()
      };

      bFinal[0].x = cosine * bTemp[0].x - sine * bTemp[0].y;
      bFinal[0].y = cosine * bTemp[0].y + sine * bTemp[0].x;
      bFinal[1].x = cosine * bTemp[1].x - sine * bTemp[1].y;
      bFinal[1].y = cosine * bTemp[1].y + sine * bTemp[1].x;

      // update balls to screen position
      other.position.x = position.x + bFinal[1].x;
      other.position.y = position.y + bFinal[1].y;

      position.add(bFinal[0]);

      // update velocities
      velocity.x = cosine * vFinal[0].x - sine * vFinal[0].y;
      velocity.y = cosine * vFinal[0].y + sine * vFinal[0].x;
      other.velocity.x = cosine * vFinal[1].x - sine * vFinal[1].y;
      other.velocity.y = cosine * vFinal[1].y + sine * vFinal[1].x;
    }
  }

  void display() {
    noStroke();
    fill(204);
    ellipse(position.x, position.y, fRad*2, fRad*2);
  }
}

class Col{
  int components [] = new int[2];
  boolean checked = false;
  
  Col(int i_, int j_){
    components[0] = i_;
    components[1] = j_;
  }
}

/*boolean checkRecurrent(int [] arr, int n){
  int counter = 0;
  for(int i = 0; i < arr.length; i++){
   if(arr[i] == n){
    counter += 1;
   }
  }
  if(counter == 0) { return false; }
  if(counter == 1) { return true; }
  if(counter > 1) { return true; println("tooRecurrent"); }
}
*/


/*
boolean recurrentElements(int [] arr_, int [] arr2){
  if(arr_.length == arr2.length){
    int counter = 0;
    for(int i = 0; i < arr_.length; i++){
      for(int j = 0; j < arr_.length; j++){
       if(arr_[i] == arr2[j]){
        counter += 1;
       }
      }
    }
    if(counter == arr_.length ) { return true; }
  }
  
}
*/

boolean isThere(int i_, int j_){
  boolean is = false;
  int [] arr_ = {min(i_, j_), max(i_,j_)};
  for(int i = 0; i < collisions.length; i++){
    if(arr_.equals(collisions[i])){
      is = true;
    }
  }
  return is;
}
