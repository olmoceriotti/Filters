PImage img;
String img_n = "cat.png";
int tiles = 4;
void setup(){
   size(1000, 1000);
   img = loadImage(img_n);
   windowResize(img.width, img.height);
}

void draw(){
  int interval = 10;
  for(int i =  0; i < width; i++){
    //sin based
    interval = int(abs(sin(i)*150)+1);
    //random based
    interval = int(random(20, 200));
    for(int j = 0; j < height/interval; j++){
      color[] pixel_list = new color[interval];
      for(int k = j*interval, l =0; k < j*interval+interval; k++, l++){
        pixel_list[l] = img.get(i, k);
      }
      pixel_list = sort(pixel_list);
      for(int k = j*interval, l=0; k < j*interval+interval; k++, l++){
        img.set(i, k, pixel_list[l]);
      }
    }
  }
  image(img, 0, 0);
  noLoop();
}
