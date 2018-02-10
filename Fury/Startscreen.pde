class Startscreen 
{
  private Game parentGame;

  Startscreen(Game parentGame)
  {
    this.parentGame = parentGame;
  }


  public void update() 
  {
    background(0);
    fill(255);
    textSize(50);
    text("Press -ENTER- to start", 730, 950);
  }

  public void checkKeyPressed()
  { 
    if (key==ENTER)
    {
      this.parentGame.nextMode();
    }
  }
}