class FPlayer extends FGameObject{
  
  FPlayer(){
    super();
    setName("player");
    setRotatable(false);
    setPosition(700,700);
    setFillColor(red);
  }
  
  void act(){
   handleInput();
   collision();
   animate();
   
  }
  
  void handleInput(){
    float vx = player.getVelocityX();
  float vy = player.getVelocityY();
  if(vy==0){
    action=idle;
  }
  if (wkey) {
    vy = -700;
    
  }
  
  if (skey) {
    vy = 700;
    
  }
  if (akey) {
    vx = -200;
    action=walk;
  }
  if (dkey) {
    vx = 200;
    action=walk;
  }
  if(abs(vy)>0.1){
    action=jump;
  }
  player.setVelocity(vx, vy);
  }
}
void animate(){
  
  if(frame>=action.length) frame=0;
  
  if(attachImage%5==0){
    attachImage(action[frame]);
    frame++;
  }
}
void collision(){
  if(isTouching("spike")){
     setPosition(0,0);
   }
}
