
void addBullet() {
  MCBullet bullet = new MCBullet(50, 30);
  objects.add(bullet);
}

class MCBullet extends MCGameObject {

  PVector dir;
  float bspeed=10, size, frame, timer=0;

 

  MCBullet(float s, float v) {
    super(eyeX, eyeY, eyeZ, s);
    bspeed=v;
    float vx=cos(leftRightHeadAngle);
    float vy=tan(upDownHeadAngle);
    float vz=-sin(leftRightHeadAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(bspeed);
    size=s;
  }

  void act() {
   
    timer+=1/60.0;
   
    if (touchBlock()==false && lives>0) {
      dir.setMag(dir.mag()*(1-timer/60));
      loc.add(dir);
      show();
      gravity();
    } else {

      lives = 0;
      for (int i=0; i<5; i++) {
      
      }
    }
  }

  boolean touchBlock() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (loc.x+size/2>X && loc.x-size/2<X+W && loc.y+size/2>Y && loc.y-size/2<Y+W && loc.z+size/2>Z && loc.z-size/2<Z+W) {
        allBlocks.get(i).changeLives(-1);
        return true;
      }
    }
    return false;
  }

  void gravity() {
    frame++;
    loc.y+=bspeed*frame/60/5*(1+timer);
  }
}
