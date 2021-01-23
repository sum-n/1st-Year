class Bullet {
  int width, height, x, y;
  color bulletColor = color (255, 55, 55);
  Bullet(int xpos, int ypos){
    x=xpos; 
    y=ypos;
    width=6; 
    height=15;
  }
    int x(){
      return x;
  }
    int y(){
      return y;
  }
  void move(){
    y-=8;
  }
  
  void draw() { 
    fill(bulletColor); rect(x, y, width, height);
  }
  
  void collide(Alien theAliens[]){
    for(int i=0; i<theAliens.length; i++){
      if(x > theAliens[i].x
        && x < theAliens[i].x+theAliens[i].width
        && y > theAliens[i].y
        && y <theAliens[i].y+theAliens[i].height){
        theAliens[i].die();
        return; 
      }
    }
  }
}
