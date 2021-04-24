void intro () {
  textFont(DOOM);
  background (crimson);
  image(gif[f], 0, 0, width, height); 
  f++;
  if (f == nof) f = 0;
  strokeWeight (5);
  textSize (150);
  stroke( black);
  fill(white);
  text("BREAKOUT!", 400, 300);
  textSize (50);
  introM.play();

  //start
  fill(75);
  rect (300, 600, 200, 100);
  fill(0);
  text ("start!", 400, 650);
  fill(75);
}

void introClicks () {
  //start
  if (mouseX > 300 && mouseX < 500 && mouseY > 600 && mouseY < 700) {
    mode = Game;
  }
}
