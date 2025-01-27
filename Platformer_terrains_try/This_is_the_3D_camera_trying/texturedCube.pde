
void texturedCube(float x, float y, float z, float w, PImage image) {

  pushMatrix();
  translate( x, y, z );
  beginShape(QUADS);
  noFill();
  //noLights();
  noStroke();
  texture(image);

  //top
  vertex(0, 0, 0, 0, 0);
  vertex(w, 0, 0, w, 0);
  vertex(w, 0, w, w, w);
  vertex(0, 0, w, 0, w);

  //bottom
  vertex(0, w, 0, 0, 0);
  vertex(w, w, 0, w, 0);
  vertex(w, w, w, w, w);
  vertex(0, w, w, 0, w);

  //front
  vertex(0, 0, w, 0, w);
  vertex(w, 0, w, w, w);
  vertex(w, w, w, w, 0);
  vertex(0, w, w, 0, 0);

  //back
  vertex(0, 0, 0, 0, w);
  vertex(w, 0, 0, w, w);
  vertex(w, w, 0, w, 0);
  vertex(0, w, 0, 0, 0);

  //left
  vertex(0, w, 0, 0, w);
  vertex(0, w, w, w, w);
  vertex(0, 0, w, w, 0);
  vertex(0, 0, 0, 0, 0);

  //right
  vertex(w, w, 0, 0, w);
  vertex(w, w, w, w, w);
  vertex(w, 0, w, w, 0);
  vertex(w, 0, 0, 0, 0);


  endShape(CLOSE);
 
  popMatrix();
}
