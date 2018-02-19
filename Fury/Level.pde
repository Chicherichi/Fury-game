class Level
{
  private Game parentGame;
  private Player player;
  private Fury main;
  boolean e, q;

  Sprite [] environment, spot, objects, berry, house;

  private ArrayList<Sprite> envir, spots, obj, berries, houseBlocks;

  float colRadius;
  float x;
  float y;
  float size;
  float speed;
  PImage map;
  int playerX;
  int playerY;
  int berryIndex;
  Sprite s, s1, s2, s3, badger, rect, berryBig1, berryBig2, berryBig3, berryBig4, berryBig5, bubble, pauseMenu, textW, resumeG, exit;
  //StopWatch timer;



  Level(Game parentGame, Fury main)
  {

    this.berryIndex = 5;
    this.colRadius= 100;
    this.q =false;
    this.e = false;
    this.main = main;
    this.parentGame = parentGame;
    this.houseBlocks=new ArrayList<Sprite>();
    this.envir = new ArrayList<Sprite>();
    this.spots = new ArrayList<Sprite>();
    this.obj = new ArrayList<Sprite>();
    this.berries = new ArrayList<Sprite>();
    //this.timer = new StopWatch();

    this.badger=new Sprite(this.main, "Badger.png", 1, 2, 90);
    this.badger.setFrameSequence(0, 1, 0.3);
    this.badger.setCollisionRadius(colRadius);
    this.rect = new Sprite(this.main, "Rect.png", 90);
    this.berryBig1= new Sprite(this.main, "berrybig.png", 100);
    this.berryBig2= new Sprite(this.main, "berrybig.png", 100);
    this.berryBig3= new Sprite(this.main, "berrybig.png", 100);
    this.berryBig4= new Sprite(this.main, "berrybig.png", 100);
    this.berryBig5= new Sprite(this.main, "berrybig.png", 100);
    this.bubble= new Sprite (this.main, "bubble.png", 110);

    this.pauseMenu= new Sprite(this.main, "rectBl.png", 100);
    this.textW= new Sprite(this.main, "PauseMenuText.png", 110);
    this.resumeG= new Sprite(this.main, "ResumeGameOr.png", 120);
    this.exit= new Sprite(this.main, "ExitOr.png", 120);

    this.drawMap();
  }


  public void setPlayer(Player player)
  {
    this.player = player;
  }


  public void update()
  {
    background(133, 185, 186);

    this.pauseMenu.setDead(true);     
    this.textW.setDead(true);
    this.resumeG.setDead(true);
    this.exit.setDead(true);
    //tint(255, 50);
    //image(this.bg, 0, 0);
    //tint(255, 255);
    fill(0);
    this.rect.setXY(width/2, 25);
    this.berryBig1.setXY(850, 25);
    this.berryBig2.setXY(900, 25);
    this.berryBig3.setXY(950, 25);
    this.berryBig4.setXY(1000, 25);
    this.berryBig5.setXY(1050, 25);
    this.bubble.setXY( 230, 190);
    this.bubble.setDead(true);



    if (this.player.playerF.cc_collision(this.badger))
    {
      this.bubble.setDead(false);
    }

    this.badger.setXY(240, 250);


    if (this.e)
    {
      for (int i = 0; i < this.berry.length; i++) 
      {
        if (this.player.playerF.bb_collision(this.berry[i])) 
        {
          float px = (float) this.player.playerF.getX();
          float py = (float) this.player.playerF.getY();
          float vx = (float) this.player.playerF.getVelX();
          float vy = (float) this.player.playerF.getVelY();
          px -= 3 * vx * 0.1/*deltaTime*/;
          py -= 3 * vy * 0.1/*deltaTime*/;
          this.player.playerF.setXY(px, py);
          this.player.playerF.setVelXY(0, 0);

          this.berry[i].setVisible(false);
          this.berryIndex++;
        }
      }
    }

    if (this.q)
    {

      this.pauseMenu.setDead(false);     
      this.textW.setDead(false);
      this.resumeG.setDead(true);
      this.exit.setDead(true);

      this.pauseMenu.setXY(width/2, height/2);
      this.textW.setXY(width/2, height/2);
      this.resumeG.setXY(width/2, height/2);
      this.exit.setXY(width/2, height/2);
      //resumeGame
      if (mouseX > 650 && mouseX < 1250 && mouseY > 350 && mouseY <450)
      {
        this.resumeG.setDead(false);
      }
      //exit
      if (mouseX > 650 && mouseX < 1250 && mouseY > 500 && mouseY <600)
      {
        this.exit.setDead(false);
      }
    }



    switch (this.berryIndex)
    {
    case 0:
      this.berryBig1.setDead(true);
      this.berryBig2.setDead(true);
      this.berryBig3.setDead(true);
      this.berryBig4.setDead(true);
      this.berryBig5.setDead(true);
      break;
    case 1:
      this.berryBig1.setDead(false);
      this.berryBig2.setDead(true);
      this.berryBig3.setDead(true);
      this.berryBig4.setDead(true);
      this.berryBig5.setDead(true);
      break;
    case 2:
      this.berryBig1.setDead(false);
      this.berryBig2.setDead(false);
      this.berryBig3.setDead(true);
      this.berryBig4.setDead(true);
      this.berryBig5.setDead(true);
      break;
    case 3:
      this.berryBig1.setDead(false);
      this.berryBig2.setDead(false);
      this.berryBig3.setDead(false);
      this.berryBig4.setDead(true);
      this.berryBig5.setDead(true);
      break;
    case 4:
      this.berryBig1.setDead(false);
      this.berryBig2.setDead(false);
      this.berryBig3.setDead(false);
      this.berryBig4.setDead(false);
      this.berryBig5.setDead(true);
      break;
    case 5:
      this.berryBig1.setDead(false);
      this.berryBig2.setDead(false);
      this.berryBig3.setDead(false);
      this.berryBig4.setDead(false);
      this.berryBig5.setDead(false);
      break;
    }

    //Umwandlung von AL zu Array für schnellere Verarbeitung
    environment = envir.toArray(new Sprite[envir.size()]);
    spot = spots.toArray(new Sprite[spots.size()]);
    objects = obj.toArray( new Sprite[obj.size()]);
    berry = berries.toArray ( new Sprite[berries.size()]);
    house= houseBlocks.toArray( new Sprite[houseBlocks.size()]);

    this.enterLvl2();
    //float elapsedTime = (float) this.timer.getElapsedTime();
    //S4P.updateSprites(elapsedTime);
    //S4P.drawSprites();
  }

  public void drawMap()
  {
    PImage map = loadImage("map1.png");
    //Sprite s;
    for (int y = 25; y < width; y += 50) 
    {
      for (int x = 25; x < width; x += 50) 
      {
        int c = map.get(x, y) & 0x00ffffff;
        int r = (c >> 16) & 0xff;
        int g = (c >> 8) & 0xff;
        int b = c & 0xff;
        if (b == 255)
        {
          s = new Sprite(this.main, "Block.png", 0);
          s.setXY(x, y);
          this.envir.add(s);
        } else if (r == 255) 
        {
          s = new Sprite(this.main, "haufen.png", 0);
          s.setXY(x, y);
          this.spots.add(s);
        } else if (g == 255) 
        {
          s = new Sprite(this.main, "haufen.png", 1);
          s1 = new Sprite (this.main, "berry.png", 0);
          s.setXY(x, y);
          s1.setXY(x, y);
          this.obj.add(s);
          this.berries.add(s1);
        }
      }
    }
  }        




  public boolean checkWallCollision()
  {
    for (int i = 0; i < this.environment.length; i++) 
    {
      if ((this.player.cB.bb_collision(this.environment[i]) && !this.environment[i].isDead()) || this.player.cB.bb_collision(this.badger)) 
      {
        return true;
        //println(this.environment[i]);
      }
    }
    return false;
  }

  public void checkCollisions() 
  {
    //Kollision Verstecke
    for (int i = 0; i < this.objects.length; i++) 
    {
      if (this.player.cB.bb_collision(this.objects[i])) 
      {
        //this.environment[i].setVisible(false);
        float px = (float) this.player.playerF.getX();
        float py = (float) this.player.playerF.getY();
        float vx = (float) this.player.playerF.getVelX();
        float vy = (float) this.player.playerF.getVelY();
        px -= 3 * vx * 0.1/*deltaTime*/;
        py -= 3 * vy * 0.1/*deltaTime*/;
        this.player.playerF.setXY(px, py);
        this.player.playerF.setVelXY(0, 0);
        this.objects[i].setVisible(false);
      }
    }
    //Kollision Haufen
    for (int i = 0; i < this.spot.length; i++) 
    {
      if (this.player.cB.bb_collision(this.spot[i])) 
      {
        //this.environment[i].setVisible(false);
        float px = (float) this.player.playerF.getX();
        float py = (float) this.player.playerF.getY();
        float vx = (float) this.player.playerF.getVelX();
        float vy = (float) this.player.playerF.getVelY();
        px -= 3 * vx * 0.1/*deltaTime*/;
        py -= 3 * vy * 0.1/*deltaTime*/;
        this.player.playerF.setXY(px, py);
        this.player.playerF.setVelXY(0, 0);
        this.spot[i].setVisible(false);

        //this.obj.get(i);
        //this.obj.remove(i);
      }
    }
    //Kollision Dachs
    //if (this.player.cB.bb_collision(this.badger)) 
    //{
    //  float px = (float) this.player.playerF.getX();
    //  float py = (float) this.player.playerF.getY();
    //  float vx = (float) this.player.playerF.getVelX();
    //  float vy = (float) this.player.playerF.getVelY();
    //  px -= 3 * vx * 0.1;
    //  py -= 3 * vy * 0.1;
    //  this.player.playerF.setXY(px, py);
    //  this.player.playerF.setVelXY(0, 0);
    //  this.player.speed = 0;
    //}
  }


  public void checkE(boolean e)
  { 
    this.e=e;
  }

  public void checkQ(boolean q)
  {
    this.q=q;
  }

  public void enterLvl2()
  {
    if (this.berryIndex == 5)
    {
      for (int i = 0; i < this.environment.length; i++) 
      {
        this.environment[127].setDead(true);
        this.environment[147].setDead(true);
      }
    }
  }

  public void killSprites()
  {
    this.berryBig1.setDead(true);
    this.berryBig2.setDead(true);
    this.berryBig3.setDead(true);
    this.berryBig4.setDead(true);
    this.berryBig5.setDead(true);
    this.badger.setDead(true);
    this.rect.setDead(true);

    this.player.cB.setDead(true);
    this.player.playerS.setDead(true);
    this.player.playerB.setDead(true);
    this.player.playerF.setDead(true);
    this.player.playerSide.setDead(true);
    this.player.playerSideL.setDead(true);

    for (int i = 0; i < this.spot.length; i++) 
    {
      this.spot[i].setDead(true);
    }
    for (int i = 0; i < this.objects.length; i++) 
    {
      this.objects[i].setDead(true);
    }
    for (int i = 0; i < this.environment.length; i++) 
    {
      this.environment[i].setDead(true);
    }
    for (int i = 0; i < this.berry.length; i++) 
    {
      this.berry[i].setDead(true);
    }
  }

  public void reviveSprites()
  {
    this.berryBig1.setDead(false);
    this.berryBig2.setDead(false);
    this.berryBig3.setDead(false);
    this.berryBig4.setDead(false);
    this.berryBig5.setDead(false);
    this.badger.setDead(false);

    this.player.cB.setDead(false);
    this.player.playerS.setDead(false);
    this.player.playerB.setDead(false);
    this.player.playerF.setDead(false);
    this.player.playerSide.setDead(false);
    this.player.playerSideL.setDead(false);

    for (int i = 0; i < this.spot.length; i++) 
    {
      this.spot[i].setDead(false);
    }
    for (int i = 0; i < this.objects.length; i++) 
    {
      this.objects[i].setDead(false);
    }
    for (int i = 0; i < this.environment.length; i++) 
    {
      this.environment[i].setDead(false);
    }
    for (int i = 0; i < this.berry.length; i++) 
    {
      this.berry[i].setDead(false);
    }
  }



  public void nextMode()
  {
    if (this.player.playerX>width-50)
    {
      this.parentGame.mode = 5;
    }
  }

  public void checkMousePressed()
  {
    //resumeGame
    if (mouseX > 650 && mouseX < 1250 && mouseY > 350 && mouseY <450)
    {
      this.q=false;
    }
    //exit
    if (mouseX > 650 && mouseX < 1250 && mouseY > 500 && mouseY <600)
    {
      this.parentGame.level= null;
      this.pauseMenu.setDead(true);     
      this.textW.setDead(true);
      this.resumeG.setDead(true);
      this.exit.setDead(true);
      this.q=false;
      killSprites();
      this.parentGame.mode = 1;
      
    }
  }
}