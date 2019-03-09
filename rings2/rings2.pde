import shapes3d.utils.*;
import shapes3d.animation.*;
import shapes3d.*;

Tube tube;
Path path;
Contour contour;

float angleX, angleY, angleZ;

public void setup() {
  size(500, 500, P3D);
  background(64);
  noLoop();
  
  tube = new Tube(this, 4, 50);
  tube.setSize(50, 50, 50, 50, 10);
  //tube.setTexture("sampler01.jpg", 2, 1);
  //tube.setTexture("coinhead.jpg", S3D.S_CAP);
  //tube.setTexture("cointail.jpg", S3D.E_CAP);
  tube.drawMode(S3D.SOLID);
  //tube.drawMode(S3D.SOLID, S3D.BOTH_CAP);
  tube.fill(color(255,0,0));
  tube.rotateToX(1.5708);
  //tube.visible(false,S3D.BOTH_CAP);
  tube.fill(color(0,64,0),S3D.BOTH_CAP);
  tube.strokeWeight(10);
}

public void draw() {
  // 3D draw first
  pushMatrix();
  camera(0, 0, 300, 0, 0, 0, 0, 1, 0);
  //camera();
  // Draw selected shape
  tube.draw();
  popMatrix();
} 