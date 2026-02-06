import processing.pdf.*;
 
boolean recording;
PGraphicsPDF pdf;
 
void setup() {
  size(400, 400);
  pdf = (PGraphicsPDF) createGraphics(width, height, PDF, "pause-resume.pdf");
}
 
void draw() {
  // Be sure not to call background, otherwise your file
  // will just accumulate lots of mess, only to become invisible
   
  // Draw something good here
  if (mousePressed) {
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}
 
void keyPressed() {
  if (key == 'r') {
    if (recording) {
      endRecord();
      println("Recording stopped.");
      recording = false;
    } else {
      beginRecord(pdf);
      println("Recording started.");
      recording = true;
    }
  } else if (key == 'q') {
    if (recording) {
      endRecord();
    }
    exit();
  }  
}