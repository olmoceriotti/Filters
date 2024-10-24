PImage img;
PImage new_img;
float offset;
String img_n = "cat.png";
void setup(){
  size(3000, 2000);
  img = loadImage(img_n);
  windowResize(img.width, img.height);
}

void draw(){
  offset = map(mouseX, 0, width, 0, width/2);
  img = loadImage(img_n);
  new_img = createImage(img.width, img.height, RGB);
  img.loadPixels();
  new_img.loadPixels();
  for(int i = 0; i < img.width; i++){
    for (int j = 1; j < img.height; j++){
     int index = i + j * img.width;
     color c = img.pixels[index];
     
     int r = (c >> 16) & 0xFF;
     int g = (c >> 8) & 0xFF;
     int b = c & 0xFF;
     
     int redIndex = index;
     int greenIndex = (index + int(offset)) % (img.width*img.height);
     int blueIndex = (index + 2*int(offset)) % (img.width*img.height);
     
     int shiftRed = (img.pixels[redIndex] >> 16) & 0xFF;
     int shiftGreen = (img.pixels[greenIndex] >> 8) & 0xFF;
     int shiftBlue = img.pixels[blueIndex] & 0xFF;
     
     color newColor = color(shiftRed, shiftGreen, shiftBlue);
     new_img.pixels[index] = newColor;
    }
  }
  new_img.updatePixels();
  image(new_img, 0, 0);
}
