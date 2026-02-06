PImage imgIn;
int colorSteps = 1;
boolean crazyFX = false;

void setup(){
  
  size(1024, 512);
  imgIn = loadImage("flower.jpg");
  imgIn.resize(512,512);
  imgIn.filter(GRAY);
  image(imgIn,0,0);
  
  if (crazyFX) noLoop();  //comment out and give 5> colorSteps for interresting visualFX
  
}

int index(int x, int y){
  return x+y * imgIn.width;
}

void draw(){
  imgIn.loadPixels();
  for (int y = 0; y < imgIn.height; y++){
    for ( int x = 0; x < imgIn.width; x++){
   
     color pix = imgIn.pixels[index(x,y)];
     
     float oldR = red(pix);
     float oldG = green(pix);
     float oldB = blue(pix);
     
     int newR = round(colorSteps * oldR / 255) * (255/colorSteps);
     int newG = round(colorSteps * oldG / 255) * (255/colorSteps);
     int newB = round(colorSteps * oldB / 255) * (255/colorSteps);
     
     
     if (crazyFX == false) imgIn.pixels[index(x,y)] = color (newR, newG, newB);
     
     float errR = oldR - newR;
     float errG = oldG - newG;
     float errB = oldB - newB;
     
     int index; color c; float r; float g; float b;
     
     if(x+1< imgIn.width){
     
        index = index(x+1, y  );
         c = imgIn.pixels[index];
         r = red(c);
         g = green(c);
         b = blue(c);
        r = r + errR * 7/16.0;
        g = g + errG * 7/16.0;
        b = b + errB * 7/16.0;
        imgIn.pixels[index] = color(r, g, b);

     }

      if(y+1< imgIn.height && x - 1 > 0){

        index = index(x-1, y+1  );
        c = imgIn.pixels[index];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 3/16.0;
        g = g + errG * 3/16.0;
        b = b + errB * 3/16.0;
        imgIn.pixels[index] = color(r, g, b);
      
      }
      
       if(y+1< imgIn.height){

        index = index(x, y+1);
        c = imgIn.pixels[index];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 5/16.0;
        g = g + errG * 5/16.0;
        b = b + errB * 5/16.0;
        imgIn.pixels[index] = color(r, g, b);

       }

      if(y+1< imgIn.height && x + 1< imgIn.width){
        
        index = index(x+1, y+1);
        c = imgIn.pixels[index];
        r = red(c);
        g = green(c);
        b = blue(c);
        r = r + errR * 1/16.0;
        g = g + errG * 1/16.0;
        b = b + errB * 1/16.0;
        imgIn.pixels[index] = color(r, g, b);
      }
     //imgIn.pixels[index(x,y)] = color(newR,newG,newB);
     
   }
  }
  imgIn.updatePixels();
  image(imgIn, 512,0,512*1, 512*1);

}
