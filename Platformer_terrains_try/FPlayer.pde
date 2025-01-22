class FPlayer extends FGameObject{
  
  int frame;
  int direction;
  int lives;
 
  
  FPlayer(){
    super(gridSize,gridSize);
    frame=0;
    lives=3;
    direction=R;
    setName("player");
    setRotatable(false);
    setDensity(0.01);
    setPosition(pix,piy);
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
  if (wkey && isTouching("brick") || wkey && isTouching("tree")|| wkey && isTouching("musicbox")||  wkey && isTouching("wall")) {
    if(player.getY()>getY()-gridSize/2){
    vy = -400;
    }
  }
  
  if (skey) {
    vy = 400;
    
  }
  if (akey) {
    vx = -290;
    action=walk;
    direction=L;
  }
  if (dkey) {
    vx = 290;
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
     setPosition(pix,piy);
   }
   if(isTouching("lava")){
     setPosition(pix,piy);
   }
   if(isTouching("hammer")){
      setPosition(50,200);
   }
   
  }
}
