

ArrayList<MCBlock> allBlocks;


void drawAllBlocks() {
  for (int i=allBlocks.size()-1; i>=0; i--) {
    allBlocks.get(i).act();
    if(allBlocks.get(i).getLives()<=0){
     allBlocks.remove(i); 
    }
  }
}


void addMCBlock(float x, float y, float z, float w, PImage image) {
  MCBlock block = new MCBlock(x, y, z, w, image);
  allBlocks.add(block);
}


class MCBlock {

  float X, Y, Z, W, H, L,lives=1,breakTime=3;
  PImage Image;

  MCBlock(float w, float h, float l) {
  }

  MCBlock(float w) {
    W=w;
    H=w;
    L=w;
  }

  MCBlock(float x, float y, float z, float w, PImage image) {
    X=x;
    Y=y;
    Z=z;
    W=w;
    H=w;
    L=w;
    Image=image;
  }


  void act() {
    texturedCube(X, Y, Z, W, Image);
  }

  boolean touchPlayer() {
    if (eyeX>X && eyeX<X+W) {
      return true;
    }
    if (bodyY>Y && bodyY<bodyY+W) {
      return true;
    }
    if (eyeZ>Z && eyeZ<eyeZ+W) {
      return true;
    }
    return false;
  }

  float getX() {
    return X;
  }
  float getY() {
    return Y;
  }
  float getZ() {
    return Z;
  }
  float getW() {
    return W;
  }
  
  float getLives(){
   return lives; 
  }
  
  float changeLives(float num){
    lives+=num;
    return lives;
  }
}
