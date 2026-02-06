/** 
 * Drawing & Erasing (v2.13)
 * by Amnon.Owed & Quadrobite (2013/Aug)
 * mod GoToLoop
 * 
 * http://forum.processing.org/topic/drawing-application-need-help
 */

import java.util.Arrays;

PGraphics canvas;
PImage bg;

int diam = 50;
color c = #FF0000;

void setup() {
  size(800, 600);
  noLoop();
  noFill();

  canvas = createGraphics(width, height);

  canvas.beginDraw();
  canvas.smooth();
  canvas.endDraw();

  bg = createBG(25);


  mouseX = width>>1;
  mouseY = height>>1;
}

PImage createBG(int div) {
  final PGraphics pg = createGraphics(width, height);
  final int wdiv = width/div, grey = 0400/div;

  pg.beginDraw();

  pg.background(0);
  pg.noStroke();

  for (int i = div + 1; i-- != 0;) {
    pg.fill(i*grey);
    pg.rect(i*wdiv, 0, wdiv, height);
  }

  pg.endDraw();
  return pg.get();
}

void draw() {
  background(bg);
  image(canvas, 0, 0);

  stroke(c); 
  ellipse(mouseX, mouseY, diam, diam);
}

void keyPressed() {
  canvas.loadPixels();
  Arrays.fill(canvas.pixels, 0);
  canvas.updatePixels();

  redraw();
}

void mousePressed() {
  if (mouseButton == CENTER)   c = (color) random(#000000);

  redraw();
}

void mouseMoved() {
  redraw();
}

void mouseDragged() {
  if (mouseButton == LEFT)   drawCanvas();
  else                       eraseCanvas();

  redraw();
}

void mouseWheel(MouseEvent me) {
  final int inc = keyPressed & keyCode == CONTROL ? -1 : -5;
  diam = constrain(diam + (int) me.getAmount() * inc, 1, 100);

  redraw();
}

void drawCanvas() {
  canvas.beginDraw();

  canvas.stroke(c);
  canvas.strokeWeight(diam);
  canvas.line(pmouseX, pmouseY, mouseX, mouseY);

  canvas.endDraw();
}

void eraseCanvas() {
  final int cp[] = canvas.pixels, cw = canvas.width;
  final int rad  = diam>>1, mx = mouseX, my = mouseY;

  int xStart, yStart, xEnd, yEnd;
  
  xStart = (xStart = mx - rad);
  yStart = (yStart = my - rad);
  xEnd = (xEnd = mx + rad);
  yEnd = (yEnd = my + rad);
  
  if ((xStart = mx - rad) < 0)     xStart = 0;
  if ((yStart = my - rad) < 0)     yStart = 0;
  if ((xEnd = mx + rad) > width)   xEnd = width;
  if ((yEnd = my + rad) > height)  yEnd = height;

  canvas.loadPixels();

  for (int x=xStart; x!=xEnd; x++)   for (int y=yStart; y!=yEnd; y++)
    if (dist(x, y, mx, my) <= rad)   cp[x + y*cw] = 0;

  canvas.updatePixels();
}
