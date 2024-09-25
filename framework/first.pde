void one(){
  Default();
  strokeWeight(0);
  t=255;
  r=0;
  //button
  fill(fanta,100);
  tactileC(50,400,30);
  circle(50,400,30);
  tactileC(750,400,30);
  circle(750,400,30);
  
  if(time%3==0){
     time=time+1;
     
  while(r<2300){
   fill(random(0,255),random(0,255),random(0,255),t);
   
    circle(400,800,r);
    r=r+100;
    t=t-30;
    if(t<0){
      t=10;
    }
  }
  }
  circle(400,800,200);

}

void firstClicks(){
  if(dist(50,400,mouseX,mouseY)<30){
    mode=SECOND;
  }
  
  if(dist(750,400,mouseX,mouseY)<30){
    mode=THIRD;
  }
}
