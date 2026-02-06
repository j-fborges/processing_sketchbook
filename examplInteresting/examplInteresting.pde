Circles c;

void setup(){
 size(1000,700); 
    c=new Circles();
    frameRate(30.0);
}

void draw(){
 background(#8700C1); 
 background(255);
translate(300,300);
smooth();
  c.display();
 
}
ArrayList <PVector> circle;
ArrayList <PVector> b;

class Circles{

  Circles(){
    
      circle = new ArrayList <PVector>();
      b = new ArrayList <PVector>();

      
      for(int i=0; i<150;i++){

      circle.add(new PVector(random(-20,30), random(-20,30)));
      b.add(new PVector(random(10,20),10));
                             }
           }
           
           
  void display(){
  
      for(int i=1; i<50;i++){
          
          PVector a= circle.get(i-1);
          PVector c= b.get(i);

             //fill(7, 0, 153);
             //stroke(#A1EAF5);ocean theme
  
             fill(255);
             stroke(0); //illusion theme
   
             strokeWeight(i/5);
          rotate(frameCount/(10*i*i*1.0));
          ellipse(0,0,5+frameCount*map(mouseX,0,600,0,10)/i,5+frameCount*map(mouseY,0,600,0,10)/i);
    
              fill(0);
        //ellipse(0,0,5+frameCount*20/49,5+frameCount*19/49); uncomment if you want a black center
  }
  }
}
