button[] mybutton;
import fisica.*;


PImage basketball, lcloth, rcloth;

boolean mouseReleased;
boolean wasPressed;

FWorld world;
color blue =#18a8f5;
color yellow =#f7e00f;
color green =#3afa0f;
color red =#f55442;
color orange =#f7a414;
color black=#000000;
color white=#FFFFFF;
color steel=#bfbebd;
color brown=#994831;

boolean wkey, akey, skey, dkey, upkey, downkey, rightkey, leftkey;
float vx, vy;
int leftScore = 0;
int rightScore = 0;
boolean gameOver = false;
boolean Intro;

FBox rightPlayer;
FBox leftPlayer;
FCircle ball;
FBox ground;
FPoly lbasket;
FPoly rbasket;
FPoly llbasket;
FPoly rrbasket;
FBox lsensorbar;
FBox rsensorbar;

void setup() {
  size(800, 800);
  Intro=true;
  basketball=loadImage("basketball1.png");
  basketball.resize(40, 40);
  lcloth=loadImage("bluejersey.png");
  lcloth.resize(60, 60);
  rcloth=loadImage("greenjersey.png");
  rcloth.resize(60, 60);

  noStroke();
  rectMode(CENTER);
  makeWorld();
  features();
  mybutton=new button[4];
  mybutton[0]=new button("Play!", 400, 600, 100, 50, yellow, red);
  mybutton[1]=new button("replay", 300, 600, 50, 50, black, white);
  mybutton[2]=new button("quit", 500, 600, 50, 50, black, red);
}

void makeWorld() {
  Fisica.init(this);
  world = new FWorld(-2000, -2000, 2000, 2000);
  world.setGravity(0, 900);
  world.setEdges();
}

void features() {
  lbasket();
  rbasket();
  llbasket();
  rrbasket();
  lsensorbar();
  rsensorbar();

  ground();
  leftPlayer();
  rightPlayer();
  ball();
}

void lbasket() {

  lbasket= new FPoly();

  lbasket.vertex(90, 200);
  lbasket.vertex(100, 200);
  lbasket.vertex(113, 250);
  lbasket.vertex(103, 250);

  lbasket.setStatic(true);
  world.add(lbasket);
}
void rbasket() {
  rbasket= new FPoly();
  rbasket.vertex(210, 200);
  rbasket.vertex(200, 200);
  rbasket.vertex(187, 250);
  rbasket.vertex(197, 250);
  rbasket.setStatic(true);
  world.add(rbasket);
}

void llbasket() {
  llbasket= new FPoly();
  llbasket.vertex(590, 200);
  llbasket.vertex(600, 200);
  llbasket.vertex(613, 250);
  llbasket.vertex(603, 250);
  llbasket.setStatic(true);

  world.add(llbasket);
}
void rrbasket() {
  rrbasket= new FPoly();
  rrbasket.vertex(710, 200);
  rrbasket.vertex(700, 200);
  rrbasket.vertex(687, 250);
  rrbasket.vertex(697, 250);
  rrbasket.setStatic(true);

  world.add(rrbasket);
}


void lsensorbar() {
  lsensorbar = new FBox(54, 10);

  lsensorbar.setFill(255, 0, 0, 0);
  lsensorbar.setSensor(true);
  lsensorbar.setStatic(true);
  lsensorbar.setStroke(orange);
  lsensorbar.setStrokeWeight(0);

  lsensorbar.setPosition(150, 235);
  world.add(lsensorbar);
}

void rsensorbar() {
  rsensorbar =new FBox(54, 10);
  rsensorbar.setFill(255, 0, 0, 0);
  rsensorbar.setStroke(orange);
  rsensorbar.setStrokeWeight(0);

  rsensorbar.setPosition(650, 235);
  rsensorbar.setSensor(true);
  rsensorbar.setStatic(true);

  world.add(rsensorbar);
}
void draw() {
  background(0);
  fill(yellow);
  rect(400, 460, 850, 100);
  noStroke();
  fill(steel);
  rect(150, 300, 50, 300, 100, 100, 100, 100);
  rect(650, 300, 50, 300, 100, 100, 100, 100);
  fill(orange);
  rect(150, 185, 200, 200, 100, 100, 100, 100);
  rect(650, 185, 200, 200, 100, 100, 100, 100);


  world.setGravity(0, 900);

  if (Intro) {
    intro();
  } else if (!gameOver) {
    background(255);
    world.step();
    world.draw();
    handlePlayerInput();
    checkScoring();
    displayScores();
  } else {
    background(red);
    displayWinMessage();
  }
}

void ground() {
  ground= new FBox(800, 200);
  ground.setStroke(0);
  ground.setFillColor(brown);
  ground.setStatic(true);
  ground.setPosition(400, 700);
  world.add(ground);
}



void leftPlayer() {
  leftPlayer=new FBox(60, 60);
  //set visuals
  leftPlayer.setStroke(0);
  leftPlayer.setStrokeWeight(0);
  leftPlayer.setFillColor(red);
  leftPlayer.setPosition(150, 135);
  leftPlayer.attachImage(lcloth);
  leftPlayer.setDensity(1.1);
  leftPlayer.setFriction(0.9);
  //leftPlayer.setRestitution(1);
  world.add(leftPlayer);
}

void rightPlayer() {
  rightPlayer=new FBox(60, 60);
  //set visuals
  rightPlayer.setStroke(0);
  rightPlayer.setStrokeWeight(0);
  rightPlayer.setFillColor(white);
  rightPlayer.setPosition(650, 135);
  rightPlayer.setFriction(0.9);
  rightPlayer.setDensity(1.1);
  rightPlayer.attachImage(rcloth);

  world.add(rightPlayer);
}

void ball() {
  ball=new FCircle(40);
  ball.attachImage(basketball);
  ball.setPosition(400, 400);
  ball.setFriction(1);
  ball.setRestitution(0.9);
  ball.setDensity(0.1);
  world.add(ball);
}


void handlePlayerInput() {
  float left_vx = leftPlayer.getVelocityX();
  float left_vy = leftPlayer.getVelocityY();
  float right_vx = rightPlayer.getVelocityX();
  float right_vy = rightPlayer.getVelocityY();


  if (wkey && ltouchground(ground)) left_vy = -700;
  if (skey) left_vy = 700;
  if (akey) left_vx = -200;
  if (dkey) left_vx = 200;
  leftPlayer.setVelocity(left_vx, left_vy);


  right_vx = 0;
  if (upkey && rtouchground(ground)) right_vy = -700;
  if (downkey) right_vy = 700;
  if (leftkey) right_vx = -200;
  if (rightkey) right_vx = 200;
  rightPlayer.setVelocity(right_vx, right_vy);
}

void keyPressed() {
  if (key=='w'||key=='W') wkey=true;
  if (key=='a'||key=='A') akey=true;
  if (key=='s'||key=='S') skey=true;
  if (key=='d'||key=='D') dkey=true;
  if (keyCode==UP) upkey=true;
  if (keyCode==DOWN) downkey=true;
  if (keyCode==LEFT) leftkey=true;
  if (keyCode==RIGHT) rightkey=true;
}

void keyReleased() {
  if (key=='w'||key=='W') wkey=false;
  if (key=='a'||key=='A') akey=false;
  if (key=='s'||key=='S') skey=false;
  if (key=='d'||key=='D') dkey=false;
  if (keyCode==UP) upkey=false;
  if (keyCode==DOWN)downkey=false;
  if (keyCode==LEFT) leftkey=false;
  if (keyCode==RIGHT) rightkey=false;
}

boolean touchball(FBox ground) {
  ArrayList<FContact> contactList=ball.getContacts();
  for (int i=0; i<contactList.size(); i++) {
    FContact myContact= contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
  }
  return false;
}

boolean ltouchground(FBox ground) {

  ArrayList<FContact> contactList=leftPlayer.getContacts();
  for (int i=0; i<contactList.size(); i++) {
    FContact myContact= contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
  }
  return false;
}

boolean rtouchground(FBox ground) {

  ArrayList<FContact> contactList=rightPlayer.getContacts();
  for (int i=0; i<contactList.size(); i++) {
    FContact myContact= contactList.get(i);
    if (myContact.contains(ground)) {
      return true;
    }
  }
  return false;
}

void checkScoring() {
  ArrayList<FContact> contacts = ball.getContacts();
  for (int i = 0; i < contacts.size(); i++) {
    FContact contact = contacts.get(i);

    if (contact.contains(lsensorbar)) {  // Ball touches left sensor bar
      rightScore++;                      // Right player scores
      resetBall();
    } else if (contact.contains(rsensorbar)) {  // Ball touches right sensor bar
      leftScore++;                               // Left player scores
      resetBall();
    }
  }

  if (leftScore > 1 || rightScore > 1) {
    gameOver = true;
  }
}

void resetBall() {
  ball.setPosition(400, 400);
  ball.setVelocity(0, 0);
}

void displayScores() {
  fill(255);
  textSize(32);
  text("RED: " + leftScore, 115, 700);
  text("WHITE: " + rightScore, 590, 700);
}

void displayWinMessage() {
  background(0);

  textSize(60);
  if (leftScore > 1) {
    fill(red);
    text("RED Wins!", 300, 400);
    mybutton[1].show();
    mybutton[1].endclicked();
    mybutton[1].show();
    mybutton[1].endclicked();
  } else {
    fill(white);
    text("WHITE Wins!", 200, 400);
    mybutton[1].show();
    mybutton[1].endclicked();
    mybutton[2].show();
    mybutton[2].endclicked();
  }
}


void intro(){
  background(0);
  mybutton[0].show();
  mybutton[0].introclicked();
  
}
