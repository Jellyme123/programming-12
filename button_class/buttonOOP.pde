class button{
  int x,y,w,h;
  boolean clicked;
  int normal, highlight;
  String text;
  
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
  
  void show(){
     rectMode(CENTER);
    textAlign(CENTER,CENTER);
    drawRect();
    drawLabel();
    checkForClick();
    
 
}

 void drawRect(){
    if(mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2){
      
      fill(highlight);
    }else{
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x,y,w,h,30);
 
    
  }
  
  void drawLabel(){
      if(mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2){
      fill(normal);
    }else{
      fill(highlight);
    }
    textSize(w/4);
    text(text,x,y);
    
  }
  
  void checkForClick(){
     if (mouseReleased &&mouseX>x-w/2 && mouseX<x+w/2 && mouseY>y-h/2 && mouseY<y+h/2){
    clicked=true;
    
  }else{
clicked=false;

  } 
  
  
  }
  
  void clicked(){
    if(clicked==true){
      backgroundcolor=white;
    }
  }
  
  }
