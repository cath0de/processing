import wblut.core.*;
import wblut.geom.*;
import wblut.hemesh.*;
import wblut.math.*;
import wblut.nurbs.*;
import wblut.processing.*;

WB_Render3D render;
WB_RandomPoint generator;
WB_Circle circle;
HE_Mesh ring1, ring2, ring3;
PVector rotation;

float R_x =0;
float R_y =0;
float R_z =0;

void setup() {
  size(1000, 1000, P3D);
  smooth(8);
  strokeWeight(2);
  noFill();
  render=new WB_Render3D(this);
  println(WB_Version.version());
  println(WB_Disclaimer.disclaimer());

  HEC_Ring rc=new HEC_Ring()
    .setCenter(WB_Point.ORIGIN())
    .setRadius(200,220)
    .setThickness(80)
    .setN(48);
  ring1=new HE_Mesh(rc);  

  HEC_Ring rc2=new HEC_Ring()
    .setCenter(WB_Point.ORIGIN())
    .setRadius(160,180)
    .setThickness(80)
    .setN(48);
  ring2=new HE_Mesh(rc2); 
  
  HEC_Ring rc3=new HEC_Ring()
    .setCenter(WB_Point.ORIGIN())
    .setRadius(120,140)
    .setThickness(80)
    .setN(48);
  ring3=new HE_Mesh(rc3);  
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
}