int wdt = 1920;  //dimensions of draw window
int hgt = 1080;

void setup(){
  //windowResize(wdt, hgt);
  setup(1920,1080);
  frameRate(30);
  background(100);
  strokeWeight(5);
  fill(100, 100, 100, 100);  //rgb should be same as background, alpha controls rate of fading
}

void draw(){
  noStroke();
  rect(0, 0, wdt, hgt);  //draws a rectangle over the screen to fade the lightning
}

void mousePressed(){
  ltg(0, hgt/2, (float)(Math.random() * 10 - 5), 25);
}

void keyPressed(){  //for smaller fill alphas, there may be an afterimage, used to clear them
  background(100);
}

void ltg(float inX, float inY, float off, int frkDly){  //draws lightning, parameters: starting x, starting y, amount to add to y values (decays), number of cycles to wait before forking is possible
  int r = (int)(Math.random() * 155 + 100);
  int g = (int)(Math.random() * 155 + 100);
  int b = (int)(Math.random() * 155 + 100);
  float stX = inX;
  float stY = inY;
  float enX = inX;
  float enY = inY;
  stroke(r, g, b);
  while(enX < wdt){  //main loop
    enX = stX + 5;  //moves right
    enY = stY + (int)(Math.random() * 20 - 10 + off);  //random y movement, range is -10 to 10 when off == 0
    line(stX, stY, enX, enY);
    stX = enX;
    stY = enY;
    if(Math.random() > 0.995 && frkDly == 0){  //causes a fork
      float nOff = (float)(Math.random() * 3 + 5);  //random offset to prevent forks overlapping, range is 5 to 8
      ltg(stX, stY, nOff, 100);
      off -= nOff;  //original lightning gets offset in opposite direction
    }
    if(off >= 0.25){  //decays offset toward 0
      off -= 0.25;
    }
    else if(off <= -0.25){
      off += 0.25;
    }
    else{
      off = 0;
    }
    if(frkDly > 0){  //decrements fork delay
      frkDly--;
    }
  }
}
