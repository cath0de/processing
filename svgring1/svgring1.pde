PShape ring;

void setup() {
  size(500, 500, P3D);
  background(102);
  // The file "bot1.svg" must be in the data folder
  // of the current sketch to load successfully
  ring = loadShape("redring.svg");
} 

void draw(){
  shape(ring, 110, 90, 100, 100);  // Draw at coordinate (110, 90) at size 100 x 100
  shape(ring, 280, 40);            // Draw at coordinate (280, 40) at the default size
}