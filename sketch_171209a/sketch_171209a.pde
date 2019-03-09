/*
 * FADE 1
void setup()
{
  size(500, 500, P3D);
}

void draw()
{
  pushMatrix();
  //translate(200, 0, 1);
  fill(222, 1);
  rect(0, 0, width, height);
  popMatrix();
  
  fill(random(255), 24, 76);
  ellipse(random(width), random(width), 30, 30);
  line(random(width*0.5), random(height*0.5), random(width*0.5), random(height*0.5));
}
*/

/*
 * FADE 2
 */
     void setup()
    {
      size(500, 500, P3D);
    }
    void draw()
    {
      pushMatrix();
      fill(222, 5);
      rect(0, 0, width, height);
      popMatrix();
      
      fill(random(255), 24, 76);
      ellipse(random(width), random(width), 30, 30);
      line(random(width*0.5), random(height*0.5), random(width*0.5), random(height*0.5));
    }