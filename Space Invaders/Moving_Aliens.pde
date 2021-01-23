Alien theAliens[];
Player thePlayer;
Bullet theBullet;
Bomb theBomb;
boolean gameover = false;
boolean youwin = false;
PImage normalImg, explodeImg, background;

void settings(){ 
  size(SCREENX, SCREENY);
}
void setup(){
  background = loadImage("background.JPEG");
  normalImg= loadImage("spacer.GIF");
  explodeImg = loadImage("exploding.GIF");
  theAliens = new Alien[10];
  theBullet = null;

  noStroke();
  thePlayer = new Player(SCREENX/2, SCREENY- PLAYERHEIGHT-
    MARGIN, PLAYERWIDTH, PLAYERHEIGHT); 
  init_aliens(theAliens, normalImg, explodeImg);
}
void init_aliens(Alien baddies[], PImage okImg, PImage exImg){
  for (int i=0; i<baddies.length; i++) { 
    baddies[i] = new Alien(i*(okImg.width+GAP), 0, okImg, exImg);
  }
}

void draw(){
  if (gameover == false){
    background(background);
    thePlayer.move(mouseX);
    thePlayer.draw();
    if (theBomb!=null){
      theBomb.draw();
    }
    if (theBullet != null){
      theBullet.move();
      theBullet.collide(theAliens);
      theBullet.draw();
    }
    
    int aliensDead = 0;
    for (int i=0; i<theAliens.length; i++){
      if(youwin == false) {
        theAliens[i].move();
        theAliens[i].draw();
        if(theAliens[i].status == ALIEN_DEAD){
          aliensDead++;
        }
        if(aliensDead == theAliens.length) {
          youwin=true;
        }
        Bomb theBomb = theAliens[i].getBomb();
        if (theBomb!=null){
          if (theBomb.collide(thePlayer)){
            gameover = true;
          }
        }
      }
      else{
        textAlign(CENTER, CENTER);
        textSize(50);
        text("You Win!", SCREENX/2, SCREENY/2);
      }
    }
  } else{
    textAlign(CENTER, CENTER);
    textSize(50);
    text("GAME OVER!", SCREENX/2, SCREENY/2);
  }
}

void mousePressed(){
  theBullet = new Bullet(thePlayer.x()+thePlayer.width/2, thePlayer.y());
}
