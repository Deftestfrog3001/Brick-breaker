void mouseReleased() {
  if (mode == Intro) {
    introClicks ();
  } else if (mode == Game) {
    gameClicks ();
  } else if (mode == Pause) {
    pauseClicks ();
  } else if (mode == Gameover) {
    gameoverClicks ();
  }
}
