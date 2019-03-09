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
Spikes spikes;
//Spike s1;
PVector rotation;

void setup() {
  size(1000, 1000, P3D);
  smooth(8);
  strokeWeight(2);
  noFill();
  render=new WB_Render3D(this);
  
  //s1 = new Spike(15, 30);
  spikes = new Spikes(200, 10);
  //spikes.build();
}

void draw() {
  background(55);
  translate(width/2, height/2, 0);
  lights();
  spikes.display();
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
      spikesArray[i] = new Spike(15, 30, r, angle);
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
    x = (s_radius * cos(radians(s_angle)));
    y = (s_radius * sin(radians(s_angle)));
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