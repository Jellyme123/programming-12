import fisica.*;
FWorld world;
color blue =#18a8f5;
color yellow =#f7e00f;
color green =#3afa0f;
color red =#f55442;
color orange =#f7a414;
color black=#000000;
color white=#FFFFFF;


boolean wkey,akey,skey,dkey,upkey,downkey,rightkey,leftkey;
float vx, vy;



void setup(){
  size(800,800);
 makeWorld();
 world.setGravity(0,900);
 
}

void makeWorld() {
  
  Fisica.init(this);
  world = new FWorld(-2000,-2000,2000,2000);
  world.setGravity(0,900);
  world.setEdges();
}


void draw(){
  //handlePlayerInput();
  background(red);
  leftPlayer();
  world.step();
  
  
  
  
}

void ground(){
  FBox ground= fbox(800,200);
  
}

void leftPlayer(){
  FBox leftPlayer=new FBox(50,50);
  
  //set visuals
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(2);
  leftPlayer.setFillColor(red);
  leftPlayer.setPosition(100,100);
  
  leftPlayer.setDensity(0.2);
  leftPlayer.setFriction(1);
  leftPlayer.setRestitution(1);
   float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  if(wkey) leftPlayer.setVelocity(left_vx,-100);
  if(akey) leftPlayer.setVelocity(-100,left_vx);
  
  world.add(leftPlayer);
}


void rightPlayer(){
  FBox rightPlayer=new FBox(50,50);
  
  
  //set visuals
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(2);
  rightPlayer.setFillColor(red);
  
  rightPlayer.setDensity(0.2);
  rightPlayer.setFriction(1);
  rightPlayer.setRestitution(1);
  
}


void keyPressed(){
if(key=='w'||key=='W') wkey=true;
if(key=='a'||key=='A') akey=true;
if(key=='s'||key=='S') skey=true;
if(key=='d'||key=='D') dkey=true;
if(keyCode==UP) upkey=true;
if(keyCode==DOWN)downkey=true;
if(keyCode==LEFT) leftkey=true;
if(keyCode==RIGHT) rightkey=true;

}

void keyReleased(){
  if(key=='w'||key=='W') wkey=false;
if(key=='a'||key=='A') akey=false;
if(key=='s'||key=='S') skey=false;
if(key=='d'||key=='D') dkey=false;
if(keyCode==UP) upkey=false;
if(keyCode==DOWN)downkey=false;
if(keyCode==LEFT) leftkey=false;
if(keyCode==RIGHT) rightkey=false;
  
}
