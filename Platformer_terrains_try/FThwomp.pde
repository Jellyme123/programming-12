class FThwomp extends FGameObject{
   int speed= 100;
   int direction= Down;
   float X,Y;
   
  FThwomp(float x, float y){
     super();
    setPosition(x,y);
    setName("thwomp");
    
     setStatic(true);
    setRotatable(false);
    X=x;
    Y=y;
    if(x>getX()){
      x=getX()+1;
    }
    if(x<getX()){
      x=getX()-1;
    }
    
  }
  
  
  void act(){
    //animate();
    
    collide();
    move();
  }
  
  
  void collide(){
    if(isTouching("ts")){
      float vx= getVelocityX();
      //if(getY()-gridSize/2){
      direction *=Down;
      setVelocity(vx,speed*direction*-1);
      
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
    if(getX()!=X) setPosition(X,getY());
    float vx= getVelocityX();
    
    if(player.getY()>getY() && thwompwake==true && thwomp.getX()==thwompsensor.getX()){
      setStatic(false);
    setVelocity(0,speed*direction);
    
    }else if(thwompwake==false){
      setVelocity(0,speed*-1*direction);
    }
  }
  
}
