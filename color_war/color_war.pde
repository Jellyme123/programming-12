//arrays
int [][]piece;
int [][]player;
int playernumber=1;

int mode;
final int INSTRUCTION=0;
final int GAME=1;
final int END=2;

//keyboard
boolean keyw;
boolean keya;
boolean keys;
boolean keyd;
boolean keyup;
boolean keydown;
boolean keyR;
boolean keyL;

//color of the chess
boolean colorc;
//turn
boolean turnRed;
boolean turnR;
boolean turnB;
boolean turnshift;

//entity variable
float rightx, righty, rightd, leftx, lefty, leftd;

//grid
int linex,liney;

//the star of the chess
int star;

//the highlight variable
int rightH,rightL,leftH,leftL;

color chessboard1=#f0aa41;
color chessboard2=#f5b942;
color battle=#4a16c4;
color red=#ff384c;
color blue=#367cff;
color human=#f2e1c4;

void setup(){
  //arrey
  size(1200,800);
  background(100);
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  mode=GAME;
  
  //man movement
 leftx=100;
 lefty=400;
 leftd=50;
 rightx=1100;
 righty=400;
 rightd=50;
 
 //grid
 linex=200;
 liney=200;
 
 //who's turn?
 float Rnumber=random(0,250);
 if(Rnumber>125){
   turnR=true;
   turnB=false;
 }else{
   turnR=false;
   turnB=true;
 }
}

void draw(){
  if(mode == INSTRUCTION){
    instru();
  }else if (mode == GAME){
    game();
  }else if(mode == END){
    end();
  }
  
}
