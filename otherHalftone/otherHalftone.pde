PGraphics flatImg;
PImage img;
float rt3 = sqrt(3);
float res = 10; /* resolution */
float radius = 2.1 * res / rt3;
float zoom = 1.0;

void setup() {
  noLoop();
  smooth();
  img = loadImage("flower.jpg");
  size(floor(img.width*zoom), floor(img.height*zoom));
}

void draw() {
  noStroke();

  flatImg = createGraphics(width, height, P2D);
  flatImg.beginDraw();
  flatImg.background(255);
  flatImg.image(img, 0, 0);
  flatImg.endDraw();
  
  flatImg.updatePixels();


  background(0);
  renderMatrix(      0, 255, 0, 0 );
  renderMatrix(  PI/12, 0, 255, 0 );
  renderMatrix( -PI/12, 0, 0, 255 );

}

void renderMatrix( float theta, int r, int g, int b ) {
  PGraphics buffer = createGraphics(width, height, P2D);
  
  buffer.beginDraw();
  buffer.smooth();
  buffer.noStroke();
  
  buffer.background(0);
  
  float xLen = width / res;
  float yLen = height / ( res * rt3/2 );
  float diag = sqrt( width * width + height * height ) / res;
  float size;
  float x1, y1, x2, y2;
  float hueValue;
  float xc = width/(2*zoom);
  float yc = height/(2*zoom);
  for (int i = floor((xLen-diag)/2); i<diag; i++){
    for (int j = floor((yLen-diag * rt3)/2); j<diag*rt3; j++){
      x1 = ( i + (j%2)*0.5 + 0.25 ) * res;
      y1 = ( j * (rt3/2) + 0.5 ) * res;
      x2 = (x1 - xc) * cos(theta) - (y1 - yc) * sin(theta) + xc;
      y2 = (x1 - xc) * sin(theta) + (y1 - yc) * cos(theta) + yc;
      color pixel = flatImg.get( floor(x2), floor(y2) );
      // red
      size = 0;
      if ( r == 255 ) {
        hueValue = red(pixel);
      } else if ( g == 255 ) {
        hueValue = green(pixel);
      } else {
        hueValue = blue(pixel);
      }
      size = ( hueValue / 255 ) * radius;
      buffer.fill( r, g, b );
      buffer.ellipse( x2*zoom, y2*zoom, size*zoom, size*zoom );
    }
  }
  
  buffer.endDraw();

  blend( buffer, 0, 0, width, height, 0, 0, width, height, ADD);

}
