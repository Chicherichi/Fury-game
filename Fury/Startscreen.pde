class Startscreen 
{
  PImage caption;
  private Game parentGame;
  
  Fury main;
  

  Startscreen(Game parentGame, Fury main)
  {
    this.main=main;
    this.parentGame = parentGame;
    this.caption=loadImage("Caption.png");
    
  }


  public void update() 
  {
    
    background(255);
    imageMode(CENTER);
    image(this.caption, width/2, height/2 -100);
    fill(0);
    textFont(this.parentGame.font, 110);
    text("Press -ENTER-", 700, 950);
     
       
  }

  public void checkKeyPressed()
  { 
    if (key==ENTER)
    {
      this.parentGame.mode=1;
    }
  }
}