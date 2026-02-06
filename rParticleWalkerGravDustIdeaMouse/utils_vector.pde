
void setLength(PVector x, float mg){
 float mag, angle, xr, yr;
 
 
 
 angle = getAngle(x);
 xr = cos(angle)*mg;
 yr = sin(angle)*mg;
 //println(angle);
}


float getMag(PVector x){
  float mag;
  
  return mag = sqrt(x.x*x.x*x.y+x.y);
}


float getAngle(PVector x){
  float angle;
  return angle = atan2(x.y, x.x);
}


void setAngle(PVector x, float a){
      float mag;
      mag = getMag(x);
      x.x = cos(a)*mag;
      x.y = sin(a)*mag;
    }
    
