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
   
    circle(x,y,100);
    
  }
  
  void act(){
    float r=random(0,255);
  float g=random(0,255);
  float b=random(0,255);
  
    fill(r,g,b);
    x=x+random(-2,2);
    y=y+random(-2,2);
  }
  
  
}
