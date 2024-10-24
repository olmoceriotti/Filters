PImage img;
String img_n = "cat.png";
int tiles = 4;
float sensibility = 40;
void setup(){
   size(1000, 1000);
   img = loadImage(img_n);
   windowResize(img.width, img.height);
}

void draw(){
  sensibility = map(mouseX, 0, img.width, 0, 255);
  PImage mask = createImage(img.width, img.height, RGB);
  img = loadImage(img_n);
  mask.loadPixels();
  img.loadPixels();
  for(int i = 0; i < img.pixels.length; i++){
    float b = brightness(img.pixels[i]);
    if (b <= sensibility || b >= 255- sensibility){
      mask.pixels[i] = color(0, 0, 0);
    }else{
      mask.pixels[i] = color(255, 255, 255);
    }
  }
  mask.updatePixels();
  
  for(int i =  0; i < width; i++){
    int j = 0;
    while(j < height){
      boolean same_range = true;
      int range = 0;
      while(same_range && j + range +1 < height){
        if (brightness(mask.get(i, j + range + 1)) < 1){
          same_range = false;
        }else{
          range++;
        }
      }
      if (range > 0){
        color[] in_use = new color[range];
        for(int k = 0; k < range; k++){
          in_use[k] = img.get(i, j + k);
        }
        in_use = sort(in_use);
        for(int k = 0, l=0; k < range; k++){
          img.set(i, j+k, in_use[k]);
        }
        j += range;
      }else{
        j +=  1;
      }
    }
  }
  image(img, 0, 0);
}
