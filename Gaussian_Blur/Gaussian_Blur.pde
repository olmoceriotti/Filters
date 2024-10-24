int radius = 40;
int kernelW = (radius*2) + 1;
float sigma = max(float(radius/2), 1);
float[][] kernel;

float[][] populate(){
  float sum = 0;
  float[][] kernel = new float[kernelW][kernelW];
  for(int x = -radius; x < radius; x++){
    for(int y = -radius; y < radius; y++){
      float kernelValue = (exp(-(pow(x, 2) + pow(y, 2)) / (2 * pow(sigma, 2)))) / (2 * PI * pow(sigma, 2));

      kernel[x+radius][y+radius] = kernelValue;
      sum += kernelValue;
      println(sum);
    }
  }
  
  for(int x = 0; x < kernelW; x++){
    for(int y = 0; y < kernelW; y++){
      kernel[x][y] /= sum;
    }
  }
  return kernel;
}
PImage img;
String img_n = "cat.png";
void setup(){
  size(30, 30);
  img = loadImage(img_n);
  windowResize(img.width, img.height);
  
}



void draw(){
  PImage new_img = createImage(img.width, img.height, RGB);
  radius = int(map(mouseX, 0, img.width, 0, 40));
  kernelW = (radius*2) + 1;
  sigma = max(float(radius/2), 1);
  kernel = populate();
  for(int x = radius; x < img.width-radius; x++){
    for(int y = radius; y < img.height -radius; y++){
      float redV = 0;
      float greenV = 0;
      float blueV = 0;
      
      for(int kX = -radius; kX <= radius; kX++){
        for(int kY = -radius; kY <= radius; kY++){
          float kValue = kernel[kX + radius][kY + radius];
          redV += red(img.get(x - kX, y -  kY)) * kValue; 
          greenV += green(img.get(x - kX, y -  kY)) * kValue; 
          blueV += blue(img.get(x - kX, y -  kY)) * kValue; 
        }
      }
      new_img.set(x, y, color(redV, greenV, blueV));
    }
  }
  image(new_img, 0, 0);
  print("done");
}
