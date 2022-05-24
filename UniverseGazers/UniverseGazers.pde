//Player p;

int highScore;
int currentScore;
int coins;
//ArrayList<Spacemen> spacemenList;
//ArrayList<Obstacle> obstacleList;
//ArrayList<Bullets> bulletList;

private int mode;
private final int STARTPAGE = 0;
private final int INSTRUCTIONS = 1;
private final int GAME = 2;
private final int END = 3;

void setup() {
  size(1280, 720);
  background(225);
  highScore = 0;
  coins = 0;

  startPage();
}

void draw() {
  background(225);
  switch (mode) {
  case STARTPAGE: 
    startPage();
    break;
  case INSTRUCTIONS: 
    instructions();
    break;
  case GAME:
    game();
    break;
  case END: 
    end();
    break;
  }

  // for testing only
  textSize(10);
  fill(0);
  text("Mode: " + mode, 10, 10);
}

void keyPressed() {
  // go to instructions
  if (key == 'i') {
    if (mode == STARTPAGE) {
      mode = INSTRUCTIONS;
    } else if (mode == INSTRUCTIONS) {
      mode = STARTPAGE;
    }
  }
  // start the game
  if (key == ' ' && mode != GAME) {
    //p = new Player(40, height-100, 50);
    mode = GAME;
  }

  // end the game
  if (key == 'e' && mode == GAME) mode = END;
}

void mouseClicked() {
  // delete later, this is only for testing
  mode++;
  if (mode > 3) mode = 0;
}

void startPage() {
  stroke(0);
  fill(255);
  rect(width/2-500, height/2-250, 1000, 500);

  // end screen text
  fill(0);
  textSize(75);
  text("UniverseGazers", 370, 300);
  textSize(45);
  text("Press space to start!", 430, 400);
  text("Press 'i' for instructions.", 390, 480);
}

void instructions() {
  // to implement later
}

void game() {
  currentScore = 0;
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
