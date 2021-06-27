// robot 8 for objects concept
Robot bot1;
Robot bot2;

void setup() {
  size(720, 480);
  bot1 = new Robot("robot1.svg", 90, 80);
  bot2 = new Robot("robot2.svg", 440, 30);
}

void draw() {
  background(0, 153, 204);
  
  // first robot
  bot1.update();
  bot1.display();
  
  // second robot
  bot2.update();
  bot2.display();
}

class Robot {
  float xpos;
  float ypos;
  float angle;
  PShape botShape;
  float yoffset = 0.0;
  
  // constructor
  Robot(String svgName, float tempX, float tempY) {
    botShape = loadShape(svgName);
    xpos = tempX;
    ypos = tempY;
    angle = random(0, TWO_PI);
  }
  
  // update field
  void update() {
    angle += 0.05;
    yoffset = sin(angle) * 20;
  }
  
  // draw the robot
  void display() {
    shape(botShape, xpos, ypos + yoffset);
  }
}
