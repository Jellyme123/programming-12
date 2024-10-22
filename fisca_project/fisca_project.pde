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

FBox rightPlayer;
FBox leftPlayer;

void setup(){
 size(800,800);
 makeWorld();
 world.setGravity(0,900);
 ground();
 leftPlayer();
 rightPlayer();
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld(-2000,-2000,2000,2000);
  world.setGravity(0,900);
  world.setEdges();
}

void draw(){
  //handlePlayerInput();
  background(0);
  handlePlayerInput();
  //leftPlayer();
  world.step();
  world.draw();
  
  //if(hitGround(leftGround)){
    
  //}
  
  //if(){
    
  //}
}

void ground(){
  FBox ground= new FBox(800,200);
  
  ground.setStrokeWeight(2);
  ground.setStroke(0);
  ground.setFillColor(red);
  ground.setStatic(true);
  
  ground.setPosition(400,700);
  
  world.add(ground);
}

void leftPlayer(){
  leftPlayer=new FBox(50,50);
  //set visuals
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(2);
  leftPlayer.setFillColor(red);
  leftPlayer.setPosition(100,100);
  
  //leftPlayer.setDensity(0.2);
  //leftPlayer.setFriction(1);
  //leftPlayer.setRestitution(1);
  
  world.add(leftPlayer);
}

void rightPlayer(){
  rightPlayer=new FBox(50,50);
  
  //set visuals
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(2);
  rightPlayer.setFillColor(white);
  rightPlayer.setPosition(200,100);
  
  world.add(rightPlayer);
}

void handlePlayerInput(){
  float left_vx = rightPlayer.getVelocityX();
  float left_vy = rightPlayer.getVelocityY();
  float right_vx = leftPlayer.getVelocityX();
  float right_vy = leftPlayer.getVelocityY();
  if(wkey) leftPlayer.setVelocity(left_vy,-1000);
  if(akey) leftPlayer.setVelocity(-100,left_vx);
  if(dkey) leftPlayer.setVelocity(100,left_vx);
  
  
  if(upkey) rightPlayer.setVelocity(right_vy,-1000);
  if(leftkey) rightPlayer.setVelocity(-100,right_vx);
  if(rightkey) rightPlayer.setVelocity(100,right_vx);
}

void keyPressed(){
if(key=='w'||key=='W') wkey=true;
if(key=='a'||key=='A') akey=true;
if(key=='s'||key=='S') skey=true;
if(key=='d'||key=='D') dkey=true;
if(keyCode==UP) upkey=true;
if(keyCode==DOWN) downkey=true;
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


boolean touchground(FBox ground){
  ArrayList<FContact> contactList=ball.getContacts();
}
