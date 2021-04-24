void game() {
  background(0);
  fill(white);
  stroke(white);

  //scoreboard
  textSize (50);
  text("score:" + score, 100, 750);
  text("lives:" + lives, 700, 750);
  //text(timer, width/2, 100);
  timer = timer - 1;

  //draw paddles
  fill(skyBlue);
  circle(padx, pady, padd);

  //move paddles
  if (akey == true) padx = padx - 5;
  if (dkey == true) padx = padx + 5;

  //paddle limits
  if (padx <= 50) padx = 50;
  if (padx >= 750) padx = 750;  

  //draw ball
  circle(ballx, bally, balld);

  //move ball
  if (timer < 0) {
    ballx  = ballx + ballvx;
    bally  = bally + ballvy;
  }
  if (dist(ballx, bally, padx, pady) <= balld/2 + padd/2) {
    ballvx = (ballx - padx)/15;
    ballvy = (bally - pady)/15;
    bounce.rewind();
    bounce.play();
  }
  if (bally <= balld/2) {
    ballvy = ballvy * -1;
    bounce.rewind();
    bounce.play();
  }
  if (ballx <= balld/2 || ballx >= width-balld/2) {
    ballvx = ballvx * -1;
    bounce.rewind();
    bounce.play();
  }
  if (bally >= height) {
    lives = lives - 1;
    timer = 100;
    ballx = 400;
    bally = 600;
    ballvx = 0;
    ballvy = 1;
  }
  //bricks
  int i = 0;
  while (i < p) {
    if (alive[i] == true) {
      if (y[i] == 100) fill(pink);
      if (y[i] == 200) fill(lime);
      if (y[i] == 300) fill(neonBlue);
      if (y[i] == 400) fill(purple);
      manageBrick(i);
    }
    i++;
  }

  //pause
  fill (skyBlue);
  rect(5, 5, 100, 100);
  fill (black);
  text("| |", 55, 55);

  if (score == 36 || lives == 0) {
    mode = Gameover;
  }
}


//tactile rect
void tactileR(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < w && mouseY > y && mouseY < h) {
    stroke(white);
  } else {  
    stroke(black);
  }
}


void gameClicks() {
  if (mouseX > 5 && mouseX < 105 && mouseY > 5 && mouseY < 105) {
    mode = Pause;
    timer = 100;
  }
}

void manageBrick (int i) {
  circle(x[i], y[i], brickd);
  if (dist(ballx, bally, x[i], y[i]) <= balld/2 + brickd/2) {
    ballvx = (ballx - x[i])/13;
    ballvy = (bally - y[i])/13;
    alive[i] = false;
    score++;
    bounce.rewind();
    bounce.play();
    scoreM.rewind();
    scoreM.play();
  }
}
