void gameover() {
  background (black);
  fill(white);
  textSize(50);
  if (score < 32) {
    text("YOU LOSE!", 400, 400);
    lose.rewind();
    lose.play();
  } else if (score >=32){
    text("YOU WIN!", 400, 400);
    win.rewind();
    win.play();
  }
  brickd = 50;
  p = 36;
  x = new int [p];
  y = new int [p];
  alive = new boolean[p];
  tempx =100;
  tempy =100;
  int i = 0;
  while (i < p) {
    x[i] =tempx;
    y[i] =tempy;
    alive[i] = true;
    tempx = tempx + 75;
    if (tempx == 775) {
      tempx = 100;
      tempy = tempy + 100;
    }
    i++;
  }
  score = 0;
  timer = 100;
  lives = 3;  
  padx = width/2;
}

void gameoverClicks() {
  mode = Intro;
}
