PImage img;
color c;
String img_n = "trees.jpg";
void setup(){
  size(1200, 1200);
  img = loadImage(img_n);
  windowResize(img.width, img.height);
}

void draw(){
  img = loadImage(img_n);
  for(int i = 0; i < width; i++){
    c = img.get(i, mouseY);
    for(int j = mouseY; j < height; j++){
      img.set(i, j, c);
    }
  } 
  image(img, 0, 0);
}
