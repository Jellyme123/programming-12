
ArrayList<MCGameObject> objects;


void drawAllObjects() {

  for (int i=objects.size()-1; i>=0; i--) {
    objects.get(i).act();
    if(objects.get(i).lives==0){
     objects.remove(i); 
    }
  }
}



class MCGameObject {

  float size;
  float lives;
  PVector loc;

  MCGameObject(float x, float y, float z, float s) {
    size=s;
    loc = new PVector(x, y, z);
    lives=1;
  }


  void act() {
    show();
  }

  void show() {
    pushMatrix();
    translate(loc.x, loc.y, loc.z);
    fill(255);
    stroke(100);
    box(size);
    popMatrix();
  }

  float getSize() {
    return size;
  }

  float getX() {
    return loc.x;
  }
}
