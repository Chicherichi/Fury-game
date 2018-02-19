import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import sprites.*;
import sprites.maths.*;
import sprites.utils.*;

Game g;

void setup() {
  size(1900, 1000);
   frameRate(30);
  g = new Game(this);
}

void draw() {
  g.update();
}

void keyPressed()
{
  g.checkKeyPressed();
  g.checkMovement();
  g.checkE();
  g.checkQ();
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