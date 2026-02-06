import processing.pdf.*;
// isometric

// options
String imagePath = "flower.jpg";
float res = 5; // resolution, dot density
float zoom = 1.0; // proportion to zoom image 
boolean isAdditive = false; // true = RGB, false = CMY
float offsetAngle = 0.1; // affects dot pattern
float margin = 10;

boolean positiveExport = true; //affects save output
boolean pdfExport = true; //pdf or preview
String pdfFileName = "flowerTestbb";
boolean grayscaleOut = true; //grayscale or color INPUT 
boolean blackPositive = true; //full black or color OUTPUT
String timecode =  str(second()) + "." + str(minute()) + "." + str(hour()) + "." + str(day()) + "." + str(month()) + "." + str(year());
/*
  0 = no patter
  0.05 = slight offset
  1 = slight offset
  0.1 = start noticing rings
  0.25 = rings
  PI / 3 = angled
  PI / 2 = small rings
  PI * 2 / 3 = angled other way
  PI = horizontal angled
*/


// vars and utilities
PGraphics flatImg;
PImage img;
float rt3 = sqrt(2);
float radius = 2.1 * res / rt3;
 
 public void settings() {
  size(628, 600);
}
 
 
void setup() {
  noLoop();
  smooth();
  img = loadImage( imagePath );
  //size(floor(img.width*zoom), floor(img.height*zoom));
}
 
void draw() {
  noStroke();
 
  flatImg = createGraphics(width, height);
  flatImg.beginDraw();
  flatImg.background(255);
  flatImg.image(img, margin, margin);
  flatImg.endDraw();
  
  flatImg.updatePixels();
  
  if(grayscaleOut){
    flatImg.filter(GRAY);
  }
  
  
  int bgColor = isAdditive ? 0 : 255;
  background( bgColor );
  renderMatrix(      0, 255, 0, 0 );
  //renderMatrix(  offsetAngle, 0, 255, 0 );
  //renderMatrix( -offsetAngle, 0, 0, 255 );
 
save("1c.jpg");
 
}
 
void renderMatrix( float theta, int r, int g, int b ) {
  
  PGraphics buffer, vis;
  vis = createGraphics(0, 0);
  if(pdfExport == true){
    buffer = createGraphics(width, height, PDF,  "result/" + pdfFileName + "_" + timecode + ".pdf");
    vis = createGraphics(width, height);
    vis.beginDraw();
    vis.smooth();
    vis.noStroke();
  } else {
    buffer = createGraphics(width, height);
  }
  
  buffer.beginDraw();
  buffer.smooth();
  buffer.noStroke();
  
  if(positiveExport == false){
    buffer.background(0);
  }
 
  //comment out background for positive export

  float zoomWidth = width * zoom;
  float zoomHeight = height * zoom;
  float xLen = zoomWidth / res;
  float yLen = zoomHeight / ( res * rt3/2 );
  float diag = sqrt( zoomWidth * zoomWidth + zoomHeight * zoomHeight ) / res;
  float size;
  float x1, y1, x2, y2;
  float hueValue;
  // center values
  float xc = zoomWidth / 2;
  float yc = zoomHeight / 2;
  for (int i = floor((xLen-diag)/2); i<diag; i++){
    for (int j = floor((yLen-diag * rt3)/2); j<diag*rt3; j++){
      x1 = ( i + (j%2)*0.5 + 0.25 ) * res;
      y1 = ( j * (rt3/2) + 0.5 ) * res;
      // shift to center
      x1 -= xc;
      y1 -= yc;
      // rotate grid
      x2 = x1 * cos(theta) - y1 * sin(theta) + xc;
      y2 = x1 * sin(theta) + y1 * cos(theta) + yc;
      // get color of pixel
      color pixel = flatImg.get( floor(x2 / zoom), floor(y2 / zoom) );
      // red
      size = 0;
      if ( r == 255 ) {
        hueValue = red(pixel);
      } else if ( g == 255 ) {
        hueValue = green(pixel);
      } else {
        hueValue = blue(pixel);
      }
      size = hueValue / 255;
      if ( !isAdditive ) {
        size = 1 - size;
      }
      size *= radius;

      if(blackPositive == true){
        buffer.fill( 0);
        
        if(pdfExport == true){
            vis.fill( 0);
          }
        
      } else {
        buffer.fill( r, g, b );
        
        if(pdfExport == true){
            vis.fill( r, g, b );
          }
        
      }
      
      if(x2 > margin && x2 < width - margin && y2 > margin && y2 < height - margin && size > 0){
        
        buffer.ellipse( x2, y2, size, size );
        
         if(pdfExport == true){
            vis.ellipse( x2, y2, size, size );
          }
        
        
      }
    }
  }
  
  if(pdfExport == true){
    buffer.dispose();
    vis.endDraw();
  }
  buffer.endDraw();
  
    if(pdfExport == false){
      if ( isAdditive ) {
        if(positiveExport == true){
        background(255);
        image(buffer,0,0);
        save("2c.jpg");
        } else {
          blend( buffer, 0, 0, width, height, 0, 0, width, height, ADD);
        }
        
      } else {
        
        if(positiveExport == true){
        background(255);
        image(buffer,0,0);
        } else {
          blend( buffer, 0, 0, width, height, 0, 0, width, height, SUBTRACT);
        }
      }
  
    } else {
      image(vis,0,0);
    }
}
