PVector position, target, position_satellite;
PImage current, wifi;
boolean isRunning = false;
float angle_satellit;

void setup() { 
  size(1000, 600, P2D);
  
  position = new PVector(width/2, height/2);
  position_satellite = new PVector(0.0, 0.0);
  target = new PVector(random(width), random(height));  
  angle_satellit = 0.0;
  
  current = loadImage("robotics.png");
  wifi = loadImage("antenna.png");
  
  
  imageMode(CENTER);
}

void draw() {
  background(127);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isRunning = position.dist(mousePos) < 100;
  
  if (isRunning) {
    position = position.lerp(target, 0.08);
    if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
    }
  }
  
  
  image(current, position.x, position.y, 100, 100);
  angle_satellit += 0.1;
  position_satellite.x = position.x + 70*cos(angle_satellit);
  position_satellite.y = position.y + 70*sin(angle_satellit);
  image(wifi, position_satellite.x, position_satellite.y, 30, 40);
}
