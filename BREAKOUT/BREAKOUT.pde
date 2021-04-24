//Carson

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode variables
int mode;
final int Intro    = 0;
final int Game     = 1;
final int Pause    = 2;
final int Gameover = 3;

//gif variables
PImage[] gif;
int nof;
int f;

//brick variables
int [] x;
int [] y ;
int brickd;
int p;
int tempx, tempy;
boolean[]alive;

//font
PFont DOOM;

//entity variables
float padx, pady, padd; //paddeles
float ballx, bally, balld, ballvx, ballvy; //ball

//score
int score, timer, lives;

//keyboard variables
boolean akey, dkey;
//colors
color skyBlue = #075299;
color black   = #000000;
color viridian =#40826d;
color crimson = #990000;
color white = #FFFFFF;
color pink = #FF0092;
color lime = #B6FF00;
color neonBlue = #228DFF;
color purple = #BA01FF;

//sound variables
Minim minim;
AudioPlayer introM, bounce, scoreM, win, lose;

void setup() {
  frameRate(120);
  size (800, 800);
  textAlign (CENTER, CENTER);
  mode = Intro;

  //gif
  nof = 18;
  gif = new PImage[nof];

  int i = 0;
  while ( i < nof) {
    gif[i] = loadImage("frame_"+i+"_delay-0.04s.gif");
    i++;
  }

  //initialize paddle
  padx = width/2;
  pady = height;
  padd = 100;

  //initialize ball
  ballx = 400;
  bally = 600;
  balld = 25;
  ballvx = 0;
  ballvy = 1; 

  //initialize bricks
  brickd = 50;
  p = 36;
  x = new int [p];
  y = new int [p];
  alive = new boolean[p];
  tempx =100;
  tempy =100;
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

  //initialize keyboard
  akey = dkey = false;

  //initialize score
  score = 0;
  timer = 100;
  lives = 3;

  //font
  DOOM = createFont("AmazDooMRight.ttf", 1);


  //minim
  minim = new Minim(this);
  introM = minim.loadFile("introM.mp3");
  bounce = minim.loadFile("bounce.mp3");  
  scoreM = minim.loadFile("score.mp3");  
  win = minim.loadFile("win.mp3");  
  lose = minim.loadFile("lose.mp3");
}

void draw() {
  if (mode == Intro) {
    intro ();
  } else if (mode == Game) {
    game ();
  } else if (mode == Pause) {
    pause ();
  } else if (mode == Gameover) {
    gameover ();
  } else {
    println("Error : Mode = " + mode);
  }
}
