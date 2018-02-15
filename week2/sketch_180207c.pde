
float heading;
float x;
float y;
float speed = 1;
float thickness = 20;

float r = 8;
float g = mouseX;
float b = mouseY;

float prevLeftX;
float prevLeftY;
float prevRightX;
float prevRightY;

void setup() {
  size(1000, 1000);
  noSmooth();
  frameRate(100);
  background(255);
}

void draw() {

  heading += sin(radians(frameCount))*3 + randomGaussian()*4;

  r += random(-10, 10);
  g += random(-10, 10);
  b = constrain(b, 0, 256);

  r = constrain(r, 0, 256);
  g = constrain(g, 0, 256);
  b += random(-10, 10);

  x += cos(radians(heading))*speed;
  y += sin(radians(heading))*speed;

  if (x < 0) {
    x = width;
    prevLeftX += width;
    prevRightX += width;
  }
  if (x > width) {
    x = 0;
    prevLeftX -= width;
    prevRightX -= width;
  }

  if (y < 0) {
    y = height;
    prevLeftY += height;
    prevRightY += height;
  }
  if (y > height) {
    y = 0;
    prevLeftY -= height;
    prevRightY -= height;
  }


  float leftX = x + cos(radians(heading-90))*thickness;
  float leftY = y + sin(radians(heading-90))*thickness;

  float rightX = x + cos(radians(heading+90))*thickness;
  float rightY = y + sin(radians(heading+90))*thickness;

  noStroke();
  fill(r, g, b);

  beginShape();
  vertex(prevLeftX, prevLeftY);
  vertex(leftX, leftY);
  vertex(rightX, rightY);
  vertex(prevRightX, prevRightY);
  endShape(CLOSE);

  prevLeftX = leftX;
  prevLeftY = leftY;
  prevRightX = rightX;
  prevRightY = rightY;
}