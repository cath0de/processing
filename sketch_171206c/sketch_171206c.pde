int anchor1x = 200;
int anchor1y = 50;
int anchor2x = 200;
int anchor2y = 300;
int control1x = 100;
int control1y = 100;
int control2x = 200;
int control2y = 300;

void setup() {
  size(400,400);
  background(0);
}

void draw() {
  //background(0);
  bez1(
    anchor1x,
    anchor1y,
    control1x,
    control1y,
    control2x,
    control2y,
    anchor2x,
    anchor2y,
    false
  );
  control1x = abs(control1x +1) % 400;
  control1y = abs(control1y -1) % 400;
    control2x = abs(control2x -1) % 400;
  control2y = abs(control2y +1) % 400;
}

void bez1(int a1x, int a1y, int c1x, int c1y, int c2x, int c2y, int a2x, int a2y, boolean showControls) {
  noFill();
  stroke(100, 120, 200, 20);
  bezier(a1x, a1y, c1x, c1y, c2x, c2y, a2x, a2y);
  if (showControls) {
    stroke (100,100,255);
    line(a1x, a1y, c1x, c1y);
    line(a2x, a2y, c2x, c2y);
  }
}