
 void righthighlight(float x,float y,float w, float h){
  if(rightx>x&& rightx<x-w && righty>y && righty<y-h){
    stroke(255); 
  }else{
    stroke(0);
  }
}

 void lefthighlight(float x,float y,float w, float h){
  if(leftx>x&& leftx<x-w && lefty>y && lefty<y-h){
    stroke(255); 
  }else{
    stroke(0);
  }
}
