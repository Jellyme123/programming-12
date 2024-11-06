class button{
  int x,y,w,h;
  boolean clicked;
  int normal, highlight;
  String text;
  PImage pic;
  
  button(String t,int _x,int _y,int _w,int _h,color norm, color highl){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    text=t;
    highlight=highl;
    normal=norm;
    clicked=false;
  }
  
   button(PImage img,int _x,int _y,int _w,int _h,color norm, color highl){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    pic=img;
    highlight=highl;
    normal=norm;
    clicked=false;
    img=pic;
  }
  
  void show(){
    
    
    textAlign(CENTER,CENTER);
    
    drawRect();
    drawLabel();
    checkForClick();
    
 
}

 void drawRect(){
    if(touchingmouse()){
      
      fill(highlight);
    }else{
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x,y,w,h,30);
 
    
  }
  
  void drawLabel(){
      if(touchingmouse()){
      fill(normal);
    }else{
      fill(highlight);
    }
    
    
    
    if(pic==null){
      textSize(w/4);
    text(text,x,y);
    }else{
      image(pic,x,y,w,h);
    }
    
    
    
  }
  
  void checkForClick(){
     if (mouseReleased &&touchingmouse()){
    clicked=true;
  }else{
clicked=false;
  } 
  }
  
  void introclicked(){
    if(clicked==true&& Intro){
      println("a");
     Intro=false;
    }
  }
  void endclicked(){
    if(clicked==true&& gameOver==true && Intro==false){
    Intro=true;
    gameOver=false;
    reset();
    }
  }
  
  boolean touchingmouse(){
    return mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2;
  }
  }
  
  
