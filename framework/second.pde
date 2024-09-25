void two(){
  background(255);
 
  int x = 50;  
int y = 50;  
int space = 50;  
float triangleSize; 
float angle;

   while (y < height) {
    x = 50; 
    while (x < width) {
      
      triangleSize = map(x, 0, width, 0,30);

      angle = map(x, 0, width, 0, 2*PI);

      // Set color based on the position
      fill(map(x, 0, width, 255, 100), map(y, 0, height, 100, 255), 200);

      //  rotation
      pushMatrix();
      translate(x, y);
      rotate(angle);
      drawTriangle(triangleSize);
      popMatrix();
      x += space;
    }
    
    y += space;
  }
  tactileC(50,400,30);
   circle(50,400,30);
  tactileC(750,400,30);
  circle(750,400,30);
}

void secondClicks(){
  if(dist(50,400,mouseX,mouseY)<30){
    mode=SECOND;
  }
  
  if(dist(750,400,mouseX,mouseY)<30){
    mode=THIRD;
  }
}

void drawTriangle(float size) {
  beginShape();
  vertex(-size , size);  
  vertex(size, size);   
  vertex(0, -size);       
  endShape();
}
