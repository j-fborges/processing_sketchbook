class Star{
  //PVector loc = new PVector(random(300)+100, random(300)+100);
  float locX = random(1600)+100;
  float locY = random(800)+100;
  //float xEnd1 = 400, yEnd1= 500;
  float x = 40;
  float t =0;
  
  
    void update(){
      noFill();
      strokeWeight(2);
      ellipse(locX,locY,20,20);
      point(locX,locY);
      t+=.3;
      x = 25*t +400;
      y= ( - (pow((1-t),2)) + 100*t)/10 + 600;
      if(mousePressed){
        println(t);
      }  
      
     }
    void walk(){
      PVector path= new PVector(x,y);
      
      /*if(t<60){
      x = 12*t +400;
      y= ( - (pow((1-t),2)) + 100*t)/10 + 600;
      }
      */
      if(t>=55){
        path.rotate(-.1*(t-55)/4);
      }
      /*if(fc >= 120){
        x+= .0001;
        y= 1 - (pow(x,4));
      }*/
      
      //xEnd1 = xEnd1 + x  ;
      //yEnd1 = yEnd1 + y ;
      
      //PVector end1 = new PVector(xEnd1,yEnd1);
      //PVector vel = PVector.sub(end1, loc);
      
      float velX = path.x - locX;
      float velY = path.y - locY;
      //vel.mult(.1);
      //vel.normalize();
      //loc.add(vel);
  
      locX = locX + velX * .01;
      locY = locY + velY * .01;
      
      
    }
      
    
   

}