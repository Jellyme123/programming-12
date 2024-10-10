class Gif{
  
  
  PImage[] frames;
  int numberofFrame;
  int x,y,w,h;
  int number;
  int speed;
  int currentpic;
  
  Gif(String bef, String aft, int n, int s, int _x,int _y){
   
    frames=new PImage[n];
    numberofFrame=n;
    x=_x;
    y=_y;
    speed=s;
    currentpic=0;
    
    
    for(int i=0; i<numberofFrame; i++){
      frames[i]=loadImage(bef+i+aft);
      
    }
    //w=frames[0].width;
    //h=frames[0].height;
  }
  //gif(){
    
  //}
  
//void Gif(){
//image(frames[currentPic],400,400,100,100);
//  currentPic++;
//  if(currentPic>=number){
//   currentPic=0;
//  }
//}


Gif(String bef, String aft, int n, int s, int _x,int _y,int _w,int _h){
   this(bef,aft,n,s,_x,_y);
   w=_w;
   h=_h;
  }
void show(){
  imageMode(CENTER);
 if(currentpic==numberofFrame) currentpic=0;
 println(currentpic);
 image(frames[currentpic],x,y,w,h);
 if(frameCount% speed==0) currentpic++;
}


}
