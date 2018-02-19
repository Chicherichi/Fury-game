


class Player extends GameObject
{
  private Game parentGame;
  Fury main;
  Level level;
  Level2 level2;
  float x ;
  float y ;
  float size;
  float speed;
  int playerX = 1800/*150*/, playerY = 400/*150*/;

  Sprite playerS, playerF, playerB, playerSide, playerSideL, cB;
  int spriteIndex; 
  StopWatch timer;
  boolean up, down, left, right;
  float colRadius;

  Player( Game parentGame, Fury main, Level level, Level2 level2)
  {
    this.up = this.down = this.left = this.right = false; 
    this.main = main;
    this.level=level;
    this.level2=level2;

    this.colRadius = 10;

    //this.x=this.level2.playerX;
    //  this.y=this.level2.playerY;
    this.size=50;
    this.speed=7;
    this.parentGame=parentGame;
    this.spriteIndex= 0;

    this.playerF = new Sprite(this.main, "FrontWalkS.png", 1, 3, 100);
    this.playerF.setFrameSequence(0, 2, 0.1);
    this.playerF.setCollisionRadius(colRadius);
    this.playerB = new Sprite(this.main, "BackWalkS.png", 1, 3, 100);
    this.playerB.setFrameSequence(0, 2, 0.1);
    this.playerB.setCollisionRadius(colRadius);
    this.playerSide = new Sprite(this.main, "SideWalkS.png", 1, 3, 100);
    this.playerSide.setFrameSequence(0, 2, 0.1);
    //this.playerSide.setCollisionRadius(colRadiusB);
    this.playerSideL = new Sprite(this.main, "SideWalkSleft.png", 1, 3, 100);
    this.playerSideL.setFrameSequence(0, 2, 0.1);
    //this.playerSideL.setCollisionRadius(colRadiusB);
    this.playerS = new Sprite (this.main, "FrontWalkS.png", 1, 3, 100);
    this.playerS.setFrameSequence(1, 1);
    this.playerS.setCollisionRadius(colRadius);
    this.cB = new Sprite (this.main, "collisionBox.png", 1, 1, 100);



    this.timer= new StopWatch();
    levelChange();
  }
  
  
  public void setLevel2(Level2 level2)
  {
    this.level2 = level2;
  }

  public void update()
  {


println("update");
    int oldX = this.playerX;
    int oldY = this.playerY;
    int forwardX = this.playerX;
    int forwardY = this.playerY;
    this.cB.setXY(this.playerX, this.playerY+25);

    //noCursor();

    if (this.down==false || this.up==false || this.left==false || this.right==false )
    { 
      spriteIndex=4;
    }

    if (this.up)
    { 
      spriteIndex=1;
      if (this.playerY>0+size/2) 
      {
        this.playerY-= speed;
        forwardY -= 2*speed;
      }
    }

    if (this.down)
    {
      spriteIndex=0;
      if (this.playerY<height-size/2)
      {
        this.playerY += speed;
        forwardY += 2*speed;
      }
    }
    if (this.left)
    {
      spriteIndex=2;
      if (this.playerX>0+size/2)
      {
        this.playerX -= speed;
        forwardX -= 2*speed;
      }
    }
    if (this.right)
    {
     
      spriteIndex=3;
      if (this.playerX<width-size/2)
      {

        this.playerX += speed;
        forwardX += 2*speed;
      }
    }

    this.cB.setXY(forwardX, forwardY+25);
    if (this.parentGame.mode==4)
    {
      if (this.level.checkWallCollision() /*|| this.level2.checkWallCollision() */)
      {
        //println("check!");
        // println(this.playerX);
        //  println(oldX);
        this.playerX = oldX;
        this.playerY = oldY;
        this.cB.setXY(this.playerX, this.playerY+25);
      }
    }
    if (this.parentGame.mode==5)
    {
      if (this.level2.checkWallCollision())
      {
        //println("check!");
        // println(this.playerX);
        //  println(oldX);
        this.playerX = oldX;
        this.playerY = oldY;
        this.cB.setXY(this.playerX, this.playerY+25);
      }
    }
    this.cB.setXY(this.playerX, this.playerY+25);
    this.playerF.setXY(this.playerX, this.playerY);
    this.playerS.setXY(this.playerX, this.playerY);
    this.playerB.setXY(this.playerX, this.playerY);
    this.playerSide.setXY(this.playerX, this.playerY);
    this.playerSideL.setXY(this.playerX, this.playerY);

    switch(this.spriteIndex) { 

    case 0: 
      //FrontWalk
      this.cB.setDead(false);
      this.playerS.setDead(true);
      this.playerB.setDead(true);
      this.playerF.setDead(false);
      this.playerSide.setDead(true);
      this.playerSideL.setDead(true);
      break;  

    case 1: 
      //BackWalk
      this.cB.setDead(false);
      this.playerS.setDead(true);
      this.playerB.setDead(false);
      this.playerF.setDead(true);
      this.playerSide.setDead(true);
      this.playerSideL.setDead(true);
      break;

    case 2:
      //left
      this.cB.setDead(false);
      this.playerS.setDead(true);
      this.playerB.setDead(true);
      this.playerF.setDead(true);
      this.playerSide.setDead(true);
      this.playerSideL.setDead(false);

      break;  

    case 3:
      //right
      this.cB.setDead(false);
      this.playerS.setDead(true);
      this.playerB.setDead(true);
      this.playerF.setDead(true);
      this.playerSideL.setDead(true);
      this.playerSide.setDead(false);
      break;

    case 4:
      this.cB.setDead(false);
      this.playerS.setDead(false);
      this.playerB.setDead(true);
      this.playerF.setDead(true);
      this.playerSideL.setDead(true);
      this.playerSide.setDead(true);
      break;
    }  

    
  }

  public void checkMovement(boolean up, boolean down, boolean left, boolean right)
  {
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
  }

  public void levelChange()
  {
    if (this.parentGame.mode==5)
    {
      
      this.playerX = 0;
      this.playerY = 450;
      this.cB.setXY(this.playerX, this.playerY+25);
    this.playerF.setXY(this.playerX, this.playerY);
    this.playerS.setXY(this.playerX, this.playerY);
    this.playerB.setXY(this.playerX, this.playerY);
    this.playerSide.setXY(this.playerX, this.playerY);
    this.playerSideL.setXY(this.playerX, this.playerY);
    }
  }
}