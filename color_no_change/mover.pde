class Mover{
  float x,y;
  
  float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);

  //constructor
  Mover(){
    x=width/2;
    y=width/2;
  }
  
  void show(){
    stroke(0);
   noStroke();
    fill(r,g,b);
    circle(x,y,40);
    
  }
  
  void act(){
    x=x+random(-2,2);
    y=y+random(-2,2);
  }
  
  
}
