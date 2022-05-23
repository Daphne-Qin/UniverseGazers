int highScore;
int currentScore;
int coins;
//ArrayList<Spacemen> spacemenList;
//ArrayList<Obstacle> obstacleList;
//ArrayList<Bullets> bulletList;

int mode;
final int START = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int END = 3;

void setup() {
  size(1280, 720); // marge is 1600 x 900
  background(225);
  highScore = 0;
  currentScore = 0;
  
  end();
}

void draw() {
  
}

void keyPressed() {
  // start the game
  if (key == ' ' && mode != GAME) start();
  
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
  
  int calc = currentScore + coins * 2;
  
  // end screen text
  fill(0);
  textSize(50);
  text("You lost! Try again?", 400, 250);
  textSize(30);
  text("Raw Score: " + currentScore, 550, 330);
  text("Final Score: " + calc, 545, 380);
  fill(255, 0, 0);
  if (calcHighScore(calc)) text("New High Score!", 525, 430);
  fill(0);
  text("Press space to replay.", 485, 510);
}

boolean calcHighScore(int calc) {
  if (calc >= highScore) { // highScore changed
    highScore = calc;
    return true;
  }
  
  return false; // highScore unchanged
}

void addToCoin() {
  coins++;
}
