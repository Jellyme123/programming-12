color flower= #FF3D7F;
color cream = #F1EEC5;
color dgrass = #D3CA50;
color moon = #EEE6AB;
color sky = #5b88a8;
color grass = #5ba863;
color door = #5B451E;
color dark =0;
color sun= #ed2b15;

int x;
int y;
int suny;
boolean day;
int w;




void setup(){
  day= false;
  size(800,800);

 int y=300;
 suny=650;
 w= dark;
  
}


void draw(){
 background(w);
 
 //moon
 strokeWeight(0);
 stroke(sky);
 fill(moon);
 circle(700,y,50);
 //moon cover
 fill(dark);
 circle(680,y,50);
 
  
  //sun
  fill(sun);
  circle(650,suny,50);
  
  //land
  fill(grass);
  rect(0,600,800,200);
  if(day==false && y>-50){
    y=y-2;
  } else{
    day=true;
    y=700;
    w=sky;
  }
  
  if(day==true && suny>-50){
    suny=suny-2;
  }else{
  day=false;
  suny=700;
  w=dark;
  }
  house(400,500);
  
}

void house(int a, int b){
  pushMatrix();
  translate(a, b);
  fill(flower);
 rect(0,0,200,200);
 fill(dgrass);
 triangle(0,0,100,-100,200,0);
 //windows
 fill(sky);
 ellipse(50,60,50,50);
 ellipse(150,60,50,50);
 stroke(0);
 strokeWeight(3);
 line(50,35,50,85);
 line(25,60,75,60);
 line(150,35,150,85);
 line(125,60,175,60);
 //door
 fill(door);
 rect(75,125,50,75);
  popMatrix();
}
