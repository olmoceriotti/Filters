PImage img;
String img_n = "cat.png";
void setup(){
  size(30, 30);
  img = loadImage(img_n);
  windowResize(img.width, img.height); 
  frameRate(3);
}

void draw(){
  img = loadImage(img_n);
  color first = color(random(255), random(255), random(255));
  color second = color(random(255), random(255), random(255));
  for(int i = 0; i < img.width; i++){
    for(int j = 0; j < img.height; j++){
      color c = img.get(i, j);
      float b = map(brightness(c), 0, 255, 1, 0);
      color new_c = lerpColor(first, second , b);
      img.set(i, j, new_c);
    }
  }
  image(img, 0, 0);
  //noLoop();
}
