PImage source, destination;

void setup()
{
 source = loadImage("liberty_3.jpg");  // fill in your own image here
 size(source.width, source.height);
 noLoop();
 destination = warp(source);
}

void draw()
{
 image(destination, 0, 0);
}

// implement a simple vertical wave warp.
PImage warp(PImage source)
{
 float waveAmplitude = 20, // pixels
       numWaves = 5;       // how many full wave cycles to run down the image
 int w = source.width, h = source.height;
 PImage destination = new PImage(w,h);
 source.loadPixels();
 destination.loadPixels();

 float yToPhase = 2*PI*numWaves / h; // conversion factor from y values to radians.

 for(int x = 0; x < w; x++)
   for(int y = 0; y < h; y++)
   {
     int newX, newY;
     newX = int(x + waveAmplitude*sin(y * yToPhase));
     newY = y;
     color c;
     if(newX >= w || newX < 0 ||
        newY >= h || newY < 0)
       c = color(0,0,0);
     else
       c = source.pixels[newY*w + newX];
     destination.pixels[y*w+x] = c;
   }
 return destination;
} 


/*

PImage warp(PImage source)
{
 float waveAmplitude = 20, // pixels
       numWaves = 5;       // how many full wave cycles to run down the image
 int w = source.width, h = source.height;
 PImage destination = new PImage(w,h);
 source.loadPixels();
 destination.loadPixels();

 float yToPhase = 2*PI*numWaves / h; // conversion factor from y values to radians.

 for(int x = 0; x < w; x++)
   for(int y = 0; y < h; y++)
   {
     // In a 100-pixel radius circle around the center, apply a sine-wave transform.
     if(sqrt((x-width/2)*(x-width/2) + (y-height/2)*(y-height/2)) < 100)
     {
       int newX, newY;
       newX = int(x + waveAmplitude*sin(y * yToPhase));
       newY = y;
       color c;
       if(newX >= w || newX < 0 ||
          newY >= h || newY < 0)
         c = color(0,0,0);
       else
         c = source.pixels[newY*w + newX];
       destination.pixels[y*w+x] = c;
     }
     else // everywhere else, just copy pixels straight over.
       destination.pixels[y*w+x] = source.pixels[y*w+x];
   }
 return destination;
}

If you compare this with my original, you'll see that there's hardly any difference in the code; it just restricts the effect to a particular area.  To do something more interesting, you'll want to change the condition inside of this if() statement:

if(sqrt((x-width/2)*(x-width/2) + (y-height/2)*(y-height/2)) < 100)

to only select the area you want to modify. 

*/
