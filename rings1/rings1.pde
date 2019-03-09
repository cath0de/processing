int rings = 100;
int layers = 3;
Ring [][] ring;
void setup() {
  size(500,500);
  ring = new Ring[layers][rings];
  for (int i = 0; i < ring[0].length; i++) {  
    float tempxp = random(width);
    float tempyp = random(height);
    float tempxv = random(1,1.5);
    float tempyv = random(1,1.5);
    for(int j = 0; j < ring.length; j++){
  ring[j][i] = new Ring(tempxp, tempyp, tempxv, tempyv, 20+(j*10), j);
    }
  }
  smooth();
}  

void draw() {
  background(255);
  for(int i = ring.length-1; i > -1; i--){
    for(int j = 0; j < ring[i].length; j++){
  ring[i][j].drive();
  ring[i][j].draw();
    }
  }
}

class Ring{
  float xpos,ypos,xvel,yvel,xsize,ysize,layer;
  Ring(float xp, float yp, float velx, float vely, float size, float layer) {
    xpos = xp;
    ypos = yp;
    xvel = velx;
    yvel = vely;
    xsize = size;
    ysize = xsize;
    this.layer = layer;
  }
  void draw () {
    ellipseMode(CENTER);
    // fill(0,100,255);
    fill(layer*10,255-layer*10,0);
    noStroke();
    ellipse(xpos, ypos, xsize, ysize);
  } 
  void drive () {
    xpos = xpos + xvel;
    if (xpos > width + xsize) {  
  xpos = -xsize-20+(layer*20);
    }
    ypos = ypos + yvel;
    if (ypos > width + ysize) {  
  ypos = -ysize-20+(layer*20);
    }
  }
}
 