


class Player extends GameObject
{
  private Game parentGame;
  float x;
  float y;
  float size;
  float speed;
  Fury main;
  Sprite playerS, playerF, playerB, playerL, playerR;
  int spriteIndex; 
  StopWatch timer;
  boolean up, down, left, right;



  Player( Game parentGame, Fury main)
  {
    this.up = this.down = this.left = this.right = false; 
    this.main = main;
    this.x=width/2;
    this.y=height/2;
    this.size=50;
    this.speed=5;
    this.parentGame=parentGame;
    this.spriteIndex= 0;
     
    this.playerF = new Sprite(this.main, "fury_p3.png", 1, 3, 100);
    this.playerF.setFrameSequence(0, 2, 0.3);
    this.playerB = new Sprite(this.main, "fury_back.png", 1, 3, 100);
    this.playerB.setFrameSequence(0, 2, 0.3);
    this.playerL = new Sprite(this.main, "fury_left.png", 1, 3, 100);
    this.playerL.setFrameSequence(0, 2, 0.3);
    this.playerR = new Sprite(this.main, "fury_right.png", 1, 3, 100);
    this.playerR.setFrameSequence(0, 2, 0.3);
    this.playerF.setXY(this.x, this.y);
    this.timer= new StopWatch();
  }

  public void update()
  {
    this.playerF.setXY(this.x, this.y);
    //noCursor();

    if (this.down)
    { 
      spriteIndex=0;
    }

    if (this.up)
    { 
      spriteIndex=1;
      if (this.y>0+size/2) 
      {
        this.y -= speed;
      }
    }

    if (this.down)
    {
      spriteIndex=2;
      if (this.y<height-size/2)
      {
        this.y += speed;
      }
    }
    if (this.left)
    {
      spriteIndex=3;
      if (this.x>0+size/2)
      {
        this.x -= speed;
      }
    }
    if (this.right)
    {
      spriteIndex=4;
      if (this.x<width-size/2)
      {

        this.x += speed;
      }
    }

    switch(this.spriteIndex) { 
    case 0: 
      this.up = this.down = this.left = this.right = false;
      this.playerS = new Sprite (this.main, "FuryFrontWalk2.png", 100);
      this.playerB.setFrameSequence(1, 1, 0.3);
    case 1:  
      this.playerB = new Sprite(this.main, "fury_back.png", 1, 3, 100);
      this.playerB.setFrameSequence(0, 2, 0.3);
      break;  

    case 2:
      this.playerF = new Sprite(this.main, "fury_p3.png", 1, 3, 100);
      this.playerF.setFrameSequence(0, 2, 0.3); 
      break;  

    case 3:
      this.playerL = new Sprite(this.main, "fury_left.png", 1, 3, 100);
      this.playerL.setFrameSequence(0, 2, 0.3);
      break;  

    case 4:
      this.playerR = new Sprite(this.main, "fury_right.png", 1, 3, 100);
      this.playerR.setFrameSequence(0, 2, 0.3);
      break;
    }  

    float elapsedTime = (float) this.timer.getElapsedTime();
    S4P.updateSprites(elapsedTime);
    S4P.drawSprites();
  }

  public void nextSprite()
  {
    if(keyPressed)
    this.spriteIndex++;
  }

  public void checkMovement(boolean up, boolean down, boolean left, boolean right)
  {
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    /*if (keyPressed)
     {
     if (key == 'w')
     {
     if (this.y>0+size/2) 
     {
     this.y -= speed;
     }
     } else if (key == 's')
     {
     if (this.y<height-size/2)
     {
     this.y += speed;
     }
     } else if (key == 'a')
     {
     if (this.x>0+size/2)
     {
     this.x -= speed;
     }
     } else if (key == 'd')
     {
     if (this.x<width-size/2)
     {
     
     this.x += speed;
     }
     }
     }*/
  }
}