import extruder.*;

PShape ring;
PShape[] ring3d;

extruder e;

int f;

void setup() {
  size(500, 500, P3D);
  background(102);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  ring = loadShape("redring.svg");
  e = new extruder(this);
  ring3d = e.extrude(ring,10,"box");
} 

void draw(){
    // Set origin of scene to center of image
  translate(width/2, height/2, 0);
  // Rotate 3 degrees per frame on the y-axis
  rotateY(radians(f*3));
  for (PShape p:ring3d){
    shape(p);
  }
    // Increment frame counter 
  f++;
}