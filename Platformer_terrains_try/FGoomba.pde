class FGoomba extends FGameObject{
  
  int direction=L;
  int speed= 50;
  int frame=0;
  
  FGoomba(float x, float y){
    super();
    setPoisition(x,y);
    setName("goomba");
    setRotatable(false);
  }
}
