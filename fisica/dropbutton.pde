class dropbutton{
  int x,y,w,h;
  boolean clicked;
  int normal, highlight;
  String text;
  PImage pic;
  boolean drop;
 
  
  dropbutton(String t,int _x,int _y,int _w,int _h,color norm, color highl, boolean _drop){
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    text=t;
    highlight=highl;
    normal=norm;
    clicked=false;
    drop=_drop;
  }
  
  void show(){
     rectMode(CENTER);
     //imageMode(CENTER);
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
    textSize(w/4);
    text(text,x,y);
  }
  
  void checkForClick(){
     if (mouseReleased &&touchingmouse()){
    clicked=true;
  }else{
    clicked=false;
  } 
  }
  
  void clicked(){
    if(clicked==true && drop==true){
     fall=!fall;
    }
    }
  
 
  boolean touchingmouse(){
    return mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2;
  }
  }
  
  
