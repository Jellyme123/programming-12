int a;
int r;
int t;
int time;

int mode;

final int FIRST=0;
final int SECOND=1;
final int THIRD=2;
final int PAUSE=3;

color cyan=#3BBCCF;
color grape=#9D708F;
color orange=#FF9B5E;
color fanta=#FFBD73;
color weird=#D9DC88;
color lgreen=#CCD918;



void setup(){
  size(800,800);
  textAlign(CENTER,CENTER);
  rectMode(CENTER);
  mode= FIRST;
  float a=0;
  r=0;
  t=255;
  time=0;
}

void draw(){
  if(mode== FIRST){
   one();
 } else if (mode==SECOND){
   two();
 } else if (mode==THIRD){
   three();
 }else if(mode==PAUSE){
   pause();
 }else{
   println("Mode Error: Mode is "+mode);
 }
  
}
