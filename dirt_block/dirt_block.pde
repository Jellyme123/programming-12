PImage dtop,dbottom,dside;
float rotx, roty;

void setup(){
  size(800,800,P3D);
 dtop =loadImage("texture/Grass_Block_Top_C.png");
 dbottom =loadImage("texture/Dirtbottom.png");
 dside= loadImage("texture/Grass_Block_Side.png");
 textureMode(NORMAL);
}

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2, 0);'
  scale(200);
  rotateX(rotx);
  rotateY(roty);
  
  noStroke();
  
  beginShape(QUADS);
  texture(dtop);
  //top
  //     x,y,z,tx,ty
  
  
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  endShape();
  
  
  
  beginShape(QUADS);
  texture(dbottom);
  //bottom
  
  vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  endShape();
  
  
  beginShape(QUADS);
  texture(dside);
  //front
  vertex(0,0,1,0,0);
  vertex(1,0,1,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  
  //back
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(0,1,0,0,1);
  //left
  vertex(0,0,1,0,0);
  vertex(0,0,0,1,0);
  vertex(0,1,0,1,1);
  vertex(0,1,1,0,1);
  
  //right
  vertex(1,0,1,0,0);
  vertex(1,0,0,1,0);
  vertex(1,1,0,1,1);
  vertex(1,1,1,0,1);
  
  endShape();
  
  popMatrix();
}

void mouseDragged(){
  rotx = rotx+ (pmouseY - mouseY)*0.01;
  roty = roty+ (pmouseX - mouseX)*-0.01;
   
}