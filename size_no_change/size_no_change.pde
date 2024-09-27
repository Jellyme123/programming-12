Mover[] myMovers;
int n=50;

void setup(){
  int i=0;
  size(800,800);
  myMovers = new Mover[n];
  while(i<n){
  myMovers[i]=new Mover();
  i++;
  }
}

void draw(){
  
  int i=0;
  while(i<n){
  myMovers[i].act();
  myMovers[i].show();
  i++;
  }
  
}
