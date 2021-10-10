PImage robot;
PImage bg;
PImage robot_close;
PImage off;
PImage on;
PImage water;
PImage food;
boolean on_off=true, drink=false, eat=false;
boolean drink_off=false, eat_up=false;
float x, y, vx, vy;
import ddf.minim.*;
Minim minim;
AudioPlayer player;
boolean rewind=true;
void setup() {
  size(1200, 675);
  background(255);
  robot=loadImage("robotics.png");
  bg=loadImage("bg.png");
  robot_close=loadImage("robotics_close.png");
  off=loadImage("switch-off.png");
  on=loadImage("switch-on.png");
  water=loadImage("water.png");
  food=loadImage("pet-food.png");
  imageMode(CENTER);
  x=200;
  y=height/2+100;
  minim = new Minim(this); 
  player = minim.loadFile("bgm.mp3");
  player.loop();
}

void draw() {
  image(bg, width/2, height/2, width, height);
  if (on_off) {//on
    image(on, 100, 80, 100, 100);
    image(robot, x, y, 300, 300);

    if (drink) {
      move(100);
    } else if (eat) {
      move(width-100);
    } else {
      mouseMove();
    }

    if ((drink)&&(abs(100-x)<20)) {
      drink_off=true;
      drink=false;
    }

    if ((eat)&&(abs(width-100-x)<20)) {
      eat_up=true;
      eat=false;
    }
    if (!drink_off) {
      image(water, 100, height-100, 100, 100);
    }
    if (!eat_up) {
      image(food, width-100, height-100, 100, 100);
    }
  } else {//off
    image(off, 100, 80, 100, 100);
    image(robot_close, x, y, 300, 300);
    if (!drink_off) {
      image(water, 100, height-100, 100, 100);
    }
    if (!eat_up) {
      image(food, width-100, height-100, 100, 100);
    }
  }
}

void mouseMove() {
  if (abs(mouseX-x)<300) {
    vx=(mouseX-pmouseX);
    x+=vx;
  } else {
    vx=width/2-x;
    x+=vx*0.1;
  }
  if (x<0) {
    x=width;
  }
  if (x>width) {
    x=0;
  }
}
void move(float dx) {
  if ((abs(dx-x))>10) {
    vx=0.03*(dx-x);
    x+=vx;
  }
}

void mouseClicked() {
  if ((mouseX>50)&&(mouseX<150)&&(mouseY>40)&&(mouseY<120)) {
    on_off=!on_off;
  }
  if ((!drink_off)&&(mouseX>50)&&(mouseX<150)&&(mouseY>height-130)&&(mouseY<height-70)) {
    drink=true;
    eat=false;
  }
  if ((!eat_up)&&(mouseX>width-150)&&(mouseX<width-50)&&(mouseY>height-130)&&(mouseY<height-70)) {
    eat=true;
    drink=false;
  }
}
