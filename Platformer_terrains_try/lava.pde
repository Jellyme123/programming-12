class FLava extends FGameObject{
 
  int frame=0;
  
  FLava(float x, float y){
    super();
    setPosition(x,y);
    setName("lava");
    
  }
  
  void act(){
    animate();
    collide();
    
  }
  
  void animate(){
    if(frame >= lava.length) frame=0;
    if(frameCount%5 ==0){
      attachImage(lava[frame]);
      frame++;
    }
  }
  
  void collide(){
    if(isTouching("player")){
      if(player.getY()<getY()-gridSize/2){
         player.lives--;
      player.setVelocity(player.getVelocityX(),-600);
      }
    }
  }
  
}
