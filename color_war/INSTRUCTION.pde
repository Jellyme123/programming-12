void instru(){
  background(0);
  
  rect(600,600,200,100);
  fill(100);
  text("Start",600,600);
  

}

void mousePressed(){
  if(mouseX>0 && mouseX<800 && mouseY>0 && mouseY<800){
    mode=GAME;
      }
      

}
