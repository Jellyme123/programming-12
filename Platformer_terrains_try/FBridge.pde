class FBridge extends FGameObject{
  
  float timer;
  float X,Y;
  
  FBridge(float x, float y){
    
    super();
    setPosition(x,y);
    setName("musicbox");
    attachImage(musicbox);
    setRotatable(false);
    setStatic(true);
    timer=0;
    X=x;
    Y=y;
    
  }
  
  void act(){
    if (isTouching("player")&& timer<3){
      timer=timer+0.2;
       //println("afs");
      setStatic(false);
      setSensor(true);  
    }else{
      timer=0;
      setStatic(true);
      
      setPosition(X,Y);
      
    }
  }
}
