



void setup(){
size (1920,1080);
background (255);}

void draw(){

  
int x = int(random(400));
int y = int(random(400));
int larg = int(random(400));
int alt = int(random(400));

int q = int(random(400));
int w = int(random(400));
int z = int(random(400));
int k = int(random(400));


noStroke();

  //fill(0);
//ellipse(x,x,x,x);
      // fill(125); 
       // ellipse(x,y,y,x);
        
        
 fill(q,w,z,k);
  ellipse(x, y, larg, alt);
  fill(w,q,z,k);
    ellipse(y,x , larg, alt);
    fill(k,z,w,q);
      ellipse(alt,y, larg,x );
      fill(w,k,z,q);
        ellipse(larg, alt,x,y);
        
}