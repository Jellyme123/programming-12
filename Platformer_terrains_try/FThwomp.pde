class FThwomp extends FGameObject{
   int speed= 100;
   int direction= Down;
   
  FThwomp(float x, float y){
     super();
    setPosition(x,y);
    setName("thwomp");
     setStatic(true);
    setRotatable(false);
    
    
  }
  
  
  void act(){
    //animate();
    collide();
    move();
  }
  
  
  void collide(){
    if(isTouching("wall")){
      //if(getY()-gridSize/2){
      direction *=Down;
      setPosition(getX(), getY()+ direction);
      
      //}
    }
    
    if(isTouching("player")){
      if(player.getY()<getY()-gridSize){
        player.lives--;
        player.setPosition(600,600);
      }
    }
  }
  
  void move(){
    
    float vx= getVelocityX();
    if(player.getY()>getY() && player.getX() == getX()){
      setStatic(false);
    setVelocity(vx,speed*direction);
    
    }
  }
  
}
