button mybutton;
boolean mouseReleased;
boolean wasPressed;

color blue =#18a8f5;
color yellow =#f7e00f;
color green =#3afa0f;
color red =#f55442;
color orange =#f7a414;
color black=#000000;
color white=#FFFFFF;

int backgroundcolor;




void setup(){
  size(800,800);
  backgroundcolor=black;
  mybutton= new button("hello",200,200,200,200,black,red);
 
  
}

void draw(){
  click();
  background(backgroundcolor);
  mybutton.show();
  mybutton.clicked();
}
