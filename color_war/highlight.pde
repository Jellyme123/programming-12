void highlight(float x,float y,float w, float h){
  if(rightx>x&& rightx<x+w && righty>y && righty<y+h){
    
    stroke(255);
    strokeWeight(10);
   
    
  }else if(leftx>x&& leftx<x+w && lefty>y && lefty<y+h){
    stroke(255);
    strokeWeight(10);
    
  }else{
    stroke(0);
    strokeWeight(0);
  
  }
}
