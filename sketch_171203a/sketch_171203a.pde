// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;
int maxLoops = 20;
int numLoops;

void setup() {
  size(400,400);
  background(0);
  //blendMode(ADD);

  // Define colors
  b1 = color(255);
  b2 = color(0);
  c1 = color(255, 255, 0, 255);
  c2 = color(0, 255, 255, 255);
  
  numLoops = 0;

  //noLoop();
}


void draw() {
  blurred();
  unblurred();
  numLoops++;
  if (numLoops > maxLoops) {
    noLoop();
  }
}

void blurred() {
  stroke(c1);
  strokeWeight(8);
  line(200,100,200,300);
  filter(BLUR, 6);
}

void unblurred() {
  stroke(c2);
  strokeWeight(2);
  line(200,100,200,300);
}