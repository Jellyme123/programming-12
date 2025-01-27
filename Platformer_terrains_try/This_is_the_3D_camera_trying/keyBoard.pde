
boolean
  keyW=false,
  keyS=false,
  keyA=false,
  keyD=false,
  keyUpA=false,
  keyDownA=false,
  keyLeftA=false,
  keyRightA=false,
  key1, key2,
  space;




void keyPressed() {

  keyW = keyDown('w', keyW);
  keyS = keyDown('s', keyS);
  keyA = keyDown('a', keyA);
  keyD = keyDown('d', keyD);
  keyUpA =keyCodeDown(UP, keyUpA);
  keyDownA =keyCodeDown(DOWN, keyDownA);
  keyLeftA =keyCodeDown(LEFT, keyLeftA);
  keyRightA =keyCodeDown(RIGHT, keyRightA);

  key1 = keyDown('1', key1);
  key2 = keyDown('2', key2);

  space = keyDown(' ', space);
}


void keyReleased() {


  keyW = keyUp('w', keyW);
  keyS = keyUp('s', keyS);
  keyA = keyUp('a', keyA);
  keyD = keyUp('d', keyD);
  key1 = keyUp('1', key1);
  key2 = keyUp('2', key2);

  space = keyUp(' ', space);
  

}

void increase(int a) {
  a = a + 1;
}



void pauseScreen () {
  stroke(0, 0, 0, 0);
  fill(0, 0, 0, 1);
  rect(0, 0, width, height);

  textSize(90);
  fill(255);
  text("P A U S E", width/2, height/2);
  stroke(0);
}


boolean keyDown(char x, boolean y) {
  if (key==x) {
    return true;
  } else {
    return y;
  }
}

boolean keyUp(char x, boolean y) {
  if (key==x) {
    return false;
  } else {
    return y;
  }
}

boolean keyCodeDown(int x, boolean y) {
  if (keyCode==x) {
    return true;
  } else {
    return y;
  }
}

boolean keyCodeUp(int x, boolean y) {
  if (keyCode==x) {
    return false;
  } else {
    return y;
  }
}
