import java.awt.Robot;

Robot rbt;
boolean skipFrame;

boolean wkey, akey, skey, dkey;
float eyeX,eyeY,eyeZ, focusX,focusY,focusZ, tiltX,tiltY,tiltZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup(){
  size(1200,800 ,P3D);
  textureMode(NORMAL);
  wkey=akey=skey=dkey=false;
  eyeX=width/2;
  eyeY=height/2;
  eyeZ=0;
  focusX = width/2;
  focusY = height/2;
  focusZ =10;
  tiltX=0;
  tiltY=1;
  tiltZ=0;
  leftRightHeadAngle= radians(270);
  
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame=false;
  rbt.mouseMove(width/2, height/2);
  
}

void draw(){
  background(0);
  drawFloor();
  controlCamera();
  
}

void drawFloor(){
  //background(0);
  stroke(255);
  for(int x=-2000; x<= 2000; x= x+100){
    line(x, height,-2000,x,height,2000);
    line(-2000,height,x,2000,height,x);
  }
}

void controlCamera(){
  camera(eyeX,eyeY,eyeZ,focusX,focusY,focusZ, tiltX,tiltY,tiltZ);
  if(wkey) {
    eyeX= eyeX+ cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ+ sin(leftRightHeadAngle)*10;
  }
  
  if(skey) {
  eyeX= eyeX- cos(leftRightHeadAngle)*10;
    eyeZ= eyeZ- sin(leftRightHeadAngle)*10;
  }
  if(akey){
    eyeX= eyeX- cos(leftRightHeadAngle+radians(90))*10;
    eyeZ= eyeZ- sin(leftRightHeadAngle+radians(90))*10;
  }
  if(dkey){
    eyeX= eyeX- cos(leftRightHeadAngle-radians(90))*10;
    eyeZ= eyeZ- sin(leftRightHeadAngle-radians(90))*10;
  }
  
  if(skipFrame==false){
    leftRightHeadAngle=leftRightHeadAngle+(mouseX-pmouseX)*0.01;
    upDownHeadAngle =upDownHeadAngle+ (mouseY-pmouseY)*0.01;
  }
  
  
  if(upDownHeadAngle> PI/2.5) upDownHeadAngle=PI/2.5;
  if(upDownHeadAngle<-PI/2.5) upDownHeadAngle=-PI/2.5;
    
    
  
  leftRightHeadAngle = leftRightHeadAngle+ (mouseX - pmouseX)*0.01;
  upDownHeadAngle = upDownHeadAngle +(mouseY-pmouseY)*0.01;
  focusX=eyeX+ cos(leftRightHeadAngle)*300;
  focusY=eyeY+ tan(upDownHeadAngle)*300;
  focusZ=eyeZ+ sin(leftRightHeadAngle)*300;
  
  
  
  
  if(mouseX<2){
    rbt.mouseMove(width-3, mouseY);
    skipFrame=true;
  } else if(mouseX> width-2){
    rbt.mouseMove(3,mouseY);
    skipFrame=true;
  }else{
    skipFrame=false;
  }
  println(eyeX,eyeY,eyeZ);
}

void keyPressed(){
  if(key=='W'|| key=='w') wkey=true;
  if(key=='A'|| key=='a') akey=true;
  if(key=='S'|| key=='s') skey=true;
  if(key=='D'|| key=='d') dkey=true;
}

void keyReleased(){
  if(key=='W'|| key=='w') wkey=false;
  if(key=='A'|| key=='a') akey=false;
  if(key=='S'|| key=='s') skey=false;
  if(key=='D'|| key=='d') dkey=false;
  
}
