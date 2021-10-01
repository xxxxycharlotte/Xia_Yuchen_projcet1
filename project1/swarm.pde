Integer numCreatures = 50;
PVector[] position, target;
boolean isRunning = false;

void setup() { 
  size(1100, 1100, P2D);
  position = new PVector[numCreatures];
  target = new PVector[numCreatures];

  for (int i=0; i<numCreatures; i++){
    position[i] = new PVector(width/2, height/2);
    target[i] = new PVector(random(width), random(height));  
 
  }
  ellipseMode(CENTER);
}

void draw() {
  background(127);
  
  for(int i=0; i<numCreatures; i++){
    PVector mousePos = new PVector(mouseX, mouseY);
    
    isRunning = position[i].dist(mousePos) < 100;
    for (int j=0; j<numCreatures; j++){
      if (i == j){
        continue;
      }
      isRunning = isRunning || (position[i].dist(position[j])<100);
    }
    
    if (isRunning) {
      position[i] = position[i].lerp(target[i], 0.08);
      if (position[i].dist(target[i]) < 5) {
        target[i] = new PVector(random(width), random(height));
      }
    }
    
    ellipse(position[i].x, position[i].y, 20, 20);
  }
}
