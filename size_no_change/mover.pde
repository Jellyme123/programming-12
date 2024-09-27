class Mover{
  float x,y,d;
  
  //constructor
  Mover(){
    x=width/2;
    y=width/2;
    d=random(10,100);
    
  }
  
  void show(){
    stroke(0);
    fill(255);
    
    circle(x,y,d);
    
  }
  
  void act(){
    x=x+random(-3,3);
    y=y+random(-3,3);
  }
  
  
}
