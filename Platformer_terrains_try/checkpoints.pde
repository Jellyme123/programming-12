

class FCheckPoint extends FGameObject {

  float X, Y, W, H;

  FCheckPoint(float x, float y, float w, float h, PImage image) {
    super(w, h);
    setStatic(true);
    setPosition(x*w, y*w);
    setStatic(true);
    setFriction(1);
    setName("checkPoint");
    attachImage(image);
    X=x*w;
    Y=y*w;
    W=w;
    H=h;
  }

  void act() {
  }
}
