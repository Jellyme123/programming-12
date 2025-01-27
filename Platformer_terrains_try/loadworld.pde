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
        FHammerBro hb=new FHammerBro(x*gridSize, y*gridSize);
        terrain.add(hb);
        world.add(hb);
      }

      if (c==red) {
        FLava la=new FLava(x*gridSize, y*gridSize);
        terrain.add(la);
        world.add(la);
      }
      
      if(c==thwomp){
        FThwomp thw= new FThwomp(x*gridSize, y*gridSize);
        terrain.add(thw);
        world.add(thw);
      }
     if(c==checkpoint){
      
        
      }
      if(c==portal){
       FPortal ptl= new FPortal(x*gridSize, y*gridSize);
        terrain.add(ptl);
        world.add(ptl);
      }
      
      
    }
  }
}
