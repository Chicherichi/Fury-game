class Game {
  PImage playerImage;
  private int mode = 0;
  private Startscreen startscreen;
  private Menu menu;
  private Level level;
  private Player player;
  private Fury main;
  boolean up, down, left, right;

  Game( Fury main)
  {
    
    this.main = main;
    this.startscreen = new Startscreen(this);
    this.menu = new Menu(this);
    this.level = new Level(this, this.main);
    this.player = new Player(this, this.main);
  }

  public void update() {

    switch(this.mode)
    {
    case 0: 
      this.startscreen.update(); 
      break;
    case 1: 
      this.menu.update(); 
      break;  
    case 2: 
      this.level.update(); 
      this.checkMovement();
      this.player.update(); 
      break;

      /* case 3: // Gewonnen
       break;
       case 4: // Verloren
       this.addUI();
       text("VERLOREN", 100, 100);
       break;*/
    }
  }

  public void checkMovement()
  {
    this.player.checkMovement(this.up, this.down, this.left, this.right);
  }


  public void checkKeyPressed()
  {
    player.nextSprite();
    switch(this.mode)
    {
    case 0: 
      this.startscreen.checkKeyPressed(); 
      break;
    case 1: 
      this.menu.checkMousePressed(); 
      break;
    case 2: 
      // this.level.checkMovement(); break;
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
      //case 2: this.level.checkMousePressed(); break;
    }
  }

  public void nextMode()
  {
    this.mode++;
    if (this.mode > 2)
    {
      this.mode = 0;
    }
  }
}