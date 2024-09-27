class Mover{
  float x,y;
  
  //constructor
  Mover(){
    x=width/2;
    y=width/2;
  }
  
  void show(){
    stroke(0);
    fill(255);
    circle(x,y,100);
    
  }
  
  void act(){
    x=x+random(-2,2);
    y=y+random(-2,2);
  }
  
  
}
