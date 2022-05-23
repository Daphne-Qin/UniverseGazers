int highScore;
int currentScore;
int coins;
//ArrayList<Spacemen> spacemenList;
//ArrayList<Obstacle> obstacleList;
//ArrayList<Bullets> bulletList;

void setup() {
  size(1280, 720); // marge is 1600 x 900
  background(225);
  highScore = 0;
  currentScore = 0;
  
  end();
}

void keyPressed() {
  // start the game
  if (key == ' ') start();
  
  // end the game
  if (key == 'e') end();
}

void start() {
  //Player p = new Player(40, height-100, 50);
  coins = 0;
}

void end() {
  stroke(0);
  fill(255);
  rect(width/2-500, height/2-250, 1000, 500);
  fill(0);
  
  int calc = currentScore + coins * 2;
  
  textSize(50);
  text("You lost! Try again?", 400, 250);
  textSize(30);
  text("Raw Score: " + currentScore, 550, 330);
  text("Final Score: " + calc, 550, 380);
  if (calcHighScore(calc)) text("New High Score!", 550, 430);
}

boolean calcHighScore(int calc) {
  if (calc > highScore) { // highScore changed
    highScore = calc;
    return true;
  }
  
  return false; // highScore unchanged
}

void addToCoin() {
  coins++;
}
