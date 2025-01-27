import java.awt.Robot;

PImage diamond, map,yellowwool,copper,snow;
Robot rbt;
boolean skipFrame;

float w=100;
float HH=2;

color black=#000000;
color white=#FFFFFF;
color boarder= #7092be;
color red=#ed1c24;


float rotX, rotY, rotZ, eyeX, bodyY, eyeZ, eyeY=bodyY-w*HH,
  focusX, focusY, focusZ, zoom=1, transX,
  transY, transZ=100, leftRightHeadAngle, view=100,
  upDownHeadAngle;

void setup() {
  fullScreen(P3D);

  loadImages();
  eyeX=width/2;
  bodyY=0;
  eyeZ=height/2;
  focusX=width/2;
  focusY=height/2;
  focusZ=10;
  rotX=0;
  rotY=1;
  rotZ=0;

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame=false;
  //here
  rbt.mouseMove(width/2, height/2);
//here
  allBlocks = new ArrayList<MCBlock>();
  objects = new ArrayList<MCGameObject>();
  drawMap();
  loadPlayer();
}

void draw() {
  background(0);
  lights();

  drawAllBlocks();
  drawPlayer();
  drawAllObjects();

  texturedCube(300, -300, 100, w, snow);



  keyRemote();
if(skipFrame==false){
  upDownHeadAngle = upDownHeadAngle+ (pmouseY - mouseY)/-100.0;
  leftRightHeadAngle = leftRightHeadAngle+ (pmouseX - mouseX)/100.0;
}


  if (mouseX!=pmouseX || mouseY !=pmouseY) {
    view=0;
  }
  
  //here
  if(mouseX<2){
    rbt.mouseMove(width-3,mouseY);
    skipFrame=true;
  }else if(mouseX>width-2){
    rbt.mouseMove(3,mouseY);
    skipFrame=true;
  }else{
    skipFrame=false;
  }
  
  //here
}


void mousePressed() {

  if (mouseButton==LEFT) {
    player.placeBlock();
  }

  if (mouseButton==RIGHT) {
    addBullet();
  }
}


void keyRemote() {
  float w=radians(0.5), d=3, s=2;

  if (key1) {
    transZ+=d;
  }
  if (key2) {
    transZ-=d;
  }
}



void loadImages() {
  map=loadImage("map1.png");
  diamond = loadImage("Diamond.png");
  diamond.resize((int)w, (int)w);
  yellowwool=loadImage("Yellowwool.png");
  yellowwool.resize((int)w, (int)w);
  snow=loadImage("snow.png");
  snow.resize((int)w, (int)w);
  copper=loadImage("copper.png");
  copper.resize((int) w,(int)w);
 
 
}
