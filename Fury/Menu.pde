class Menu
{
  private Game parentGame;

  Menu(Game parentGame)
  {
    this.parentGame = parentGame;
  }

  public void update()
  {
    background(0);
    rectMode(CENTER);
    stroke(255);
    strokeWeight(10);
    fill(0);
    rect(990, 540, 800, 200);
    fill(255);
    textSize(100);
    text("Start the Game", 630, 570);
  }

  public void checkMousePressed()
  {
    if (mouseX > 590 && mouseX < 1390 && mouseY > 340 && mouseY <740)
    {
      this.parentGame.nextMode();
    }
  }
}