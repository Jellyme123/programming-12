
void drawMap() {

  for (int x=0; x<map.width; x++) {
    for (int y=0; y<map.height; y++) {
      color c = map.get(x, y);
      if (c!= color(white)) {
        if (c == color(black)) {
          addMCBlock(x*w, -w, y*w, w, yellowwool);
          addMCBlock(x*w, -2*w, y*w, w, yellowwool);
          addMCBlock(x*w, -6*w, y*w, w, copper);
        } else if(c==color(boarder)) {
          addMCBlock(x*w, -w, y*w, w, copper);
          addMCBlock(x*w,-2*w,y*w,w,copper);
          addMCBlock(x*w,-3*w,y*w,w,copper);
          addMCBlock(x*w,-4*w,y*w,w,copper);
          addMCBlock(x*w,-5*w,y*w,w,copper);
        }
      }
      if (c==color(255)) {
        addMCBlock(x*w, 0, y*w, w, snow);
        
        addMCBlock(x*w, -6*w, y*w, w, copper);
      }
    }
  }
}
