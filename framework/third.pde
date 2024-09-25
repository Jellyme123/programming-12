void three(){
  pushMatrix();
  background(255);
  int x = 50;  
int y = 50;  
int space = 50; 
float rectW;  

float angle;  
  while (y < height) {
    x = 50; 
    while (x < width) {
      
      rectW = map(x, 0, width, 20, 100);
    

      angle = map(x, 0, width, 0, PI/2 );

      fill(map(x, 0, width, 255, 100), map(y, 0, height, 100, 255), 100);

      pushMatrix();
      translate(x, y);
      rotate(angle);
      rect(0, 0, rectW, 50);
      popMatrix();

    
      x += space;
    }
   
    y += space;
  }
   tactileC(50,400,30);
  circle(50,400,30);
   tactileC(750,400,30);
  circle(750,400,30);
  
  popMatrix();
}

void thirdClicks(){
  if(dist(50,400,mouseX,mouseY)<30){
    mode=SECOND;
  }
  
  if(dist(750,400,mouseX,mouseY)<30){
    mode=THIRD;
  }
}
