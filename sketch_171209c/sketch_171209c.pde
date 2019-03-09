PVector anchor_location1;
PVector anchor_velocity1;
PVector anchor_location2;
PVector anchor_velocity2;
PVector control_location1;
PVector control_velocity1;
PVector control_location2;
PVector control_velocity2;

void setup() {
  size(400,400, P3D);
  background(0);
  anchor_location1 = new PVector(200,50);
  anchor_velocity1 = new PVector(1,0.1);
  anchor_location2 = new PVector(200,300);
  anchor_velocity2 = new PVector(0.2,1.2);
  control_location1 = new PVector(100,100);
  control_velocity1 = new PVector(0.07,3);
  control_location2 = new PVector(200,300);
  control_velocity2 = new PVector(1.5,2);
}

void draw() {
  //background(0);
  //pushMatrix();
  fill(0,5);
  rect(0, 0, width, height);
  //popMatrix();
  
  bez1(
    anchor_location1.x,
    anchor_location1.y,
    control_location1.x,
    control_location1.y,
    control_location2.x,
    control_location2.y,
    anchor_location2.x,
    anchor_location2.y,
    false
  );
  
  anchor_location1.add(anchor_velocity1);
  anchor_location2.add(anchor_velocity2);
  control_location1.add(control_velocity1);
  control_location2.add(control_velocity2);
  
  anchor_location1 = bounce(anchor_location1, anchor_velocity1);
  anchor_location2 = bounce(anchor_location2, anchor_velocity2);
  control_location1 = bounce(control_location1, control_velocity1);
  control_location2 = bounce(control_location2, control_velocity2);
}

void bez1(
  float a1x, float a1y, 
  float c1x, float c1y, 
  float c2x, float c2y, 
  float a2x, float a2y, 
  boolean showControls) {
  noFill();
  stroke(66, 187, 216, 70);
  bezier(a1x, a1y, c1x, c1y, c2x, c2y, a2x, a2y);
  if (showControls) {
    stroke (100,120,255);
    line(a1x, a1y, c1x, c1y);
    line(a2x, a2y, c2x, c2y);
  }
}

PVector bounce(PVector loc, PVector vel) {
    if ((loc.x > width) || (loc.x < 0)) {
    vel.x = vel.x * -1;
  }
  if ((loc.y > height) || (loc.y < 0)) {
    vel.y = vel.y * -1;
  }
  return loc;
}