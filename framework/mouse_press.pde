void mousePressed(){
  if (mode==FIRST && dist(50,400,mouseX,mouseY)<30){
    mode=THIRD;
    
  }else if(mode==SECOND && dist(50,400,mouseX,mouseY)<30){
    mode=FIRST;
    
  }else if(mode==THIRD && dist(50,400,mouseX,mouseY)<30){
    mode=SECOND;
  }
  
  
  if(mode==FIRST && dist(750,400,mouseX,mouseY)<30){
    mode=SECOND;
  }else if(mode==SECOND && dist(750,400,mouseX,mouseY)<30){
    
    mode=THIRD;
  }else if(mode==THIRD && dist(750,400,mouseX,mouseY)<30){
    
    mode=FIRST;
  }
  
  
  
}
