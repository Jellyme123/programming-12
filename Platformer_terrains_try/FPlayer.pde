class FPlayer extends FGameObject{
  
  FPlayer(){
    super();
    setName("player");
    setRotatable(false);
    setPosition(600,600);
    setFillColor(red);
  }
  
  void act(){
   handleImput();
   if(isTouching("spike")){
     setPosition(0,0);
   }
  }
  
  void handleImput(){
    float vx = player.getVelocityX();
  float vy = player.getVelocityY();
  
  if (wkey) vy = -700;
  if (skey) vy = 700;
  if (akey) vx = -200;
  if (dkey) vx = 200;
  player.setVelocity(vx, vy);
  }
}
