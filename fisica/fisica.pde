button[] mybutton;
dropbutton[] mydropbutton;

import fisica.*;
//cload
int x,y;
// gravity variable
int g;

//drop variable
boolean fall;

//mouse
boolean mouseReleased;
boolean wasPressed;

int backgroundcolor;

//palette
color blue   = color(29, 178, 242);
color brown  = color(166, 120, 24);
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = color(242, 215, 16);
color orange =#f7a414;
color black=#000000;
color white=#FFFFFF;

//assets
PImage redBird,Chick;


FPoly topPlatform; 
FPoly bottomPlatform;

//fisica
FWorld world;

void setup() {
 backgroundcolor=blue;
  //make window
  fullScreen();
  
  //load resources
  redBird = loadImage("red-bird.png");
  Chick = loadImage("frame_0_delay-0.1s.gif");
 Chick.resize(40,40);
  //initialise world
  makeWorld();

  //add terrain to world
  
  
  makeTopPlatform();
  makeBottomPlatform();
 
   mybutton=new button[2];
   mybutton[0]=new button("gravityon",400,400,200,200,blue,black,false);
   mybutton[1]=new button("gravityfalse",700,400,200,200,blue,black,true);
  mydropbutton= new dropbutton[1];
  mydropbutton[0]=new dropbutton("drop?",900,700,200,200,yellow,red,true);
}

//===========================================================================================

void makeWorld() {
  Fisica.init(this);
  world = new FWorld();
}

//===========================================================================================

void makeTopPlatform() {
  topPlatform = new FPoly();

  //plot the vertices of this platform
  topPlatform.vertex(-100, height*.1);
  topPlatform.vertex(width*0.8, height*0.4);
  topPlatform.vertex(width*0.8, height*0.4+100);
  topPlatform.vertex(-100, height*0.1+100);

  // define properties
  topPlatform.setStatic(true);
  topPlatform.setFillColor(brown);
  topPlatform.setFriction(0.1);

  //put it in the world
  world.add(topPlatform);
}

//===========================================================================================

void makeBottomPlatform() {
  bottomPlatform = new FPoly();

  //plot the vertices of this platform
  bottomPlatform.vertex(100,400);
  bottomPlatform.vertex(100, 600);
  bottomPlatform.vertex(300, 600);
  bottomPlatform.vertex(300,400);
  bottomPlatform.vertex(250,400);
  bottomPlatform.vertex(250,550);
  bottomPlatform.vertex(150,550);
  bottomPlatform.vertex(150,400);

  // define properties
  bottomPlatform.setStatic(true);
  bottomPlatform.setFillColor(brown);
  bottomPlatform.setFriction(0);

  //put it in the world
  world.add(bottomPlatform);
}


//===========================================================================================

void draw() {
   world.setGravity(0,g);
  println("x: " + mouseX + " y: " + mouseY);
  background(backgroundcolor);
   cloud(x,y+200);
   
   if(fall==false){
  if (frameCount % 20 == 0 ) {  //Every 20 frames ...
    makeCircle();
    makeBlob();
    makeBox();
    makeBird();
    makechick();
  }
    backgroundcolor=blue;
   }else{
    backgroundcolor=red;
  }
 
  world.step();  //get box2D to calculate all the forces and new positions
  world.draw();  //ask box2D to convert this world to processing screen coordinates and draw
  cloud(x,y+400);
  x=x+10;
  if(x>width+200){
    x=-200;
  }
  //button
   mybutton[0].show();
  mybutton[0].clicked();
   mybutton[1].show();
  mybutton[1].clicked();
  
  //dropbutton
  mydropbutton[0].show();
  mydropbutton[0].clicked();
  click();
 
}


//===========================================================================================

void makeCircle() {
  FCircle circle = new FCircle(50);
  circle.setPosition(random(width), -5);

  //set visuals
  circle.setStroke(0);
  circle.setStrokeWeight(2);
  circle.setFillColor(red);

  //set physical properties
  circle.setDensity(0.2);
  circle.setFriction(1);
  circle.setRestitution(1);

  //add to world
  world.add(circle);
}

//===========================================================================================

void makeBlob() {
  FBlob blob = new FBlob();

  //set visuals
  blob.setAsCircle(random(width), -5, 50);
  blob.setStroke(0);
  blob.setStrokeWeight(2);
  blob.setFillColor(yellow);

  //set physical properties
  blob.setDensity(0.2);
  blob.setFriction(1);
  blob.setRestitution(0.25);

  //add to the world
  world.add(blob);
}

//===========================================================================================

void makeBox() {
  FBox box = new FBox(50, 50);
  box.setPosition(random(width), -5);

  //set visuals
  box.setStroke(0);
  box.setStrokeWeight(2);
  box.setFillColor(green);

  //set physical properties
  box.setDensity(0.2);
  box.setFriction(1);
  box.setRestitution(1);
  world.add(box);
}

//===========================================================================================

void makeBird() {
  FCircle bird = new FCircle(48);
  bird.setPosition(random(width), -5);

  //set visuals
  bird.attachImage(redBird);

  //set physical properties
  bird.setDensity(0.8);
  bird.setFriction(1);
  bird.setRestitution(0.5);
  world.add(bird);
}

void makechick() {
  FBox chick = new FBox(40,40);
  chick.setPosition(random(width), -5);

  //set visuals
  chick.attachImage(Chick);

  //set physical properties
  chick.setDensity(0.8);
  chick.setFriction(1);
  chick.setRestitution(0.5);
  world.add(chick);
}



void cloud(int x, int y){
  fill(255);
  ellipse(x,y,200,100);
  x=x+1;
  
  
}
