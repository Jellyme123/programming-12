void game(){
  int space=130;
  
  //movement
    if(keyw==true) lefty=lefty-4;
  if(keys==true) lefty=lefty+4;
  if(keya==true) leftx=leftx-4;
  if(keyd==true) leftx=leftx+4;
  if(keyup==true) righty=righty-4;
  if(keydown==true) righty=righty+4;
  if(keyL==true) rightx=rightx-4;
  if(keyR==true) rightx=rightx+4;
  //where to highlight
  rightL=int(rightx-200)/100;
  rightH=int(righty)/100;
  leftL=int(leftx-200)/100;
  leftH=int(lefty)/100;
   
   
   //who's turn?
  if(turnshift==true){
    turnR=true;
    turnB=false;
  }else{
    turnB=true;
    turnR=false;
  }
  
  background(battle);
  drawboard(); 

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
  putatom();
}

void man(float x, float y, float r){
  circle(x,y,r);
}

void drawboard(){
  for(int x=0;x<8;x++){
  for(int y=0;y<8;y++){
    int g=x*100;
    int o=y*100;
    if(owners[x][y]==1) fill(255,0,0);
    else if(owners[x][y]==2) fill(0,0,255);
    else noFill();
    
    
    if((x%2==y%2)){
      fill(chessboard1);
    }else{
      fill(chessboard2);
    }
  
    
    // highlight(leftL*100,leftH*100,100,100);
    //highlight(rightL*100,rightH*100,100,100);
    //highlight(g*100+200,o*100,100,100);
    
    rect(x*100+250,y*100+50,100,100);
    
    for(int n=0;n<atoms[x][y];n++){
      ellipse(x*100+200+100/2+n*10-10,y*100+200+100/2,20,20);
    }
  }
}

}

void putatom(){
  
  int li=(int)(leftx-200)/100;
  int lj=(int)(lefty-200)/100;
  int ri=(int)(rightx-200)/100;
  int rj=(int)(righty-200)/100;
  
  if(li>=0 && li<cols && lj>=0 && lj<rows && turnB){
   if (owners[li][lj] == 0 || owners[li][lj] == currentPlayer){
     
      atoms[li][lj]++;  // Add an atom to the clicked cell
      owners[li][lj] = currentPlayer;  // Set ownership of the cell
      checkExplosion(li, lj);  // Check for explosion after placing an atom
      currentPlayer=2;
      
   }
  }
  
  if(ri>=0 && ri<cols && rj>=0 && rj<rows && turnR){
   if (owners[ri][rj] == 0 || owners[ri][rj] == currentPlayer) {
      atoms[ri][rj]++;  // Add an atom to the clicked cell
      owners[ri][rj] = currentPlayer;  // Set ownership of the cell
      checkExplosion(ri, rj);  // Check for explosion after placing an atom
      
      currentPlayer=1;
   }
  }
}
