PImage reverseImage(PImage image) {
  PImage reverse;
  reverse = createImage(image.width, image.height, ARGB);

  for ( int x=0; x< image.width; x++) {
    for (int y=0; y<  image.height; y++) {
      int xPixel, yPixel;
      xPixel =image.width-1-x;
      yPixel=y;
      reverse.pixels[y*image.width+xPixel]=image.pixels[y*image.width+x];
    }
  }
  return reverse;
}
