class FHammerBro extends FGameObject {
  int direction = Up;
  int speed = 300;
  float Htimer;
  int frame = 0;
  float X, Y;

  FHammerBro(float x, float y) {
    super();
    setPosition(x, y);
    setName("hammerBro");
    setRotatable(false);
    Htimer = 0;
    X = x;
    Y = y;
  }

  void act() {
    animate();
    collide();
    jump();
  }

  void animate() {
    if (frame >= Hammerbro.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (getX() < player.getX()) attachImage(Hammerbro[frame]);
      if (getX() > player.getX()) attachImage(reverseImage(Hammerbro[frame]));
      frame++;
    }

    if (frameCount % 100 == 0) {
      Hammer H = new Hammer(32, 32);
      H.setPosition(getX(), getY());
      H.setVelocity(200 * direction, -1000);
      H.attachImage(hammer);
      H.setSensor(true);
      world.add(H);
    }
  }

  void collide() {
    if (isTouching("player")) {
      if (player.getY() < getY() - gridSize / 2) {
        player.setVelocity(player.getVelocityX(), -600);
      }
    }
  }

  void jump() {
    Htimer = Htimer + 0.01;
    if (Htimer > 3) {
      float vx = getVelocityX();
      setVelocity(vx, speed * direction);
      Htimer = 0;
      
    }
  }
}

class Hammer extends FGameObject {
  Hammer(float x, float y) {
    super(x, y);
    setName("hammer");
  }

  void act() {
    boolean isTouchingPlayer = isTouching("player");
    println("Is hammer touching player: " + isTouchingPlayer);
    if (isTouchingPlayer) {
      player.setPosition(pix, piy);
      world.remove(this);
      println("1");
    }
  }
  
  

  void collide() {
    if (isTouching("brick")) {
      player.setVelocity(player.getVelocityX(), -600);
    }
  }
}
