import wblut.core.*;
import wblut.geom.*;
import wblut.hemesh.*;
import wblut.math.*;
import wblut.nurbs.*;
import wblut.processing.*;

WB_Render3D render;
WB_RandomPoint generator;
WB_Circle circle;
HE_Mesh ring1, ring2, ring3, cone1;
PVector rotation;

float R_x =0;
float R_y =0;
float R_z =0;

void setup() {
  size(1000, 1000, P3D);
  smooth(8);
  strokeWeight(2);
  noFill();
  
  ring1 = makeRing(200,230,80);
  ring2 = makeRing(160,190,80);
  ring3 = makeRing(120,150,80); 
  cone1 = makeCone(15,20);

  //HET_Diagnosis.validate(cone);
  render=new WB_Render3D(this);
  //render=new WB_Render(this);
}

HE_Mesh makeRing(float inner, float outer, float thickness) {
  HE_Mesh ring;
  HEC_Ring rc=new HEC_Ring()
    .setCenter(WB_Point.ORIGIN())
    .setRadius(inner,outer)
    .setThickness(thickness)
    .setN(48);
  ring = new HE_Mesh(rc);
  return ring;
}

HE_Mesh makeCone(float c_radius, float c_height) {
  HE_Mesh cone;
  HEC_Cone cc=new HEC_Cone();
  cc.setRadius(c_radius).setHeight(c_height); 
  cc.setFacets(12).setSteps(5);
  cc.setCap(true);
  cc.setReverse(false);// flip cone?
  //Default axis of the cone is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
  cc.setZAxis(0,0,1);
  cone = new HE_Mesh(cc); 
  return cone;
}

void draw() {
  background(55);
  translate(width/2, height/2, 0);
  lights();
  R_x += 0.01;
  R_y += 0.01;
  R_z += 0.01;
  rotation = new PVector(0, R_y, 0);
  drawRing(ring1, rotation);
  rotation = new PVector(R_x, 0, 0);
  drawRing(ring2, rotation);
  rotation = new PVector(0, 0, R_z);
  drawRing(ring3, rotation);
  rotation = new PVector(R_x, R_y, R_z);
  drawSphere(rotation);
}

void drawRing(HE_Mesh obj, PVector R) {
  rotateX(R.x);
  rotateY(R.y);
  rotateY(R.z);
  noFill();
  strokeWeight(2);
  stroke(255,0,0);
  strokeWeight(1);
  stroke(100,0,0);
  render.drawEdges(obj);
  noStroke();
  fill(255);
  render.drawFaces(obj);
  /*
  if (ring1 == obj){
    pushMatrix();
    drawCone(cone);
    popMatrix();
  }
  */
}

void drawSphere(PVector R) {
  rotateX(R.x);
  rotateY(R.y);
  rotateY(R.z);
  stroke(255,0,0);
  sphere(110);
}

void drawCone(HE_Mesh obj) {
  translate(0,-230,0);
  //rotateY(radians(90));
  stroke(0);
  render.drawEdges(obj);
  noStroke();
  render.drawFaces(obj);
}