class FBridge extends FGameObject{
  FBridge(float x, float y){
    
    super();
    setPosition(x,y);
    setName("bridge");
    attachImage(bridge);
    setStatic(true);
  }
  
  void act(){
    if (isTouching("player")){
       println("afs");
      setStatic(false);
      setSensor(true);  
    }
  }
}
