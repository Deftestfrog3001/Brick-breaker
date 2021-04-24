void pause () {
  textSize(100);
  fill(75);
  text("PAUSED", 400, 300);
  text("CLICK ANYWHERE TO RESUME", 400, 400);
}

void pauseClicks () {
  mode = Game;
}
