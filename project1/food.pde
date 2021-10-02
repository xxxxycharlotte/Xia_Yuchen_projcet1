class Food {
  
  PVector position;
  PImage food;
  float sizeVal;
  boolean alive = true;
  
  Food(float x, float y) {
    position = new PVector(x, y);
    sizeVal = random(30, 40);
  }
  
  void update() {
    // TODO
  }
  
  void draw() {
    
    food =loadImage("battery.png");
    
    if (alive) {
      imageMode(CENTER);
      noStroke();
      fill(0);
      image(food, position.x, position.y, sizeVal, sizeVal);
    }
  }
  
  void run() {
    update();
    draw();
  }
  
}
