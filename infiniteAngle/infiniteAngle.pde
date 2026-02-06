// Dummy variable to simulate arduino device and match
// exisiting code Included here to get the example working
float[] controlInput = {0};
 
// New global variables required
float currAngle = 0, deltaAngle;
 
void setup() {
  size(800, 600);
}
 
void draw() { 
  background(255);
  // Draw mouse sensitive ellispe
  mouseEllipse();
  // Check for wrap over the 0 degree mark
  if (currAngle > 270 && controlInput[0] < 90)
    deltaAngle = controlInput[0] + 360 - currAngle;
  else if (controlInput[0] > 270 && currAngle < 90) {
    deltaAngle =  -(currAngle + 360 - controlInput[0]);
    println(deltaAngle);
  } else
    deltaAngle = controlInput[0] - currAngle;
  currAngle += deltaAngle * 0.9; // Alter the constant to change easing rate
  currAngle = normaliseAngle(currAngle);
 
  pushMatrix();
  imageMode(CENTER);
  translate(400, 300);
  //rotate((SmInputComp) * TWO_PI/360);
  rotate(radians(currAngle));
 
  //image(img, 0, 0); don't have the image so
  // use this to simulate an image
  stroke(0, 0, 200);
  strokeWeight(2);
  noFill();
  rect(-80, -50, 160, 100);
  fill(0, 0, 255);
  rect(-80, -50, 20, 20);
  // end of image simulator
  popMatrix();
 
  // Now uses mouse position arround centre of screeen
  // to simulate arduino input
  Serial_Loop();
}
 
void mouseEllipse() {
  fill(255, 200, 200);
  noStroke();
  ellipse(400, 300, 400, 400);
}
 
// This method takes any angle and returns the equivaent 
// angle in the range 0 to 360 degrees
float normaliseAngle(float angle) {
  while (angle < 0) angle += 360;
  while (angle > 360) angle -= 360;
  return angle;
}
 
// Simulates the input from the arduino
void Serial_Loop() {
  if (dist(mouseX, mouseY, 400, 300) < 200) {
    // Use mouse position to simulate arduino device
    float a = atan2(mouseY - 300, mouseX - 400);
    if (a < 0) a += TWO_PI;
    controlInput[0] = degrees(a);
  }
}
