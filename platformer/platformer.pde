import fisica.*;

FWorld world;
PImage map;
int gridSize=32;

boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
FPlayer player;

color blue =#18a8f5;
color yellow =#f7e00f;
color green =#3afa0f;
color red =#f55442;
color orange =#f7a414;
color black=#000000;
color white=#FFFFFF;
color steel=#bfbebd;
color brown=#994831;

void setup() {
  size(600, 600);
  Fisica.init(this);

  map = loadImage("map.png");
  loadWorld(map);
}

void loadWorld(PImage img) {
  world=new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);

  for (int y=0; y< img.height; y++) {
    for (int x=0; x<img.width; x++) {
      color c=img.get(x, y);
      if (c==black) {
        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        world.add(b);
      }
    }
  }
}

  void draw(){
    background(255);
    world.step();
    world.draw();
  }
  
void loadPlayer(){
  player=new FPlayer();
  world.add(player);
}
