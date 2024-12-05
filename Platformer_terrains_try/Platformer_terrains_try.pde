import fisica.*;

FWorld world;
FPlayer player;
PImage map,water1,brick,treeTrunk, tree, lava0,treeIntersect,ltreeend,rtreeend,spike,bridge;
int gridSize=32;
float zoom=1.5;
boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
ArrayList <FGameObject> terrain;

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


void setup() {
  size(1200, 1200);
  Fisica.init(this);
  terrain= new ArrayList<FGameObject>();

  map = loadImage("terrainmap.png");
  water1 = loadImage("water1.png") ;

treeTrunk = loadImage("tree_trunk.png");
 
brick= loadImage("brick.png");
lava0= loadImage("lava0.png");
tree= loadImage("treetop_center.png");
treeIntersect= loadImage("tree_intersect.png");
ltreeend=loadImage("treetop_w.png");
rtreeend=loadImage("treetop_e.png");
spike=loadImage("spike.png");
bridge=loadImage("bridge.png");


water1.resize (32,32);
 tree.resize (32,32);
 lava0.resize (32,60);
 spike.resize (32,100);
 bridge.resize(32,50);
  loadWorld(map);
  loadPlayer();
}

void loadWorld(PImage img) {
  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y< img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y); //color of current pixel
      color s= img.get(x,y+1); //color below current pixel
      color w= img.get(x-1,y); //color west of current
      color e= img.get(x+1,y); // color east of current 
      
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
      if(c==red){ 
        b.attachImage(lava0);
        b.setSensor(true);
        b.setName("lava0");
        world.add(b);
      }
      if(c==green) { 
        b.attachImage(tree);
        b.setName("tree");
        world.add(b);
      }
      if(c==grey) { 
        b.attachImage(spike);
        b.setName("spike");
        world.add(b);
      }
      if(c==green && img.get(x,y+1) == treeTrunkBrown) { 
        b.attachImage(treeIntersect);
        b.setName("treeIntersect");
        world.add(b);
      }
      if(c==green && img.get(x-1,y) == white) { 
        b.attachImage(ltreeend);
        b.setName("ltreeend");
        world.add(b);
      }
      if(c==green && img.get(x+1,y) == white) { 
        b.attachImage(rtreeend);
        b.setName("rtreeend");
        world.add(b);
      }
      //fancy terrain
      if(c==orange) { 
       FBridge br=new FBridge(x*gridSize,y*gridSize);
       terrain.add(br);
       world.add(br);
      }
    }
  }
}



  void draw(){
    background(255);
    drawWorld();
    actWorld();
  }
  void actWorld(){
    player.act();
    for(int i=0; i< terrain.size(); i++){
      FGameObject t= terrain.get(i);
      t.act();
    }
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
