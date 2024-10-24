PImage img;
String img_n = "cat.png";

void setup(){
  size(30, 30);
  img = loadImage(img_n);
  windowResize(img.width, img.height);
}

color black = #000000;
color red = #FF0000;

void draw(){
  PImage edges = createImage(img.width, img.height, RGB);
  for(int i = 0; i < img.width - 1; i++){
    for(int j = 0; j < img.height ; j++){
      color c1 = img.get(i, j);
      color c2 = img.get(i + 1, j);
      color c3 = lerpColor(black, red, map(distC(c1, c2), 0, 442, 0, 1));
      edges.set(i, j, c3);
    }
  }
  image(edges, 0, 0);
  noLoop();
}

float distC(color c1, color c2) {
  float r1 = red(c1);
  float g1 = green(c1);
  float b1 = blue(c1);
  
  float r2 = red(c2);
  float g2 = green(c2);
  float b2 = blue(c2);
  
  return dist(r1, g1, b1, r2, g2, b2);
}
