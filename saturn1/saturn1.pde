void setup() {
  size(800, 600, P3D);
  sphereDetail(30);
  smooth();
}
 
void draw(){
  background(255);
  translate(width/2, height/2);
  lights();
  fill(255, 0, 0);
  stroke(0);
  strokeWeight(1);
  rotateY(-radians(frameCount));
  sphere(100);
  stroke(128,0,128);
  strokeWeight(10);
  noFill();
  rotateX(HALF_PI-.45);
  ellipse(0,0,240,240);
}