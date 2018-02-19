class Credits
{
  private Menu menu;
  private Game parentGame;
  PImage bgImage;
 
  int x,y;

  Credits(Game parentGame, Menu menu)
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
    rect(width/2, height/2, 1300, 550);
    fill(255);
    textFont(this.parentGame.font, 110);
    text("<--", this.x-250, this.y-200);
    fill(164, 105, 32);
    text("Credits", this.x+140, this.y-190);
    textFont(this.parentGame.font, 70);
    fill(255);
    text("GameArt: Chiara Hillen", this.x-250, this.y-50);
    text("Front- & Back-End programming: Chiara Hillen", this.x-250, this.y+20);
    text("Story: Benjamin Schiller and Chiara Hillen", this.x-250, this.y+90);
     text("Music: The Legend of Zelda - Song of Storms ", this.x-250, this.y+160);
    //arrow
    if (mouseX > 425 && mouseX < 525 && mouseY > 250 && mouseY <300)
    {
      fill(164, 105, 32);
      textFont(this.parentGame.font, 110);
      text("<--", this.x-250, this.y-200);
    }
   
  }
  
  public void checkMousePressed()
  {
    if (mouseX > 425 && mouseX < 525 && mouseY > 250 && mouseY <300)
    {
      this.parentGame.mode=1;
    }
   
  }
}