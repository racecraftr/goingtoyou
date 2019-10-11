float x;
float y;
float easing;
float x2, y2;



void setup() {
  size(700, 700); 
  noStroke(); 
  ellipseMode(CENTER);
  pixelDensity(2);
  background(51);
}

void draw() { 
  fill(255);
  background(51);
  stroke(255);
  ellipse(x2, y2, 10, 10);

  
  float targetX = x2;
  float dx = targetX - x;
  x += dx * easing;
  
  float targetY = y2;
  float dy = targetY - y;
  y += dy * easing;
  pushMatrix();
  translate(x, y);
  noStroke();
  rotate((atan2(targetX - x, targetY - y)) * -1);
  fill(255, 0, 0);
  ellipse(-.6,-.6, 30, 30);
  fill(0, 0, 255);
  ellipse(.6,.6, 30, 30);
  fill(255);
  ellipse(0, 0, 30, 30);
  popMatrix();
  stroke(255);
  
  line(x2, y2, x, y);
  line(x, 0, x2, height);
  line(0,y, width, y2);
  line(0, 0, x, y);
  line(width, height, x2, y2);
  if (mousePressed){
    easing = .7;
  }
  else{
    easing = .1;
  }
  if(sqrt(pow(dx, 2)     + pow(dy, 2))  < 2){
    x2 = random(width);
    y2 = random(height);
  }
}