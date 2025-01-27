
//import processing.sound.
import fisica.*;

float gameMode=0;


FWorld world;
FPlayer player;

 //int worldtimer=0;


PImage map, water1, brick, treeTrunk, tree, treeIntersect, ltreeend, rtreeend, spike, bridge, trampoline,musicbox,hammer, fireball,bg1,map1,terrainmap1;
PImage[] idle;
PImage[] jump;
PImage[] walk;
PImage[] action;
PImage[] goomba;
PImage[] lava;
PImage[] Thwomp;
PImage[] Hammerbro;
PImage[] Checkpoint;
PImage[] Portal;

int gridSize=32;
float zoom=1.5;

PImage m;

boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
ArrayList <FGameObject> terrain;
ArrayList <FGameObject> enemies;

color white = #FFFFFF;
color black = #000000;
color cyan = #99d9ea;
color treeTrunkBrown = #9c5a3c;
color blue =#18a8f5;
color yellow =#f7e00f;
color green =#00FF00;
color red =#ff0000;
color orange =#ff7e00;
color steel=#bfbebd;
color brown=#994831;
color grey=#b4b4b4;
color wallgrey=#464646;
color portal=#8400ff;
color checkpoint=#51bac2;

color Goombas=#990030;

color pink=#ffa3b1;

color hammerbro=#d3f9bc;
color thwomp= #2f3699;
color thwompsensor= #6f3198;


boolean thwompwake;
boolean thwomptimer;

boolean newworld;


float pix,piy;

float diex,checky;

float checkPointX,checkPointY;


void setup() {
  size(1000, 800);
  frameRate(60);
 newworld=false;
  int life=3;

  pix=200;
  piy=200;
  
  
  
  thwompwake=false;
  thwomptimer=false;
  
 
  Fisica.init(this);
  terrain= new ArrayList<FGameObject>();
  enemies= new ArrayList<FGameObject>();

  bg1= loadImage("bg1.png");
  bg1.resize(1000,800);
  map1 = loadImage("map1.png");
  terrainmap1=loadImage("terrainmap1.png");
  water1 = loadImage("water1.png") ;

  treeTrunk = loadImage("tree_trunk.png");

  brick= loadImage("brick.png");
  hammer=loadImage("more/hammer.png");
  fireball=loadImage("more/fireball.png");

  //lava
  lava= new PImage[6];
  lava[0]= loadImage("lava0.png");
  lava[1]= loadImage("lava1.png");
  lava[2]= loadImage("lava2.png");
  lava[3]= loadImage("lava3.png");
  lava[4]= loadImage("lava4.png");
  lava[5]= loadImage("lava5.png");

  //tree
  tree= loadImage("treetop_center.png");
  treeIntersect= loadImage("tree_intersect.png");
  ltreeend=loadImage("treetop_w.png");
  rtreeend=loadImage("treetop_e.png");

  //other
  spike=loadImage("spike.png");
  musicbox=loadImage("musicbox.png");
  bridge=loadImage("bridge.png");
  trampoline=loadImage("more/trampoline.png");

  // weapons
  //hammer=loadImage("hammer.png");




  //load actions
  idle= new PImage[2];
  idle[0]= loadImage("character/idle0.png");
  idle[1]=loadImage("character/idle1.png");

  walk= new PImage[12];
  walk[0]=loadImage("character/walk0.png");
  walk[1]=loadImage("character/walk1.png");
  walk[2]=loadImage("character/walk2.png");
  walk[3]=loadImage("character/walk3.png");
  walk[4]=loadImage("character/walk4.png");
  walk[5]=loadImage("character/walk5.png");
  walk[6]=loadImage("character/walk6.png");
  walk[7]=loadImage("character/walk7.png");
  walk[8]=loadImage("character/walk8.png");
  walk[9]=loadImage("character/walk9.png");
  walk[10]=loadImage("character/walk10.png");
  walk[11]=loadImage("character/walk11.png");

  jump =new PImage[1];
  jump[0]= loadImage("character/jump0.png");

  action=idle;

  walk[0].resize (130, 40);
  walk[1].resize (130, 40);
  walk[2].resize (130, 40);
  walk[3].resize (130, 40);
  walk[4].resize (130, 40);
  walk[5].resize (130, 40);
  walk[6].resize (130, 40);
  walk[7].resize (130, 40);
  walk[8].resize (130, 40);
  walk[9].resize (130, 40);
  walk[10].resize (130, 40);
  walk[11].resize (130, 40);

  jump[0].resize (130, 40);

  idle[0].resize (130, 40);
  idle[1].resize (130, 40);




  //goomba
  goomba=new PImage[2];
  goomba[0]=loadImage("more/goomba0.png");
  goomba[0].resize(gridSize, gridSize);
  goomba[1]=loadImage("more/goomba1.png");
  goomba[1].resize(gridSize, gridSize);


  //thwomp
   Thwomp=new PImage[2];
  Thwomp[0]=loadImage("more/thwomp0.png");
  Thwomp[0].resize(2*gridSize,2*gridSize);
  Thwomp[1]=loadImage("more/thwomp1.png");
  Thwomp[1].resize(2*gridSize,2*gridSize);
  
  //
  //hammerbro

  Hammerbro= new PImage[2];
  Hammerbro[0]=loadImage("more/hammerbro0.png");
  Hammerbro[0].resize(gridSize, gridSize);
  Hammerbro[1]=loadImage("more/hammerbro1.png");
  Hammerbro[1].resize(gridSize, gridSize);

  //checkpoint
  
  Checkpoint=new PImage[6];
  Checkpoint[0]=loadImage("checkpoint/check0.gif");
  Checkpoint[0].resize(gridSize,gridSize);
  Checkpoint[1]=loadImage("checkpoint/check1.gif");
  Checkpoint[1].resize(gridSize,gridSize);
  Checkpoint[2]=loadImage("checkpoint/check2.gif");
  Checkpoint[2].resize(gridSize,gridSize);
  Checkpoint[3]=loadImage("checkpoint/check3.gif");
  Checkpoint[3].resize(gridSize,gridSize);
  Checkpoint[4]=loadImage("checkpoint/check4.gif");
  Checkpoint[4].resize(gridSize,gridSize);
  Checkpoint[5]=loadImage("checkpoint/check5.gif");
  Checkpoint[5].resize(gridSize,gridSize);
  
  
  Portal=  new PImage[4];
  Portal[0]= loadImage("more/portal1.png");
  Portal[0].resize(gridSize,gridSize);
  Portal[1]= loadImage("more/portal2.png");
  Portal[1].resize(gridSize,gridSize);
  Portal[2]= loadImage("more/portal3.png");
  Portal[2].resize(gridSize,gridSize);
  Portal[3]= loadImage("more/portal4.png");
  Portal[3].resize(gridSize,gridSize);
  
  //other terrains
  water1.resize (32, 32);
  tree.resize (32, 32);
  hammer.resize(32,32);
  fireball.resize(32,32);
  spike.resize (32, 100);
  bridge.resize(32, 50);
  musicbox.resize(32,50);
  loadWorld(map1);
  loadPlayer();
  /*
if(newworld=true){
  actWorld();

 loadWorld(terrainmap1);
  loadPlayer();
   
}else{
  loadWorld(map1);
  loadPlayer();
}
*/
}


void draw() {
  
   if (gameMode==0) {
    introScreen();
    newworld=false;
  } else if (gameMode==1) {
  background(bg1);
  drawWorld();
   
  actWorld();
  newworld=false;
   
  }else if(gameMode==2){
    
  nextScreen();
 newworld=false;
  }else if(gameMode==3){
    // world.clear();
 //background(bg1);
 loadPlayer();
 loadWorld(terrainmap1);
//world.remove(player);
   
 
  }
  

}



void actWorld() {
  player.act();
  for (int i=0; i< terrain.size(); i++) {
    FGameObject t= terrain.get(i);
    t.act();
  }
  for (int i=0; i< enemies.size(); i++) {
    FGameObject e= enemies.get(i);
    e.act();
  }
}





void introScreen(){
  background(bg1);
  textSize(50);
   text("Press any key to start",300,400);
   if(keyPressed){
     gameMode=1;
   }
}
void nextScreen(){
  background(0);
  textSize(50);
  for(int i=terrain.size()-1; i>=0; i--){
  terrain.remove(i);
  }
  world.clear();
 
 loadWorld(terrainmap1);
 loadPlayer();

  text("Loading",100,400);
   text("Press any key to skip",300,400);
   if(keyPressed){
     gameMode=3;
   }
}




void loadPlayer() {
  player=new FPlayer();
  world.add(player);
}

void drawWorld() {
  pushMatrix();
  translate(-player.getX()*zoom+600, -player.getY()*zoom+600);
  scale(zoom);
  world.step();
  world.draw();
  popMatrix();
}
