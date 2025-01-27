
MCPlayer player;

void loadPlayer() {
  player = new MCPlayer();
}

void drawPlayer() {
  player.act();
}

class MCPlayer {

  float speed=10;
  float time=0, jumpTime=1, jumping=0, Gtimer;
  float maxJumpNum=1, jumpNum=0;
  float cameraShake;

  MCPlayer() {
  }

  void act() {
    move();
    jump();
    gravity();
    controlCamera();
  }

  void move() {
    float w=radians(0.5), d=5, s=0.02;

 
    if (keyD) {
      if ( bodyTouchBlockX() != 1 && bodyTouchBlockZ() !=1  && leftRightHeadAngle>=0) {
        eyeX+=speed*sin(leftRightHeadAngle);
        eyeZ+=speed*cos(leftRightHeadAngle);
      } else
        if ( bodyTouchBlockX() != 2 && bodyTouchBlockZ() !=2 && leftRightHeadAngle<0) {
          eyeX+=speed*sin(leftRightHeadAngle);
          eyeZ+=speed*cos(leftRightHeadAngle);
        }
    }
    
    if (keyA) {
      if ( bodyTouchBlockX() != 1 && bodyTouchBlockZ() !=1  && leftRightHeadAngle>=0) {
        eyeX-=speed*sin(leftRightHeadAngle);
        eyeZ-=speed*cos(leftRightHeadAngle);
      } else
        if ( bodyTouchBlockX() != 2 && bodyTouchBlockZ() !=2 && leftRightHeadAngle<0) {
          eyeX-=speed*sin(leftRightHeadAngle);
          eyeZ-=speed*cos(leftRightHeadAngle);
        }
    }
    
    
    
    if (keyW) {
      if (bodyTouchBlockX() != 1 && bodyTouchBlockZ()!=1 && leftRightHeadAngle>=0) {
        eyeX+=speed*cos(leftRightHeadAngle);
        eyeZ-=speed*sin(leftRightHeadAngle);
     
      }
      if (bodyTouchBlockX() != 2 && bodyTouchBlockZ()!=2 && leftRightHeadAngle<0) {
        eyeX+=speed*cos(leftRightHeadAngle);
        eyeZ-=speed*sin(leftRightHeadAngle);
      
      }
    }
    if (keyS) {
      if (bodyTouchBlockX() != 1 && bodyTouchBlockZ()!=1 && leftRightHeadAngle>=0) {
        eyeX-=speed*cos(leftRightHeadAngle);
        eyeZ+=speed*sin(leftRightHeadAngle);
       
      }
      if (bodyTouchBlockX() != 2 && bodyTouchBlockZ()!=2 && leftRightHeadAngle<0) {
        eyeX-=speed*cos(leftRightHeadAngle);
        eyeZ+=speed*sin(leftRightHeadAngle);
      
      }
    }
  }

  void jump() {
    if (space && jumpNum<maxJumpNum && bodyTouchBlockY()==1) {
      jumping=1;
    }
    if (jumping==1) {
      if (time<jumpTime*60) {
        bodyY-=3*speed*(jumpTime-time)/jumpTime;
        time+=1/60.0;
      }
      if (time>=jumpTime) {
        jumpNum++;
        time=0;
        jumping=0;
      }
    }

    if (bodyTouchBlockY()==1) {
      jumpNum=0;
      jumping=0;
      time=0;
    }
  }

  void gravity() {

    if (bodyTouchBlockY()!=1) {
      Gtimer+=1;
      bodyY+=speed*Gtimer/60;
    }

    if (bodyTouchBlockY()==1) {
      Gtimer=0;
    }
  }

  void placeBlock() {
    if (focalTouchBlockX()!=0||focalTouchBlockY()!=0||focalTouchBlockZ()!=0) {
      addMCBlock(focusX-focusX%w, focusY-focusY%w-w, focusZ-focusZ%w, w, diamond);
      
    
    }
  }


  boolean bodyTouchBlock() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (eyeX>X && eyeX<X+W) {
        return true;
      }
      if (bodyY>Y && bodyY<bodyY+W) {
        return true;
      }
      if (eyeZ>Z && eyeZ<eyeZ+W) {
        return true;
      }
    }

    return false;
  }
  float bodyTouchBlockX() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (eyeX>X-speed && eyeX<X+W+speed && bodyY>Y-speed && bodyY<Y+W+speed && eyeZ>Z-speed && eyeZ<Z+W+speed) {
        if (eyeX>X)
          return 1;
        if (eyeX<=X)
          return 2;
      }
    }

    return 0;
  }
  float  bodyTouchBlockY() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (eyeX>X-speed && eyeX<X+W+speed && bodyY>Y-5*speed && bodyY<Y+W+5*speed && eyeZ>Z-speed && eyeZ<Z+W+speed) {
        if (bodyY>Y)
          return 1;
        if (bodyY<=Y)
          return 2;
      }
    }

    return 0;
  }
  float bodyTouchBlockZ() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (eyeX>X-speed && eyeX<X+W+speed && bodyY>Y-speed && bodyY<Y+W+speed && eyeZ>Z-speed && eyeZ<Z+W+speed) {
        if (eyeZ>Z)
          return 1;
        if (eyeZ<=Z)
          return 2;
      }
    }

    return 0;
  }

  float focalTouchBlockX() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (focusX>X-speed && focusX<X+W+speed && focusY>Y-speed && focusY<Y+W+speed && focusZ>Z-speed && focusZ<Z+W+speed) {
        if (focusX>X)
          return 1;
        if (focusX<=X)
          return 2;
      }
    }

    return 0;
  }
  float  focalTouchBlockY() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (focusX>X-speed && focusX<X+W+speed && focusY>Y-speed && focusY<Y+W+speed && focusZ>Z-speed && focusZ<Z+W+speed) {
        if (focusY>Y)
          return 1;
        if (focusY<=Y)
          return 2;
      }
    }

    return 0;
  }
  float focalTouchBlockZ() {
    for (int i=0; i<allBlocks.size(); i++) {
      float X, Y, Z, W;
      MCBlock block = allBlocks.get(i);
      X=block.getX();
      Y=block.getY();
      Z=block.getZ();
      W=block.getW();
      if (focusX>X-speed && focusX<X+W+speed && focusY>Y-speed && focusY<Y+W+speed && focusZ>Z-speed && focusZ<Z+W+speed) {
        if (focusZ>Z)
          return 1;
        if (focusZ<=Z)
          return 2;
      }
    }

    return 0;
  }


  void controlCamera() {

    upDownHeadAngle=min(upDownHeadAngle, PI/2.5);
    upDownHeadAngle=max(upDownHeadAngle, -PI/2.5);

    if (leftRightHeadAngle<-2*PI || leftRightHeadAngle>2*PI)
      leftRightHeadAngle = 0;

    eyeY=bodyY-w*HH;
    view=min(view, 8*w);
    view=max(view, 3);


    focusX=eyeX+cos(leftRightHeadAngle)*view;
    focusY=eyeY+tan(upDownHeadAngle)*view;
    focusZ=eyeZ-sin(leftRightHeadAngle)*view;


  
    if (focalTouchBlockZ()==0 || focalTouchBlockX()==0 || focalTouchBlockY() ==0) {
      if (view<800)
        view+=w/2;
    }


    camera(eyeX, eyeY+cameraShake, eyeZ, focusX, focusY+cameraShake, focusZ, rotX, rotY, rotZ);
  
    drawFocalPoint();

  }


  void drawFocalPoint() {
    pushMatrix();
    translate(focusX, focusY, focusZ);
    fill(255);
    noStroke();
    sphere(5);
   
    stroke(150, 150, 0);

    line(0, 0, 0,
      width*cos(leftRightHeadAngle), 0, -width*sin(leftRightHeadAngle));


    fill(255);
    text(180/PI*leftRightHeadAngle%360, 30*cos(leftRightHeadAngle), 0, -30*sin(leftRightHeadAngle));
    popMatrix();
  }

  float getSpeed() {
    return speed;
  }
}
