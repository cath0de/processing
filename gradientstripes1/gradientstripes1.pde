// Constants
int Y_AXIS = 1;
int X_AXIS = 2;
color b1, b2, c1, c2;
PImage bar1, bar2;

void setup() {
  size(500,500);
  background(0);
  // Define colors
  b1 = color(255);
  b2 = color(0);
  c1 = color(#DE0000);
  c2 = color(#1500DE);

  noLoop();
}

void draw() {
  PImage bar1 = createImage(width, 20, RGB); 
  bar1.loadPixels();
  for (int i = 0; i < width; i++) {
    float inter = map(i, 0, width, 0, 1);
    color c = lerpColor(c1, c2, inter);
    for (int j = 0; j < 20; j++) {
      bar1.pixels[(j * width) + i] = color(c); 
    }
  }
  bar1.updatePixels();
  
  PImage bar2 = createImage(20, height, RGB); 
  bar2.loadPixels();
  for (int i = 0; i < 20; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(c1, c2, inter);
    for (int j = 0; j < height; j++) {
      bar2.pixels[(i * height) + j] = color(c); 
    }
  }
  bar2.updatePixels();  
  
  image(bar1, 0, 100);
  image(bar2, 100, 0);
  
  //setGradient(0, 0, 500, 20, c2, c1, X_AXIS);
  //setGradient(300, 0, 20, 500, c2, c1, Y_AXIS);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}