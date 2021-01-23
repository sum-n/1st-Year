class Player{
  int xpos, ypos, width, height;
  color playercolor = color(0);
  
  Player(int screen_x, int screen_y, int pwidth, int pheight){
    xpos=screen_x; ypos=screen_y;
    width=pwidth; height=pheight;
  }
  void move(int x){
    if(x>SCREENX-width) xpos = SCREENX-width;
    else xpos=x;
  }
  int x(){
    return xpos;
  }
  
  int y(){
    return ypos;
  }
  void draw(){
   fill(playercolor);
   rect(xpos, ypos, width, height);
  }
}
