void keyPressed(){
  if(key=='a'|| key=='A') keya=true;
  if(key=='d'|| key=='D') keyd=true;
  if(key=='w'|| key=='W') keyw=true;
  if(key=='s'|| key=='S') keys=true;
  if(keyCode ==UP) keyup=true;
  if(keyCode ==DOWN) keydown=true;
  if(keyCode ==LEFT) keyL=true;
  if(keyCode ==RIGHT) keyR=true;
  //put chess
  if(key =='m') turnshift=false;
  if(keyCode ==TAB)  turnshift=true;
}

void keyReleased(){
  if(key=='a'|| key=='A') keya=false;
  if(key=='d'|| key=='D') keyd=false;
  if(key=='w'|| key=='W') keyw=false;
  if(key=='s'|| key=='S') keys=false;
  if(keyCode ==UP) keyup=false;
  if(keyCode ==DOWN) keydown=false;
  if(keyCode ==LEFT) keyL=false;
  if(keyCode ==RIGHT) keyR=false;
}
