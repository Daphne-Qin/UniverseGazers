Player p;

int highScore;
int currentScore;
int coins;
ArrayList<Spacemen> spacemenList;
ArrayList<Obstacle> obstacleList;
ArrayList<Bullet> bulletList;

int mode;
final int STARTPAGE = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int END = 3;

final int ceiling = 40;
final int floor = 680;

float scrollLeft;

void setup() {
  size(1280, 720);
  background(225);
  highScore = 0;
  coins = 0;
  scrollLeft = -5;

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
    p = new Player(200, floor - 25);// 50 is the diameter
    makeObstacleList();
    currentScore = 0;
    scrollLeft = -5;
    mode = GAME;
  }

  // end the game
  if (key == 'e' && mode == GAME) mode = END;
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
  
  text("Hold down the space bar to move towards the top of the screen.", 100, 100);
  text("Release to let gravity bring you down.", 100, 200);
}

void game() {
  textSize(20);
  text("Current score: " + currentScore, 10, 10);
  fill(255);
  rect(0, 0, width, 40); // ceiling
  rect(0, floor, width, 40); // floor
  p.move();
  p.display();
  
  for (int i = 0; i < obstacleList.size(); i++){
    obstacleList.get(i).display();
    obstacleList.get(i).move();
  }
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

void setMode(int modeNum) {
  mode = modeNum;
}

void makeObstacleList(){
  obstacleList = new ArrayList<Obstacle>();
  obstacleList.add(new Obstacle(400, 500));
}

void makeBulletList(){
  bulletList = new ArrayList<Bullet>();
}

void makeSpacemenList(){
  spacemenList = new ArrayList<Spacemen>();
}
