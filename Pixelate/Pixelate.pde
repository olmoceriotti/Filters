PImage img;
String img_n = "cat.png";
int sqr_size = 40;
void setup(){
  size(700, 700);
  img = loadImage(img_n);
  windowResize(img.width, img.height);
  noStroke();
  sqr_size=img.width/20;
}
int i = 0;
void draw(){
  if (i== 0){
    image(img, 0, 0);
    i++;
  }
  if (mousePressed){
    color c = img.get(mouseX, mouseY);
    fill(c);
    square(mouseX-sqr_size/2, mouseY-sqr_size/2, sqr_size);
  }
}
