class Options 
{
  private Menu menu;
  private Game parentGame;
  PImage bgImage;
 
  int x,y;

  Options(Game parentGame, Menu menu)
  {
    this.parentGame=parentGame;
    this.menu=menu;
    this.bgImage=loadImage("Menu.png");
    
    this.x= width/2-265;
    this.y=height/2+20;
  }
  public void update()
  {
     image(this.bgImage, 0, 0);
      rectMode(CENTER);
    stroke(255);
    strokeWeight(10);
    noStroke();
    fill(0, 200);
    rect(width/2, height/2, 600, 450);
    fill(255);
    textFont(this.parentGame.font, 110);
    text("<--", this.x, this.y-150);
    text("Sound on/off", this.x+50, this.y);
    //text("Full-screen ", this.x+70, this.y+100);
    //arrow
    if (mouseX > 670 && mouseX < 800 && mouseY > 275 && mouseY <375)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("<--", this.x, this.y-150);
    }
    //Soundon
    if (mouseX > 650 && mouseX < 1250 && mouseY > 450 && mouseY <550)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("Sound on/off", this.x+50, this.y);
    }
    ////Fullscreen
    //if (mouseX > 650 && mouseX < 1250 && mouseY > 550 && mouseY <650)
    //{
    //  fill(164, 105, 32);
    //  textFont(this.parentGame.font, 110);
    //  text("Full-screen", this.x+70, this.y+100);
    //}
  }
  
  public void checkMousePressed()
  {
    if (mouseX > 670 && mouseX < 800 && mouseY > 275 && mouseY <375)
    {
      this.parentGame.mode=1;
    }
    if (mouseX > 650 && mouseX < 1250 && mouseY > 450 && mouseY <550)
    {
      if (this.parentGame.song.isPlaying())
      {
        this.parentGame.song.pause();
      this.parentGame.song.cue(0);
      }
      else
      {
        this.parentGame.song.loop();
      }  
    }
    //if (mouseX > 650 && mouseX < 1250 && mouseY > 550 && mouseY <650)
    //{
    //  fullScreen();
    //}
  }
}