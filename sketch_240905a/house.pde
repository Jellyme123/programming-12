//Jeremy Zhou
//Sept 5

void setup(){
  size(800,800);
  background(0, 217, 255);
  
}

void draw(){
  //body
  fill(50, 168, 168);
  rect(200,200,400,400);
  //door
  
  fill(220, 227, 30);
  rect(300,400,200,200);
  line(400,400,400,600);
  ellipse(350,500,10,10);
  ellipse(450,500,10,10);
  //rect()
  //windows
  fill(0, 217, 255);
  ellipse(300,300,100,100);
  line(300,250,300,350);
  line(250,300,350,300);
  ellipse(500,300,100,100);
  line(500,250,500,350);
  line(450,300,550,300);
  //roof
  fill(0, 217, 255);
  triangle(200,200,400,100,600,200);
  
  
}
