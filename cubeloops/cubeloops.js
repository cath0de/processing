/* 
171027
Big cube consisted of small cubes
only outer sides, no inner cubes.
*/

float t;
float theta;
int maxFrameCount = 75;

int a = 101; // offset number
int space = 100; // size of cube for for loops

color c1;
color c2;

void setup(){
  size(540,540, P3D);
}

void draw(){
  background(5);
  translate(width/2,height/2);
  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;

  // lights
  directionalLight(245, 245, 245, 300, -200, -200);  
  ambientLight(240, 240, 240); 
  
  // rotate the whole cube
  rotateY(radians(145));
  rotateX(radians(45));
  
// 3 nested for loops to create sides  
  for (int x = -space; x <= space; x += 20) {
  for (int y = -space; y <= space; y += 20) {
  for (int z = -space; z <= space; z += 200) {

    // map size of small cubes with offset
    float offSet = ((x*y*z))/a;
    float sz = map(sin(-theta+offSet), -1, 1, -0, 20);

    color c1 = color(240,40,100);
    color c2 = color(40,40,90);

   
  if ((x*y*z)%30 == 0){
    fill(c1);
    stroke(c2);
  } else {
    fill(c2);
    stroke(c1);
  }
    
    // small blocks, 3 times to create cube
    shp(x,y,z,sz);
    shp(y,z,x,sz);
    shp(z,x,y,sz);

    }}}


  } // end loop

  void shp(float x, float y,  float z, float d){
    
         pushMatrix();
         translate(x,y,z);
         box(d);
         popMatrix();
         
   }