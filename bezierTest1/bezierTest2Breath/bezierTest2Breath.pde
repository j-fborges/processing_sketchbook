PShape f;
float v1x = random(200,800), v1y = random(200,800), v2x = random(200,800), v2y = random(200,800), v0x, v0y;
float x01, y01, x12, y12, x20, y20;
float p, h;
int vn = 9, mn = 30;
PVector vs[] = new PVector[vn], mp [] = new PVector[vn], fmp [] = new PVector[vn];
float as[] = new float[vn], s[] = new float[vn] , sg [] = new float[vn];
float r = 100;
void setup(){
  size(1000,1000, P2D);
  
  vn = round(random(1, mn));
  
  vs = new PVector[vn];
  mp  = new PVector[vn];
  fmp  = new PVector[vn];
  as = new float[vn];
  
  for(int i = 0; i < vn; i++){
   vs[i] = new PVector(random(-r, r), random(-r, r)); 
  }
  
  for(int i = 0; i < vn; i++){
    if (i<vn-1){
   mp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
   fmp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
    } else { 
      mp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
      fmp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
    }
  }
  
  for(int i = 0; i < vn; i++){
   as[i]= atan2(mp[i].y, mp[i].x);
  }
  
  
  f = createShape();
}

void draw(){
  //background(200);
  h += .01;
  p = sin(h);
  //noFill();
  pushMatrix();
  translate(mouseX, mouseY);
  bezierDetail(20);
  for(int i = 0; i < vn; i++){
    vs[i].x += random(-1,1);
    vs[i].y += random(-1,1);
    
  }
  
  for(int i = 0; i < vn; i++){
    if (i<vn-1){
   mp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
   fmp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
    } else { 
      mp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
      fmp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
    }
  }
  
  for(int i = 0; i < vn; i++){
    as[i]= atan2(mp[i].y, mp[i].x);
   fmp[i].x = mp[i].x + (cos(as[i])*p*(r/5));
   fmp[i].y = mp[i].y + (sin(as[i])*p*(r/5));
  }
  
  
  f = createShape();
  f.beginShape();
  f.vertex(vs[0].x, vs[0].y);
  
  for(int i = 0; i < vn; i++){
     if (i<vn-1){
       f.bezierVertex(fmp[i].x, fmp[i].y,fmp[i].x, fmp[i].y, vs[i+1].x, vs[i+1].y);
     } else {
       f.bezierVertex(fmp[i].x, fmp[i].y,fmp[i].x, fmp[i].y, vs[0].x, vs[0].y);
     }
  }
  
  
  /*
  
  
  f.bezierVertex(lerp(mouseX, v1x,p) ,lerp(mouseY, v1y, p), lerp(v1x, v2x,p), lerp(v1y, v2y, p), v1x, v1y);
  f.bezierVertex(lerp(v1x, v2x,p), lerp(v1y, v2y, p), lerp(v2x, mouseX,p), lerp(v2y,mouseY,p), v2x, v2y);
  f.bezierVertex(lerp(v2x, mouseX,p), lerp(v2y, mouseY, p), lerp(mouseX, v1x, p), lerp(mouseY, v1y, p), mouseX,mouseY);
  
  */
  f.endShape();
  
  shape(f);
  popMatrix();
  
}

void keyPressed(){
   vn = round(random(1, mn));
  
  vs = new PVector[vn];
  mp  = new PVector[vn];
  fmp  = new PVector[vn];
  as = new float[vn];
  
  for(int i = 0; i < vn; i++){
   vs[i] = new PVector(random(-r, r), random(-r, r)); 
  }
  
  for(int i = 0; i < vn; i++){
    if (i<vn-1){
   mp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
   fmp[i] = new PVector((vs[i].x + vs[i+1].x)/2, (vs[i].y + vs[i+1].y)/2);
    } else { 
      mp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
      fmp[i] = new PVector((vs[i].x + vs[0].x)/2, (vs[i].y + vs[0].y)/2);
    }
  }
  
  for(int i = 0; i < vn; i++){
   as[i]= atan2(mp[i].y, mp[i].x);
  }
  }
