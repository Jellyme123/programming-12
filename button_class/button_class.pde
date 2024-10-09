button[] mybutton;
PImage picture;

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

int Blue =1;
int Yellow =2;
int Green =3;
int Red =4;
int Orange =5;
int Black=6;
int White=7;


void setup(){
  size(800,800);
  backgroundcolor=black;
  picture=loadImage("frame_0_delay-0.1s.gif");
  mybutton=new button[4];
  mybutton[0]=new button("Blue",200,200,200,200,blue,black);
  mybutton[1]=new button("Green",600,600,100,100,white,orange);
  mybutton[2]=new button("Yellow",200,600,100,100,green, yellow);
  mybutton[3]=new button(picture,400,400,200,100,red,orange);
}

void draw(){
  background(backgroundcolor);
  
  click();
  
  for(int i=0;i<4;i++){
  mybutton[i].show();
  mybutton[i].clicked();
  }
}
