class FPlayer extends FGameObject{
  
  int frame;
  int direction;
  
  
  FPlayer(){
    super();
    frame=0;
    direction=R;
    setName("player");
    setRotatable(false);
    setPosition(600,300);
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
  if(abs(vy)<0.1){
    action=idle;
  }
  if (wkey&& isTouching("brick")) {
    vy = -300;
    
  }
  
  if (skey) {
    vy = 300;
    
  }
  if (akey) {
    vx = -200;
    action=walk;
    direction=L;
  }
  if (dkey) {
    vx = 200;
    action=walk;
    direction=R;
  }
  if(abs(vy)>0.1){
    action=jump;
  }
  player.setVelocity(vx, vy);
  }

  void animate(){
  
  if(frame>= action.length) frame=0;
  if(frameCount%11==0){
    if(direction==R)  attachImage(action[frame]);
    if (direction==L) attachImage(reverseImage(action[frame]));
    frame++;
    }
  }
  
  void collision(){
  if(isTouching("spike")){
     setPosition(0,0);
   }
  }

}
