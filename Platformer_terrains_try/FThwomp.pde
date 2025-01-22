class FThwomp extends FGameObject{
   int speed= 300;
   int direction= Down;
   int form;
   float X,Y;
   //float timer;
   
  FThwomp(float x, float y){
    
     super(2*gridSize,2*gridSize);
    setPosition(x+gridSize/2,y+gridSize/2);
    setName("thwomp");
    
     setStatic(true);
    setRotatable(false);
    X=x;
    Y=y;
    
    form =1;
    
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
    if(getX()!=X-gridSize/2) setPosition(X+gridSize/2,getY());
    collide();
    //move();
    statechange();
  }
  
  void statechange(){
    if (player.getY()>getY() && player.getY()<getY()+10*gridSize && abs(getX()-player.getX())<gridSize) {
        form=2;
      }
      
      if(form==1){
        attachImage(Thwomp[0]);
      }
      if (form==2) {
      setStatic(false);
      attachImage(Thwomp[1]);
    }
    
    if (isTouching("thwompsensor")) {
      form=3;
    }
    if (form==3) {
      setVelocity(0, -200);
      attachImage(Thwomp[0]);
      if (dist(getX(), getY(), X, Y) < 5) {
        form=1;
      }
    }

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
      
        player.lives--;
        player.setPosition(pix,piy);
      
    }
  }
  
 
}
