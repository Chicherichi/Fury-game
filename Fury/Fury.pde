import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Game g;

void setup() {
  size(1920, 1010);
  g = new Game(this);
}

void draw() {
  g.update();
}

void keyPressed()
{
  g.checkKeyPressed();
  g.checkMovement();
   println("pressed");
  println(keyCode);
}

void keyReleased()
{
  g.checkKeyReleased();
  println("released");
  println(keyCode);
}

void mousePressed()
{
  g.checkMousePressed();
}