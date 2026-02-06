



void setup(){
size (1920,1080);
background (255);}

void draw(){

  
int x = int(random(400));
int y = int(random(400));
int larg = int(random(400));
int alt = int(random(400));

  fill(0);
        ellipse(x,x,x,x);
       fill(125); 
        ellipse(x,y,x,y);
        
        
 fill(255);
  ellipse(x, y, larg, alt);
    ellipse(y,x , larg, alt);
      ellipse(alt,y, larg,x );
     
        ellipse(larg, alt,x,y);
        fill(0);
        ellipse(x,x,x,x);
}