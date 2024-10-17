void game(){
  int space=130;
  int x=200;
  int y=200;
  
  boolean inside;
  
  
  if(turnshift==true){
    turnR=true;
    turnB=false;
    
  }else{
    turnB=true;
    turnR=false;
  }
  background(battle);
  drawboard(); 
 
  if(keyw==true) lefty=lefty-4;
  if(keys==true) lefty=lefty+4;
  if(keya==true) leftx=leftx-4;
  if(keyd==true) leftx=leftx+4;
  if(keyup==true) righty=righty-4;
  if(keydown==true) righty=righty+4;
  if(keyL==true) rightx=rightx-4;
  if(keyR==true) rightx=rightx+4;

  if (colorc=true){
    fill(red);
  }else{
    fill(blue);
  }
  
  noStroke();
   fill(red);
  man(rightx,righty,rightd);
  fill(blue);
  man(leftx,lefty,leftd);
 
  //take piece
  rect(100,200,50,50);
  rect(1100,200,50,50);
  
  if(turnR==true){
    text("Red",600,400);
    if(leftx>170){
      leftx=170;
    }
  }else if(turnB==true){
    text("Blue",600,400);
    if(rightx<1030){
      rightx=1030;
    }
  }
  if(leftx>75 && leftx<125 && lefty>175 && lefty<225){
    leftx=100;
    lefty=400;
    
  }
  
  if(rightx>1075 && rightx<1125 && righty>175 && righty<175){
    rightx=1100;
    righty=400;
  }
  //where to highlight
  
  rightL=int(rightx-200)/100;
  rightH=int(righty)/100;
  leftL=int(leftx-200)/100;
  leftH=int(lefty)/100;
  lefthighlight(leftL,leftH,100,100);
  righthighlight(rightL,rightH,100,100);
  
  //recttactile(200,200,100,100);
  //if(turnB==true){
  //recttactile(rightL*100+200,rightH*100,100,100);
  //}
  //if(turnR==true){
  //  recttactile(leftL*100+200,leftH*100,100,100);
  //}

  
  //for(int i=0; i<8;i++){
  // for(int j=0; j<8;j++){
  //  if(leftx>i*100+200 && leftx<i*100+300 && lefty>j*100 && lefty<j*100+100){
  //    recttactile(i*100+200,j*100,100,100);
  //  }
  // }
  //}
  
}


void man(float x, float y, float r){
  circle(x,y,r);
}


void drawboard(){
  for(int x=0;x<8;x++){
  for(int y=0;y<8;y++){
    if((x%2==y%2)){
      fill(chessboard1);
    }else{
      fill(chessboard2);
    }
    rect(x*100+250,y*100+50,100,100);
  }
}
}

void drawpiece(){ 
 for(int x=0; x<8;x++){
   for(int y=0; y<8;y++){
    if(piece[x][y]=='R') fill(red);circle(x*100,y*100,30); 
    if(piece[x][y]=='B') fill(blue);circle(x*100,y*100,30);
   }
 }
}
