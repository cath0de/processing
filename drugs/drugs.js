/*
Drugs are bad, mmkay?

Controls:
  - Drag the mouse along its width to change how much it twists.
    - Drag the mouse along its height to change its count.

Original Author:
  Michael Pinn (openprocessing.org/sketch/208059)

Forked by:
  Jason Labbe

Site:
  jasonlabbe3d.com
*/

var count = 10;
var speed = 5;
var offset = 0.5;
var twist = 15;


function setup() {
  createCanvas(windowWidth, windowHeight);
  rectMode(CENTER);
  textAlign(CENTER);
  textSize(14);
  colorMode(HSB, 255);
}


function draw() {
  background(20, 0, 50);
  
  noFill();
  
  push();
  translate(width/2, height/2);
  
  for (var j = 0; j < count; j++) {
    for (var i = 0; i < 600; i += 20) {
      var angle = sin(radians(i*offset-frameCount*speed))*twist;
      var colorHue = map(j, 0, count, 140, 220);
      var angleOffset = map(j, 0, count, 150, 250);
      var opacity = map(j, 0, count, 255, 100);
      var roundness = max(angle, 0)*2.5;
      
      stroke(colorHue, 255, 255, opacity);
      strokeWeight(max(angle*0.5, 1));
      
      push();
      rotate(radians(i*angle/angleOffset));
      rect(0, 0, i, i, roundness);
      pop();
    }
  }
  
  pop();
  
  noStroke();
  fill(255);
  text("Press and drag the mouse to change its motion.", width/2, height-50);
}


function mouseDragged() {
  twist = map(mouseX, 0, width, -35, 35);
  count = map(mouseY, 0, height, 10, 1);
}