class Game {
  PImage playerImage;
  private int mode = 0;
  private Startscreen startscreen;
  private Menu menu = null;
  private Options options = null;
  private Level level = null;
  private Level2 level2 =null;
  private Player player = null;
  private Fury main;
  private Credits credits;
  boolean up, down, left, right, q, e;
  StopWatch timer;

  PFont font;

  Minim m;
  AudioPlayer song;


  Game( Fury main)
  {   
    this.main = main;
    this.startscreen = new Startscreen(this, this.main);
    this.timer = new StopWatch();

    this.m= new Minim(this.main);
    this.song=m.loadFile("SongofStorms.mp3");
    this.song.setGain(-10);

    this.font=loadFont("DoublePixel-7-100.vlw");
  }


  public void update() 
  {
    float elapsedTime = (float) this.timer.getElapsedTime();


    switch(this.mode)
    {
    case 0: 
      this.song.loop(); 
      this.startscreen.update();  
      break;

    case 1: 
      if (this.menu == null)
      {
        this.menu = new Menu(this, this.main);
      }

      this.menu.update();
      this.menu.reviveSprites();    
      break;  

    case 2: 
      if (this.options == null)
      {
        this.options= new Options(this, this.menu);
      }
      this.options.update();
      break;

    case 3:
      if (this.credits == null)
      {
        this.credits=new Credits(this, this.menu);
      }
      this.credits.update();

      break;

    case 4: 
      if (this.level == null)
      {

        this.menu.killSprites();
        this.level = new Level(this, this.main);
        this.player = new Player(this, this.main, this.level, this.level2);
        this.level.setPlayer(this.player);
      }
      // this.level.reviveSprites();
      this.level.update(); 
      this.checkMovement();
      this.player.update(); 
      this.level.checkCollisions();
      this.nextLevel();


      S4P.updateSprites(elapsedTime);
      S4P.drawSprites();
      break;

    case 5:
      if (this.level2 == null)
      {
        //this.level=null; 

        /*this.player.cB.setDead(true);
         this.player.playerS.setDead(true);
         this.player.playerB.setDead(true);
         this.player.playerF.setDead(true);
         this.player.playerSide.setDead(true);
         this.player.playerSideL.setDead(true);*/
        this.level2 = new Level2(this, this.main, this.menu);
        //this.player = new Player(this, this.main, this.level, this.level2);
       this.player.playerX = 40;
        this.player.playerY = 450;
        this.player.setLevel2(level2);
        this.level2.setPlayer(this.player);
      }
      
      this.level.killSprites();
      this.level2.update();
      this.player.update();
      this.checkMovement();
      this.level2.reviveSprites();

      S4P.updateSprites(elapsedTime);
      S4P.drawSprites();
      break;
    }
  }

  public void nextLevel()
  {
    if (this.mode == 4)
    {
      this.level.nextMode();
    }
  }

  public void checkMovement()
  {
    if (this.mode == 4 || this.mode == 5)
    {
      this.player.checkMovement(this.up, this.down, this.left, this.right);
    }
  }

  public void checkE()
  {
    if (this.mode == 4 )
    {
      this.level.checkE(this.e);
    }
    if ( this.mode == 5)
    {
      this.level2.checkE(this.e);
    }
  }

  public void checkQ()
  {
    if (this.mode == 4 )
    {
      this.level.checkQ(this.q);
    }
    if ( this.mode == 5)
    {
      this.level2.checkQ(this.q);
    }
  }


  public void checkKeyPressed()
  {

    switch(this.mode)
    {
    case 0: 
      this.startscreen.checkKeyPressed(); 
      break;
      //case 1: 
      //  this.menu.checkMousePressed(); 
      //  break;
    }

    if (key == 'q')
    {
      this.q=true;
    }

    if (key =='e')
    {
      this.e=true;
    }

    if (key == 'w')
    {
      this.up = true;
    }  
    if (key == 's')
    {
      this.down = true;
    }  
    if (key == 'a')
    {
      this.left = true;
    }  
    if (key == 'd')
    {
      this.right = true;
    }
  }

  public void checkKeyReleased()
  {
    if (key =='e')
    {
      this.e=false;
    }
    if (key =='q')
    {
      this.q=false;
    }

    if (key == 'w')
    {
      this.up = false;
    }  
    if (key == 's')
    {
      this.down = false;
    }  
    if (key == 'a')
    {
      this.left = false;
    }  
    if (key == 'd')
    {
      this.right = false;
    }
  }

  public void checkMousePressed()
  {
    switch(this.mode)
    {
    case 0: 
      this.startscreen.checkKeyPressed(); 
      break;
    case 1: 
      this.menu.checkMousePressed(); 
      break;
    case 2: 
      this.options.checkMousePressed(); 
      break;
    case 3:
      this.credits.checkMousePressed();
      break;
    case 4:
      this.level.checkMousePressed();
      break;
    case 5:
      this.level2.checkMousePressed();
      break;
    }
  }

  //public void nextMode()
  //{
  //  int mode =  this.mode+1;
  //  if (mode > 4)
  //  {
  //    mode = 0;
  //  }
  //  this.setMode(mode);
  //}

  //public void setMode(int mode)
  //{
  //  this.mode = mode;
  //  switch(this.mode)
  //  {
  //  case 1:  
  //    break;

  //  case 2: 
  //    this.options= new Options(this, this.menu); 
  //    break;

  //  case 3: 
  //    this.credits=new Credits(this, this.menu);
  //    break;

  //  case 4: 
  //    break;
  //  }
  //}
}