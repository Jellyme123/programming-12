import fisica.*;

FWorld world;
PImage map,water1,brick,treeTrunk, tree;
int gridSize=32;
float zoom=1.5;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
FPlayer player;

color white = #FFFFFF;
color black = #000000;
color cyan = #99d9ea;
color treeTrunkBrown = #9c5a3c;
color blue =#18a8f5;
color yellow =#f7e00f;
color green =#00FF00;
color red =#f55442;
color orange =#f7a414;
color steel=#bfbebd;
color brown=#994831;

void setup() {
  size(1200, 1200);
  Fisica.init(this);

  map = loadImage("terrainmap.png");
  water1 = loadImage("water1.png") ;

treeTrunk = loadImage("tree_trunk.png");
 water1.resize (32,32);
brick= loadImage("brick.png");
tree= loadImage("treetop_center.png");

  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y< img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y);
      FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
      if (c==black) {//stone
       b.attachImage(brick);
       b.setFriction(4);
       b.setName("brick");
        world.add(b);
      }
      if(c==cyan){ //water
        b.attachImage(water1);
        b.setFriction(0);
        b.setName("water1");
        world.add(b);
      }
      if(c==treeTrunkBrown){ 
        b.attachImage(treeTrunk);
        b.setSensor(true);
        b.setName("treetrunk");
        world.add(b);
      }
      if(c==green){ 
        b.attachImage(tree);
        b.setSensor(true);
        b.setName("tree");
        world.add(b);
      }
    }
  }
}

  void draw(){
    background(255);
    drawWorld();
    player.act();
  }
  
void loadPlayer(){
  player=new FPlayer();
  world.add(player);
}

void drawWorld(){
  pushMatrix();
  translate(-player.getX()*zoom+width/2, -player.getY()*zoom+height/2);
  scale(zoom);
   world.step();
    world.draw();
  popMatrix();
}
