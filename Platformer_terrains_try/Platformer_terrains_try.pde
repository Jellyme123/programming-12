import fisica.*;

FWorld world;
FPlayer player;

PImage map, water1, brick, treeTrunk, tree, treeIntersect, ltreeend, rtreeend, spike, bridge, trampoline,musicbox;
PImage[] idle;
PImage[] jump;
PImage[] walk;
PImage[] action;
PImage[] goomba;
PImage[] lava;
//PImage[] hammerbro;

int gridSize=32;
float zoom=1.5;

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

color Goombas=#990030;

color pink=#ffa3b1;

color hammerbro=#d3f9bc;
color thwomp= #2f3699;
color thwompsensor= #6f3198;


boolean thwompwake;
boolean thwomptimer;


void setup() {
  size(1500, 1500);
  thwompwake=false;
  thwomptimer=false;
  
  
  Fisica.init(this);
  terrain= new ArrayList<FGameObject>();
  enemies= new ArrayList<FGameObject>();


  map = loadImage("terrainmap1.png");
  water1 = loadImage("water1.png") ;

  treeTrunk = loadImage("tree_trunk.png");

  brick= loadImage("brick.png");

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

  //hammerbro
/*
  hammerbro= new PImage[2];
  hammerbro[0]=loadImage("more/hammerbro0.png");
  hammerbro[0].resize(gridSize, gridSize);
  hammerbro[1]=loadImage("more/hammerbro1.png");
  hammerbro[1].resize(gridSize, gridSize);
*/

  //other terrains
  water1.resize (32, 32);
  tree.resize (32, 32);

  spike.resize (32, 100);
  bridge.resize(32, 50);
  musicbox.resize(32,50);
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 1000);

  for (int y=0; y< img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y); //color of current pixel
      color s= img.get(x, y+1); //color below current pixel
      color w= img.get(x-1, y); //color west of current
      color e= img.get(x+1, y); // color east of current

      FBox b = new FBox(gridSize, gridSize);
      b.setPosition(x*gridSize, y*gridSize);
      b.setStatic(true);
      if (c==black) {//stone
        b.attachImage(brick);
        b.setFriction(20);
        b.setName("brick");
        world.add(b);
      }
      if (c==wallgrey) {//wall
        b.attachImage(brick);
        b.setFriction(4);
        b.setName("wall");
        world.add(b);
      }
      if (c==thwompsensor) {//wall
        b.attachImage(brick);
        b.setFriction(4);
        b.setName("thwompsensor");
        world.add(b);
      }
      if (c==pink) {
        b.attachImage(trampoline);
        b.setRestitution(2);
        b.setName("trampoline");
        world.add(b);
      }
      if (c==cyan) { //water
        b.attachImage(water1);
        b.setFriction(0);
        b.setName("water1");
        world.add(b);
      }
      if (c==treeTrunkBrown) {
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("treetrunk");
        world.add(b);
      }
      if (c==green) {
        b.attachImage(tree);
        b.setName("tree");
        world.add(b);
      }
      if (c==grey) {
        b.attachImage(spike);
        b.setName("spike");
        world.add(b);
      }

      if (c==green && img.get(x, y+1) == treeTrunkBrown) {
        b.attachImage(treeIntersect);
        b.setFriction(4);
        b.setName("treeIntersect");
        world.add(b);
      }
      if (c==green && img.get(x-1, y) == white) {
        b.attachImage(ltreeend);
        b.setFriction(4);
        b.setName("ltreeend");
        world.add(b);
      }
      if (c==green && img.get(x+1, y) == white) {
        b.attachImage(rtreeend);
        b.setFriction(4);
        b.setName("rtreeend");
        world.add(b);
      }

      //fancy terrain
      if (c==orange) {
        FBridge br=new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c==Goombas) {
        FGoomba gmb=new FGoomba(x*gridSize, y*gridSize);
        terrain.add(gmb);
        world.add(gmb);
      }
      if (c==hammerbro) {
        FGoomba gmb=new FGoomba(2*gridSize, 2*gridSize);
        terrain.add(gmb);
        world.add(gmb);
      }

      // if(c==hammerbroColor){
      // FGoomba hbro=new FHammerBro(x*gridSize,y*gridSize);
      // terrain.add(hbro);
      // world.add(hbro);
      // }

      if (c==red) {
        FLava la=new FLava(x*gridSize, y*gridSize);
        terrain.add(la);
        world.add(la);
      }
      
      if(c==thwomp && img.get(x+1,y)== thwomp && img.get(x,y+1)== thwomp && img.get(x+1,y+1)==thwomp){
        FThwomp thw= new FThwomp(x*gridSize, y*gridSize);
        terrain.add(thw);
        world.add(thw);
      }
      
     
      
      
    }
  }
}


void draw() {
  background(255);
  drawWorld();
  actWorld();
}
void actWorld() {
  player.act();
  for (int i=0; i< terrain.size(); i++) {
    FGameObject t= terrain.get(i);
    t.act();
  }
  for (int i=0; i< enemies.size(); i++) {
    FGameObject e= terrain.get(i);
    e.act();
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
