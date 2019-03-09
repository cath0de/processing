
    void setup() {
      size(500,500,JAVA2D);
      smooth();
      noLoop();
    }
    void draw() {
      background(0);
      // gradient
      // to "prove" the interior of the ring is hollow
      for (int y=0; y<height; y++) {
        stroke(map(y,0,height,0,255));
        line(0,y,width,y);
      }
      // ring
      stroke(0);
      fill(255,0,0);
      drawRing(width/2,height/2,200,150);
    }
    void drawRing(float x, float y, float rmajor, float rminor) {
      beginShape();
      emitCircleVertices(x,y,rmajor,64,1);
      beginContour();
      emitCircleVertices(x,y,rminor,64,-1);
      endContour();
      endShape();
    }
    void emitCircleVertices(float x, float y, float r, int nsegs, int dir) {
      float sgn = (dir>=0) ? 1 : -1;
      for (int i=0; i<=nsegs; i++) {
        float theta = (float)(i) / (float)(nsegs) * TWO_PI * sgn;
        vertex(x+r*cos(theta), y+r*sin(theta));
      }
    }