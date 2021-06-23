// display an image
PImage img;

void setup() {
  size(1100, 600);
  img = loadImage("23836a413bf.jpg");
}

void draw() {
  image(img, 0, 0, mouseX, mouseY);
}
