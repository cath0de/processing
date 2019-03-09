float a;

void setup() {
  size(400,400);
  lights();
}

void loop() {
  background(255);
  // use horizontal mouse position to adjust mesh resolution
  cylinderDetail(mouseX/10);
  pushMatrix();
  translate(width*0.25,mouseY,-100);
  rotateX(mouseY*0.02);
  rotateY(mouseX*0.01);
  // close cone if mouse is pressed
  // animate cone radius
  cone(cos(a)*40+50,200,mousePressed);
  popMatrix();
  translate(width*0.75,mouseY,-100);
  rotateX(-mouseY*0.02);
  rotateY(mouseX*0.01);
  // close cylinder's bottom cap if mouse is pressed
  // top end is always open (false) in this case
  // animate cylinder's bottom radius
  cylinder(100,sin(a)*40+50,200,false,mousePressed);
  a+=0.1;
}

// [toxi040413] cylinder/cone 3d primitives
// use cylinderDetail(n) to set the resolution of the generated meshes
// both cone() and cylinder() methods have options to disable top/bottom caps
// cone() can only have a bottom cap

int cylinder_detail=0;
float[] cylinderX,cylinderZ;

void cylinderDetail(int res) {
  if (res<3) res=3; // force a minimum res
  if (res != cylinder_detail) {
    float delta = (float)g.SINCOS_LENGTH/res;
    cylinderX = new float[res];
    cylinderZ = new float[res];
    // calc unit circle in current resolution in XZ plane
    for (int i = 0; i < res; i++) {
      cylinderX[i] = g.cosLUT[(int) (i*delta) % g.SINCOS_LENGTH];
      cylinderZ[i] = g.sinLUT[(int) (i*delta) % g.SINCOS_LENGTH];
    }
    cylinder_detail = res;
  }
}

void cone(float r, float h, boolean bottomCap) {
  if (cylinder_detail == 0) {
    cylinderDetail(30);
  }
  h*=0.5; // center along Y axis
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < cylinder_detail; i++) {
    vertex(0,-h,0);
    vertex(cylinderX[i]*r, h, cylinderZ[i]*r);
  }
  vertex(0,-h,0);
  vertex(cylinderX[0]*r, h, cylinderZ[0]*r);
  endShape();
  if (bottomCap) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cylinder_detail; i++) {
      vertex(0,h,0);
      vertex(cylinderX[i]*r, h, cylinderZ[i]*r);
    }
    vertex(0,h,0);
    vertex(cylinderX[0]*r, h, cylinderZ[0]*r);
    endShape();
  }
}

void cylinder(float r1, float r2, float h, boolean topCap, boolean bottomCap) {
  if (cylinder_detail == 0) {
    cylinderDetail(30);
  }
  h*=0.5;
  if (topCap) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cylinder_detail; i++) {
      vertex(0,-h,0);
      vertex(cylinderX[i]*r1, -h, cylinderZ[i]*r1);
    }
    vertex(0,-h,0);
    vertex(cylinderX[0]*r1, -h, cylinderZ[0]*r1);
    endShape();
  }
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < cylinder_detail; i++) {
    vertex(cylinderX[i]*r1, -h, cylinderZ[i]*r1);
    vertex(cylinderX[i]*r2, h, cylinderZ[i]*r2);
  }
  vertex(cylinderX[0]*r1, -h, cylinderZ[0]*r1);
  vertex(cylinderX[0]*r2, h, cylinderZ[0]*r2);
  endShape();
  if (bottomCap) {
    beginShape(TRIANGLE_STRIP);
    for (int i = 0; i < cylinder_detail; i++) {
      vertex(0,h,0);
      vertex(cylinderX[i]*r2, h, cylinderZ[i]*r2);
    }
    vertex(0,h,0);
    vertex(cylinderX[0]*r2, h, cylinderZ[0]*r2);
    endShape();
  }
}