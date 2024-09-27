class Mover{
  float x,y,d;
  
  //constructor
  Mover(){
    x=width/2;
    y=width/2;
  }
  
  void show(){
    stroke(0);
    fill(255);
    circle(x,y,d);
    
  }
  
  void act(){
    d=random(10,100);
    x=x+random(-2,2);
    y=y+random(-2,2);
  }
  
  
}
