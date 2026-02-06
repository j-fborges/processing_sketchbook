int drips = 30;
int beginningheight = 0;
int speed = 1;

color back = color(255, 255, 255);
color shape = color(0, 0, 0);

int[] driph;
float dw;

void setup() {
  size(600, 600);

  dw = width / drips;
  driph = new int[drips];
  for (int i = 0; i < drips; i++) {
    driph[i] = int(random(0, beginningheight));
  }
}

void draw() {
  background(back);
  fill(shape);
  noStroke();
  for (int i = 0; i < drips; i++) {
    rect(i * dw, 0, dw, driph[i] * dw);
    if (i > 0 && driph[i - 1] == driph[i]) {
      rect((i - 0.5) * dw, driph[i - 1] * dw, dw, dw * 0.5);
    }
    if (i > 0 && driph[i - 1] < driph[i]) {
      beginShape();
      vertex((i - 0.5) * dw, (driph[i - 1] + 0.5) * dw);
      quadraticVertex(i * dw, (driph[i - 1] + 0.5) * dw, i * dw, (driph[i - 1] + 1) * dw);
      vertex(i * dw, driph[i - 1] * dw);
      vertex((i - 0.5) * dw, driph[i - 1] * dw);
      endShape(CLOSE);

      beginShape();
      vertex(i * dw, driph[i] * dw);
      quadraticVertex(i * dw, (driph[i] + 0.5) * dw, (i + 0.5) * dw, (driph[i] + 0.5) * dw);
      vertex((i + 0.5) * dw, driph[i] * dw);
      endShape(CLOSE);
    }
    if (i < drips - 1 && driph[i + 1] < driph[i]) {
      beginShape();
      vertex((i + 1) * dw, (driph[i + 1] + 1) * dw);
      quadraticVertex((i + 1) * dw, (driph[i + 1] + 0.5) * dw, (i + 1.5) * dw, (driph[i + 1] + 0.5) * dw);
      vertex((i + 1.5) * dw, driph[i + 1] * dw);
      vertex((i + 1) * dw, driph[i + 1] * dw);
      endShape(CLOSE);

      beginShape();
      vertex((i + 0.5) * dw, (driph[i] + 0.5) * dw);
      quadraticVertex((i + 1) * dw, (driph[i] + 0.5) * dw, (i + 1) * dw, driph[i] * dw);
      vertex((i + 0.5) * dw, driph[i] * dw);
      endShape(CLOSE);
    }
  }
  beginShape();
  vertex(0, driph[0] * dw);
  quadraticVertex(0, (driph[0] + 0.5) * dw, 0.5 * dw, (driph[0] + 0.5) * dw);
  vertex(0.5 * dw, driph[0] * dw);
  endShape(CLOSE);

  beginShape();
  vertex((drips - 0.5) * dw, (driph[drips - 1] + 0.5) * dw);
  quadraticVertex(drips * dw, (driph[drips - 1] + 0.5) * dw, drips * dw, driph[drips - 1] * dw);
  vertex((drips - 0.5) * dw, driph[drips - 1] * dw);
  endShape(CLOSE);
  for (int i = 0; i < speed; i++) {
    int ran = int(random(drips));
    driph[ran]++;
  }
}
