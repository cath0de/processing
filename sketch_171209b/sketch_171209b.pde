int anchor1x = 200;
int anchor1y = 50;
int anchor2x = 200;
int anchor2y = 300;
int control1x = 100;
int control1y = 100;
int control2x = 200;
int control2y = 300;
PVector location1;
PVector velocity1;

void setup() {
  size(400,400, P3D);
  background(0);
  location1 = new PVector(200,50);
  velocity1 = new PVector(0.08,0.08);
}

void draw() {
  //background(0);
  pushMatrix();
  fill(0, 5);
  rect(0, 0, width, height);
  popMatrix();
  
  bez1(
    location1.x,
    location1.y,
    control1x,
    control1y,
    control2x,
    control2y,
    anchor2x,
    anchor2y,
    false
  );
  location1.add(velocity1);
  control1x = abs(control1x +1) % 400;
  control1y = abs(control1y -1) % 400;
  control2x = abs(control2x -1) % 400;
  control2y = abs(control2y +1) % 400;
}

void bez1(float a1x, float a1y, int c1x, int c1y, int c2x, int c2y, int a2x, int a2y, boolean showControls) {
  noFill();
  stroke(66, 187, 216, 70);
  bezier(a1x, a1y, c1x, c1y, c2x, c2y, a2x, a2y);
  if (showControls) {
    stroke (100,120,255);
    line(a1x, a1y, c1x, c1y);
    line(a2x, a2y, c2x, c2y);
  }
}