void tactileC(float x,float y, float r){
  if(dist(mouseX,mouseY,x,y)<r){
    stroke(255);
  }else{
    stroke(0);
  }
}

void recttactile(float x,float y,float w, float h){
  if(mouseX>x&& mouseX<x-w && mouseY>y && mouseY<y-h){
    stroke(255); 
  }else{
    stroke(0);
  }
}
