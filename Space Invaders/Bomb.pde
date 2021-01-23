class Bomb{
  int width = 20, height = 10;
  float x, y;
  color bombColor = color (0);
  
  Bomb(float xpos, float ypos){ 
    x = xpos; 
    y = ypos;

  }
 
  void move(){
    y+=0.5;
  }
  
  boolean offScreen(){
    return y>=SCREENY;
  }
  
  void draw(){ 
    fill(bombColor); 
    ellipse(x, y, width, width);
  }
  
  boolean collide(Player thePlayer){
    return (x+width> thePlayer.xpos && x< thePlayer.xpos + thePlayer.width 
    && y+height> thePlayer.ypos && y< thePlayer.ypos + thePlayer.height);
  }
}
