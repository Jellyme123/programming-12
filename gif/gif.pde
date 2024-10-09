PImage gif[];
int currentPic=0;

Gif pumpkin, chick,sun;



void setup(){
  
  size(800,800);
  sun=new Gif("sun/frame_","_delay-0.04s.gif",,,);
  chick=new Gif("chick/frame_","_delay-0.1s.gif",,,);
  pumpkin=new Gif("pumpkin/frame_","_delay-0.16s.gif",,,);
  //size(800,800);
  // gif=new PImage[20];
  
  //for(int i=0;i<20;i++){  
  //gif[i]=loadImage("frame_"+i+"_delay-0.1s.gif");
  //}
  
  
}

void draw(){
background(0);
Gif();
}
