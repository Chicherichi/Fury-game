class Menu
{
  private Game parentGame;
  private Fury main;

  PImage bgImage;

  int x, y;

  Sprite butterfly;
  StopWatch timer;


  Menu(Game parentGame, Fury main )
  {
     this.timer= new StopWatch();
    this.parentGame = parentGame;
    this.main=main;
    
    this.bgImage=loadImage("Menu.png");

    this.x= width/2-265;
    this.y=height/2+20;
    this.butterfly = new Sprite(this.main, "ButterflySprite.png", 1, 2, 100);
    this.butterfly.setFrameSequence(0, 1, 0.2);
  }

  public void update()
  {
    imageMode(CORNER);

    image(this.bgImage, 0, 0);
    this.butterfly.setXY( 600, 600);
    imageMode(CORNER);
    //line(width/2, 0, width/2, 1000);
    //line(0, height/2, 1900, height/2);
    rectMode(CENTER);
    stroke(255);
    strokeWeight(10);
    noStroke();
    fill(0, 200);
    rect(width/2, height/2, 600, 450);
    fill(255);
    textFont(this.parentGame.font, 110);
    text("Start the Game", this.x, this.y-150);
    text("Options", this.x+140, this.y);
    text("Credits", this.x+140, this.y+150);



    //StarttheGame
    if (mouseX > 650 && mouseX < 1250 && mouseY > 275 && mouseY <375)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("Start the Game", this.x, this.y-150);
    }
    //Options
    if (mouseX > 650 && mouseX < 1250 && mouseY > 450 && mouseY <550)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("Options", this.x+140, this.y);
    }
    //Credits
    if (mouseX > 650 && mouseX < 1250 && mouseY > 600 && mouseY <700)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("Credits", this.x+140, this.y+150);
    }
    float elapsedTime = (float) this.timer.getElapsedTime();
     S4P.updateSprites(elapsedTime);
    S4P.drawSprites();
    imageMode(CORNER);
  }


  public void checkMousePressed()
  {
    //StarttheGame
    if (mouseX > 650 && mouseX < 1250 && mouseY > 275 && mouseY <375)
    {
      this.parentGame.mode=4;
    }
    //Options
    if (mouseX > 650 && mouseX < 1250 && mouseY > 450 && mouseY <550)
    {
      this.parentGame.mode=2;
    }
    //Credits
    if (mouseX > 650 && mouseX < 1250 && mouseY > 600 && mouseY <700)
    {
      this.parentGame.mode=3;
    }
  }
  
  public void killSprites()
  {
    this.butterfly.setDead(true);
  }
  
    public void reviveSprites()
  {
    this.butterfly.setDead(false);
  }
}