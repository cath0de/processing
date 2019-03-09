import wblut.core.*;
import wblut.geom.*;
import wblut.hemesh.*;
import wblut.math.*;
import wblut.nurbs.*;
import wblut.processing.*;

WB_Render3D render;
WB_RandomPoint generator;
WB_Circle circle;
HE_Mesh ring1;
HE_Mesh ring2;

float R_x =0;
float R_y =0;

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
}

void draw() {
  background(55);
  translate(width/2, height/2, 0);
  lights();
  drawRing(ring1);
}

void drawRing(HE_Mesh obj) {
  rotateY(R_y);
  R_y += 0.01;
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