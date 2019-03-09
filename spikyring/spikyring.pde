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
SpikyRing spiky_ring;
PVector rotation;

float R_x =0;
float R_y =0;
float R_z =0;

int spike_width = 38;
int spike_height = 80;
int num_spikes = 12;

void setup() {
  size(1000, 1000, P3D);
  smooth(8);
  strokeWeight(1);
  //noFill();
  stroke(100,0,0);
  fill(255);
  render=new WB_Render3D(this);
  
  spiky_ring = new SpikyRing(230, 30, 80, 10);
}

void draw() {
  background(55);
  translate(width/2, height/2, 0);
  lights();
  R_x += 0.01;
  R_y += 0.01;
  R_z += 0.01;
  rotation = new PVector(0, R_y, 0);
  spiky_ring.display(rotation);
}

class SpikyRing {
  float r;
  float w;
  float t;
  int n;
  Spikes spikes;
  Ring ring;
  SpikyRing(float r_radius, float r_width, float r_thickness, int n_spikes) {
    r = r_radius;
    w = r_width;
    t = r_thickness;
    n = n_spikes;
    spikes = new Spikes(r, n);
    ring = new Ring(r, w, t);
  }
  
  void display(PVector R) {
    rotateX(R.x);
    rotateY(R.y);
    rotateY(R.z);
    spikes.display();
    ring.display();
  }
}

class Ring {
  HE_Mesh obj;
  float r;
  float w;
  float t;
  Ring(float r_radius, float r_width, float r_thickness) {
    r = r_radius;
    w = r_width;
    t = r_thickness;
    obj = makeRing(r, w, t);
  }
  
  void display() {
    //stroke(100,0,0);
    render.drawEdges(obj);
    //noStroke();
    //fill(255);
    render.drawFaces(obj);
  }
}

class Spikes {
  Spike[] spikesArray;
  float angleDiff;
  float r;
  int n;
  
  Spikes(float radius, int numSpikes) {
    r = radius;
    n = numSpikes;
    spikesArray = new Spike[n];
    build();
  }
  
  void build() {
    angleDiff = 360/n;
    float angle = 0;
    
    for (int i = 0; i < n; i++) {
      spikesArray[i] = new Spike(spike_width, spike_height, r, angle);
      angle += angleDiff;
    }
  }
  
  void display() {
    for (Spike s: spikesArray) {
      pushMatrix();
      s.display();
      popMatrix();
    }
  }
}

class Spike {
  HE_Mesh obj;
  float angle;
  float x;
  float y;
  float z;
  Spike(float s_width, float s_height, float s_radius, float s_angle) {
    obj = makeCone(s_width, s_height);
    float offset = spike_height/4;
    x = ((s_radius + offset) * cos(radians(s_angle)));
    y = ((s_radius + offset) * sin(radians(s_angle)));
    z = radians(s_angle-90);
  }
  //translate(0,-230,0);
  //rotateY(radians(90));
  void display() {
    translate(x, y);
    rotateZ(z);
    stroke(120);
    render.drawEdges(obj);
    noStroke();
    render.drawFaces(obj);
  }
}

HE_Mesh makeCone(float c_radius, float c_height) {
  HE_Mesh cone;
  HEC_Cone cc=new HEC_Cone();
  cc.setRadius(c_radius).setHeight(c_height); 
  cc.setFacets(12).setSteps(5);
  cc.setCap(true);
  cc.setReverse(false);// flip cone?
  //Default axis of the cone is (0,1,0). To change this use the HEC_Creator method setZAxis(..).
  cc.setZAxis(0,1,0);
  cone = new HE_Mesh(cc); 
  return cone;
}

HE_Mesh makeRing(float outer, float r_width, float thickness) {
  HE_Mesh ring;
  HEC_Ring rc=new HEC_Ring()
    .setCenter(WB_Point.ORIGIN())
    .setRadius(outer - r_width, outer)
    .setThickness(thickness)
    .setN(48);
  ring = new HE_Mesh(rc);
  return ring;
}