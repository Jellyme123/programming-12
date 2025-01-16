class FThwomp extends FGameObject{
   int speed= 300;
   int direction= Down;
   float X,Y;
   //float timer;
   
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
    /*
    if(thwomptimer=true) {
      timer=timer+0.1;
    }else{
      timer=0;
    }
    */
    
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
    if(isTouching("thwompsensor")){
     thwompwake=false;
     thwomptimer=false;
     println("abc");
   }else{
     thwompwake=true;
   }
   
    if(player.getY()-200>getY() && thwompwake==true /*&& timer>3*/){
      setStatic(false);
    setVelocity(0,speed*direction);
    }else if(thwompwake==false){
      setVelocity(0,speed*-1*direction);
    }
}
}
