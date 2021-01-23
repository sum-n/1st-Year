class Alien {
  Bomb getBomb; 
  int x, y, direction;
  int width = 30, height = 30;
  int status;
  PImage normalImg, explodeImg;

  Alien (int xpos, int ypos, PImage spacerImg, PImage explodingImg) { 
    x = xpos;
    y = ypos;
    status = ALIEN_ALIVE;
    normalImg = spacerImg; 
    explodeImg = explodingImg; 
    direction = FORWARD;
    
    theBomb = null;
  }

  void move() { 
    if (direction == FORWARD) {
      if (x + normalImg.width < SCREENX-1) x++;
      else {
        direction=BACKWARD; 
        y += normalImg.height + GAP;
      }
    } else if (x>0) x--; 
    else {
      direction = FORWARD;
      y += normalImg.height + GAP;
    } 
    if(theBomb!=null) {
      theBomb.move();
      if(theBomb.offScreen())
      theBomb = null;
    } 
    else if(status == ALIEN_ALIVE) { 
      if(random(2, 100) <100)
      theBomb = new Bomb(x+15,y+13); 
   }
  }

  void draw(){ 
    if(theBomb!=null)
    theBomb.draw();
    
    if (status == ALIEN_ALIVE){
      image(normalImg, x, y, 30, 30);
    }
    else if (status != ALIEN_DEAD){
      image(explodeImg, x, y, 30, 30);
      status++;
    }  
  }  
  void die(){ 
    if (status==ALIEN_ALIVE){
      status++;   
    }
  }
  Bomb getBomb(){
   return theBomb; 
  }
}
