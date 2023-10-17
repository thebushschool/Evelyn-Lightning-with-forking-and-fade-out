int wdt = 1920;
int hgt = 1080;

void setup(){
  windowResize(wdt, hgt);
  frameRate(30);
  background(100);
  strokeWeight(5);
  fill(100, 100, 100, 100);
}

void draw(){
  noStroke();
  rect(0, 0, wdt, hgt);
}

void mousePressed(){
  ltg(0, hgt/2, (float)(Math.random() * 10 - 5), 25);
}

void keyPressed(){
  background(100);
}

void ltg(float inX, float inY, float off, int frkDly){
  int r = (int)(Math.random() * 155 + 100);
  int g = (int)(Math.random() * 155 + 100);
  int b = (int)(Math.random() * 155 + 100);
  float stX = inX;
  float stY = inY;
  float enX = inX;
  float enY = inY;
  stroke(r, g, b);
  while(enX < wdt){
    enX = stX + 5;
    enY = stY + (int)(Math.random() * 20 - 10 + off);
    line(stX, stY, enX, enY);
    stX = enX;
    stY = enY;
    if(Math.random() > 0.995 && frkDly == 0){
      float nOff = (float)(Math.random() * 3 + 5);
      ltg(stX, stY, nOff, 100);
      off -= nOff;
    }
    if(off >= 0.25){
      off -= 0.25;
    }
    else if(off <= -0.25){
      off += 0.25;
    }
    else{
      off = 0;
    }
    if(frkDly > 0){
      frkDly--;
    }
  }
}
