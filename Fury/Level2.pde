class Level2
{
  private Game parentGame;
  private Menu menu;
  private Player player;
  private Fury main;
  private ArrayList<Sprite> envir, houseBlocks, steak, box;
  Sprite [] environment, house, steaks, boxes;
  Sprite s, s1, sB, man, woman, kid, fire, doggo, bubble, pauseMenu, textW, resumeG, exit, rect, steak1, steak2, steak3, steak4, 
    steak5, cB1, cB2, cB3, cBdown3, cB1rechts, cB2links, cB2rechts, cB3links, cB3rechts;
  PImage map2, woodfloor, bench, bowl, bed;
  StopWatch timer;
  int playerX;
  int playerY ;
  boolean e, q;
  boolean boxOpen=false;
  int steakIndex, eIndex;
  
  int timeIntervalcB1=1500;
  int lastTimeCheck;

  Level2(Game parentGame, Fury main, Menu menu)
  {
    this.q =false;
    this.e = false;
    this.lastTimeCheck=millis();
    this.steakIndex= 4;
    this.eIndex=0;
    this.main = main;
    this.parentGame = parentGame;
    this.timer=new StopWatch();
    this.menu=menu;
    this.box=new ArrayList<Sprite>();
    this.steak=new ArrayList<Sprite>();
    this.houseBlocks=new ArrayList<Sprite>();
    this.envir = new ArrayList<Sprite>();
    this.woodfloor= loadImage("woodfloor.png");
    this.fire=new Sprite(this.main, "bonfire.png", 1, 3, 90);
    this.fire.setFrameSequence(0, 2, 0.2);

    this.man=new Sprite(this.main, "human1.png", 1, 2, 100);
    this.man.setFrameSequence(0, 1, 1.5);
    this.woman=new Sprite(this.main, "human2.png", 1, 4, 100);
    this.woman.setFrameSequence(0, 3, 1);
    this.kid=new Sprite(this.main, "human3.png", 1, 4, 100);
    this.kid.setFrameSequence(0, 3, 1.5); 
    this.cB1=new Sprite(this.main, "human1cB.png", 1, 1, 90);
    this.cB1.setFrameSequence(0, 3, 1.5);
    this.cB2=new Sprite(this.main, "human2cB.png", 1, 1, 90);
    this.cB3=new Sprite(this.main, "human3cB.png", 1, 1, 90);
    //this.cBdown1=new Sprite(this.main, "collisionBox.png", 1, 1, 110);
    //this.cBdown2=new Sprite(this.main, "collisionBox.png", 1, 1, 110);
    this.cBdown3=new Sprite(this.main, "collisionBox.png", 1, 1, 110);
    this.cB1rechts=new Sprite(this.main, "human3cBquer.png", 1, 1, 110);
    this.cB2links=new Sprite(this.main, "human2cBquer.png", 1, 1, 110);
    this.cB2rechts=new Sprite(this.main, "human1cBquer.png", 1, 1, 110);
    this.cB3links=new Sprite(this.main, "human3cBquer.png", 1, 1, 110);
    this.cB3rechts=new Sprite(this.main, "human2cBquer.png", 1, 1, 110);


    this.doggo= new Sprite(this.main, "doggo.png", 1, 7, 90);
    this.doggo.setFrameSequence(0, 6, 0.5);
    this.doggo.setCollisionRadius(150);
    this.bubble= new Sprite(this.main, "bubbleDog.png", 100);
    this.bed=loadImage("bed.png");
    this.bowl=loadImage("bowl.png");
    this.bench=loadImage("bench.png");

    this.rect = new Sprite(this.main, "Rect.png", 90);
    this.steak1= new Sprite(this.main, "meatBig.png", 100);
    this.steak2= new Sprite(this.main, "meatBig.png", 100);
    this.steak3= new Sprite(this.main, "meatBig.png", 100);
    this.steak4= new Sprite(this.main, "meatBig.png", 100);
    this.steak5= new Sprite(this.main, "meatBig.png", 100);

    this.pauseMenu= new Sprite(this.main, "rectBl.png", 100);
    this.textW= new Sprite(this.main, "PauseMenuText.png", 110);
    this.resumeG= new Sprite(this.main, "ResumeGameOr.png", 120);
    this.exit= new Sprite(this.main, "ExitOr.png", 120);

    this.drawMap2();
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

    this.rect.setXY(width/2, 25);
    this.steak1.setXY(850, 25);
    this.steak2.setXY(900, 25);
    this.steak3.setXY(950, 25);
    this.steak4.setXY(1000, 25);
    this.steak5.setXY(1050, 25);



    image(this.woodfloor, 1130, 500);
    this.menu.butterfly.setDead(true);
    image(this.bench, 850, 400);
    image(this.bed, 1750, 500);
    image(this.bed, 1750, 400);
    image(this.bed, 1750, 600);
    image(this.bowl, 750, 500);

    this.cB1.setXY(1400, 520);
    this.cB2.setXY(1250, 475);
    this.cB3.setXY(850, 700);
    this.cB1rechts.setXY(1600, 230);
    this.cB2links.setXY(820, 95);
    this.cB2rechts.setXY(1550, 95);
    this.cB3links.setXY(630, 900);
    this.cB3rechts.setXY(1260, 900);
    this.cBdown3.setXY(850, 940);
    this.man.setXY(1400, 200);
    this.woman.setXY(1250, 60);
    this.kid.setXY(850, 900);
    this.cB1.setDead(true);
    this.cB2.setDead(true);
    this.cB3.setDead(true);
    this.cB1rechts.setDead(true);
    this.cB2links.setDead(true);
    this.cB2rechts.setDead(true);
    this.cB3links.setDead(true);
    this.cB3rechts.setDead(true);

    this.fire.setXY(850, 500);
    this.doggo.setXY(295, 75);
    this.bubble.setXY(295, 60);
    this.bubble.setDead(true);

    boxes = box.toArray(new Sprite[box.size()]);
    steaks = steak.toArray(new Sprite[steak.size()]);
    environment = envir.toArray(new Sprite[envir.size()]);
    house= houseBlocks.toArray( new Sprite[houseBlocks.size()]);

    for (int i = 0; i < this.steaks.length; i++)
    {
      this.steaks[i].setDead(true);
    }

    /*float elapsedTime = (float) this.timer.getElapsedTime();
     S4P.updateSprites(elapsedTime);
     S4P.drawSprites();*/
    if (this.player.cB.cc_collision(this.doggo))
    {
      this.bubble.setDead(false);
    }


    //if (this.e)
    //{
    //    for (int i = 0; i < this.boxes.length; i++) 
    //    {
    //      if (this.player.playerF.bb_collision(this.boxes[i])) 
    //      {

    //        this.boxes[i].setFrameSequence(1, 1, 0.2);
    //        this.steaks[i].setDead(false);

    //      }
    //    }
    //}

    if (this.e)
    {
      eIndex++;
    }

    if (this.e)
    {
      switch(this.eIndex)
      {
      case 0:

        break;

      case 1:

        for (int i = 0; i < this.boxes.length; i++) 
        {
          if (this.player.playerF.bb_collision(this.boxes[i]) ) 
          {

            this.boxes[i].setFrameSequence(1, 1, 0.2);

            this.steaks[i].setZorder(20);
          }
        }
        break;

      case 2:
        break;

      case 3:

        for (int i = 0; i < this.steaks.length; i++) 

        {
          if (this.player.playerF.bb_collision(this.steaks[i])) 
          {
            this.steaks[i].setDead(false);
            this.steaks[i].setVisible(false);
            this.steakIndex++;
          }
        }
        break;
      }
      if (this.eIndex>2)
      {
        this.eIndex=0;
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

    switch (this.steakIndex)
    {
    case 0:
      this.steak1.setDead(true);
      this.steak2.setDead(true);
      this.steak3.setDead(true);
      this.steak4.setDead(true);
      this.steak5.setDead(true);
      break;
    case 1:
      this.steak1.setDead(false);
      this.steak2.setDead(true);
      this.steak3.setDead(true);
      this.steak4.setDead(true);
      this.steak5.setDead(true);
      break;
    case 2:
      this.steak1.setDead(false);
      this.steak2.setDead(false);
      this.steak3.setDead(true);
      this.steak4.setDead(true);
      this.steak5.setDead(true);
      break;
    case 3:
      this.steak1.setDead(false);
      this.steak2.setDead(false);
      this.steak3.setDead(false);
      this.steak4.setDead(true);
      this.steak5.setDead(true);
      break;
    case 4:
      this.steak1.setDead(false);
      this.steak2.setDead(false);
      this.steak3.setDead(false);
      this.steak4.setDead(false);
      this.steak5.setDead(true);
      break;
    case 5:
      this.steak1.setDead(false);
      this.steak2.setDead(false);
      this.steak3.setDead(false);
      this.steak4.setDead(false);
      this.steak5.setDead(false);
      break;
    }

    this.enterEndscreen();
    this.viewCollision();
  }

  public boolean checkWallCollision()
  {
    for (int i = 0; i < this.environment.length; i++) 
    {
      if (this.player.cB.bb_collision(this.environment[i]) && !this.environment[i].isDead() || this.player.cB.bb_collision(this.doggo)) 
      {
        return true;
      }
    }

    for (int i = 0; i < this.house.length; i++) 
    {
      if (this.player.cB.bb_collision(this.house[i])) 
      {
        return true;
      }
    }

    for (int i = 0; i < this.boxes.length; i++) 
    {
      if (this.player.cB.bb_collision(this.boxes[i])) 
      {
        return true;
      }
    }
    if (this.player.cB.bb_collision(this.cBdown3)) 
    {
      return true;
    }
    if (this.player.cB.bb_collision(this.fire)) 
    {
      return true;
    }
    if (this.player.cB.bb_collision(this.man)) 
    {
      return true;
    }
   if (this.player.cB.bb_collision(this.woman)) 
    {
      return true;
    }
    // if (this.player.cB.bb_collision(this.cB1rechts) || this.player.cB.bb_collision(this.cB2rechts) || this.player.cB.bb_collision(this.cB2links)
    //  || this.player.cB.bb_collision(this.cB3rechts)  || this.player.cB.bb_collision(this.cB3links)) 
    //{
    //  return true;
    //}

    return false;
  }

  public void drawMap2()
  {
    PImage map2 = loadImage("map2.png");
    //Sprite s;
    for (int y = 25; y < width; y += 50) 
    {
      for (int x = 25; x < width; x += 50) 
      {
        int c = map2.get(x, y) & 0x00ffffff;
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
          sB = new Sprite(this.main, "box.png", 1, 2, 10);
          this.sB.setFrameSequence(0, 0, 0.2);
          sB.setXY(x, y);
          this.box.add(sB);

          s1 = new Sprite(this.main, "meat.png", 0);
          this.s1.setCollisionRadius(100);
          s1.setXY(x, y);
          this.steak.add(s1);
        } else if (g == 255) 
        {
          s = new Sprite(this.main, "woodlock.png", 0);       
          s.setXY(x, y); 
          this.houseBlocks.add(s);
        }
      }
    }
  }



  public void killSprites()
  {
    //this.berryBig1.setDead(true);
    //this.berryBig2.setDead(true);
    //this.berryBig3.setDead(true);
    //this.berryBig4.setDead(true);
    //this.berryBig5.setDead(true);
    this.doggo.setDead(true);
    //this.rect.setDead(true);
    this.man.setDead(true);
    this.woman.setDead(true);
    this.kid.setDead(true);
    this.fire.setDead(true);
    this.player.cB.setDead(true);
    this.player.playerS.setDead(true);
    this.player.playerB.setDead(true);
    this.player.playerF.setDead(true);
    this.player.playerSide.setDead(true);
    this.player.playerSideL.setDead(true);

    for (int i = 0; i < this.house.length; i++) 
    {
      this.house[i].setDead(true);
    }
    for (int i = 0; i < this.boxes.length; i++) 
    {
      this.boxes[i].setDead(true);
    }
    for (int i = 0; i < this.environment.length; i++) 
    {
      this.environment[i].setDead(true);
    }
    for (int i = 0; i < this.steaks.length; i++) 
    {
      this.steaks[i].setDead(true);
    }
  }

  public void reviveSprites()
  {
    //this.berryBig1.setDead(false);
    //this.berryBig2.setDead(false);
    //this.berryBig3.setDead(false);
    //this.berryBig4.setDead(false);
    //this.berryBig5.setDead(false);
    this.doggo.setDead(false);
    //this.rect.setDead(false);
    this.man.setDead(false);
    this.woman.setDead(false);
    this.kid.setDead(false);
    this.fire.setDead(false);
    //this.player.cB.setDead(false);
    //this.player.playerS.setDead(false);
    //this.player.playerB.setDead(false);
    //this.player.playerF.setDead(false);
    //this.player.playerSide.setDead(false);
    //this.player.playerSideL.setDead(false);

    for (int i = 0; i < this.house.length; i++) 
    {
      this.house[i].setDead(false);
    }
    for (int i = 0; i < this.boxes.length; i++) 
    {
      this.boxes[i].setDead(false);
    }
    for (int i = 0; i < this.environment.length; i++) 
    {
      this.environment[i].setDead(false);
    }
    for (int i = 0; i < this.steaks.length; i++) 
    {
      this.steaks[i].setDead(false);
    }
  }

  public void checkE(boolean e)
  { 
    this.e=e;
  }

  public void checkQ(boolean q)
  {
    this.q=q;
  }

  public void enterEndscreen()
  {
    if (this.steakIndex == 5)
    {
      //println("steak!!!");
      for (int i = 0; i < this.environment.length; i++) 
      {

        this.environment[2].setDead(true);
        this.environment[3].setDead(true);
      }
    }
  }

public void viewCollision ()
{
    if ( millis() > lastTimeCheck + timeIntervalcB1 ) {
    lastTimeCheck = millis();
   this.cB1.setDead(false);
  }
   
    
    
   //if (millis() - time >= 1500) {
   //   this.cB1.setDead(false);
   // }
    
    
   if (this.player.cB.bb_collision(this.cB1rechts) || this.player.cB.bb_collision(this.cB2rechts) || this.player.cB.bb_collision(this.cB2links)
      || this.player.cB.bb_collision(this.cB3rechts)  || this.player.cB.bb_collision(this.cB3links) || this.player.cB.bb_collision(this.cB1)
      || this.player.cB.bb_collision(this.cB2) || this.player.cB.bb_collision(this.cB3)) 
    {
      this.player.playerX= 400;
      this.player.playerY= 500;
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