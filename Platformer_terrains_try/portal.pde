class FPortal extends FGameObject{
  
  
    int frame=0;
  
  FPortal(float x, float y){
    super(gridSize,gridSize);
    setPosition(x,y);
    setName("portal");
  }
  
  void act(){
    animate();
    collide();
    
  }
  
  void animate(){
    if(frame >= Portal.length) frame=0;
    
    if(frameCount%5 ==0){
      attachImage(Portal[frame]);
      frame++;
    }
  }
  
  void collide(){
    if(isTouching("player")){
      if(gameMode==1){
        gameMode=2;
        background(0);
        
      }
      
      
    }
    
   
  }
  void reloadWorld() {
    world.clear();
    for (int i=terrain.size()-1; i>=0; i--) {
      terrain.remove(i);
    }
   loadWorld(terrainmap1);
   
    loadPlayer();
  }
  
}
