class FPlayer extends FBox{
  FPlayer(){
    super(gridSize,gridSize);
    setPosition(600,600);
    setFillColor(red);
  }
  
  void act(){
    float vx = player.getVelocityX();
  float vy = player.getVelocityY();
  
  if (wkey) vy = -700;
  if (skey) vy = 700;
  if (akey) vx = -200;
  if (dkey) vx = 200;
   player.setVelocity(vx, vy);
  }
}
