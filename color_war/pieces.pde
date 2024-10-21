void drawpiece(){ 
 for(int x=0; x<8;x++){
   for(int y=0; y<8;y++){
    if(piece[x][y]=='R') fill(red);circle(x*100,y*100,30); 
    if(piece[x][y]=='B') fill(blue);circle(x*100,y*100,30);
   }
 }
}
