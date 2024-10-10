



Gif pumpkin, chick, sun;



void setup() {
  println("A");
  size(800, 800);
  sun=new Gif("sun/frame_", "_delay-0.04s.gif", 30, 5, 100, 100, 100, 100);
  
   println("B");
  //chick=new Gif("chick/frame_","_delay-0.1s.gif",20,10,200,200);
  //pumpkin=new Gif("pumpkin/frame_","_delay-0.16s.gif",22,3,300,300);
}

void draw() {
  background(0);
  sun.show();
   println("C");
  //chick.show();
  //pumpkin.show();
}
