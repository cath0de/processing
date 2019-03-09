import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

Tube tube;
Path path;
Contour contour;

PShape ring;

void setup() {
  size(500, 500, P3D);
  background(65);
  noLoop();
  
  ring = loadShape("redring.svg");
  tube = new Tube(this, 4, 50);
  tube.setSize(50, 50, 50, 50, 10);
  tube.drawMode(S3D.SOLID);
  tube.fill(color(0,255,120));
  tube.rotateToX(1.5708);
  tube.moveTo(250,250,0);
  tube.visible(false,S3D.BOTH_CAP);
} 

void draw(){
  //pushMatrix();
  shape(ring, 200, 200, 100, 100);
  tube.draw();
  //popMatrix();
}