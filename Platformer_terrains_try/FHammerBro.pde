/*class FHammerBro extends FGoomba {
  
  FHammerBro() {
    super(float x, float y);
    setPosition(x, y);
    setName("hammerBro");
    setRotatable(false);
  }

  void act() {
    animate();
    collide();
    move();
  }

  void animate() {
    if (frame >= goomba.length) frame=0;
    if (frameCount%5 ==0) {
      if (direction == R) attachImage(goomba[frame]);
      if (direction == L) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
  }

  void collide() {

    if (isTouching("player")) {
      if (player.getY()<getY()-gridSize/2) {
        world.remove(this);
        enemies.remove(this);
        player.setVelocity(player.getVelocityX(), -600);
      } else {
        player.lives--;
        player.setPosition(600, 600);
      }
    }
  }
  
  
  void jump() {
    float vx= getVelocityX();
    setVelocity(vx, speed*direction);
  }
  
}
*/