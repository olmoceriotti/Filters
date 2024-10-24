

float n;
float tileSize;
float size;
PImage img;
void setup(){
  size(600, 600);
  img = loadImage("cat.png");
}

void draw(){
  //image(img, 0, 0);
  background(255);
  fill(0);
  n = map(mouseX, 0, 499, 10, 50);
  tileSize = width/n;
  translate(tileSize/2, tileSize/2);
  for(int i = 0; i < n; i++){
    for(int j = 0; j < n; j++){
      size = map(brightness(img.get(int(i*tileSize), int(j*tileSize))), 0, 255, tileSize/2, 0);
      ellipse(i*tileSize, j*tileSize, size, size);
    }
  }
}
