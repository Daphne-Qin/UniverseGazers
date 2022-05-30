Player p;

// stat variables
int highScore;
int currentScore;
int coins;

ArrayList<Bullet> bulletList;
ArrayList<Coin> coinList;
ArrayList<Obstacle> obstacleList;
ArrayList<Spacemen> spacemenList;

// mode variables
int mode;
final int STARTPAGE = 0;
final int INSTRUCTIONS = 1;
final int GAME = 2;
final int END = 3;

// game mechanic variables
final int ceiling = 50;
final int floor = 670;
float scrollLeft;

void setup() {
  size(1280, 720);
  background(225);
  highScore = 0;
  coins = 0;
  scrollLeft = -5;

  mode = STARTPAGE;
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
  //text("Mode: " + mode, 10, 10);
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
    makeCoinList();
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
  // display floor, ceiling, currentScore, coins
  PImage bg = loadImage("UniverseBackground.png");
  image(bg,0,0);
  
  // display floor, ceiling, currentScore, coins
  fill(255);
  rect(0, 0, width, ceiling); // ceiling
  rect(0, floor, width, ceiling); // floor
  fill(0);
  textSize(15);
  text("Current score: " + currentScore, 10, 20);
  text("Coins collected: " + coins, 10, 40);
  
  
  // === move all elements ===
  p.move();
  p.display();
  
  for (Obstacle o : obstacleList){
    o.display();
    o.move();
    
    // check for game end at the same time
    if (p.isTouchingObstacle(o)) mode = END;
  }
  
  for (int i = 0; i < coinList.size(); i++) {
    Coin c = coinList.get(i);
    c.display();
    c.move();
    
    // add coins at the same time
    if (p.isTouchingCoin(c)) {
      coinList.remove(c);
      coins++;
    }
  }
  
  
  // === increment score ===
  currentScore++;
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

void makeBulletList(){
  bulletList = new ArrayList<Bullet>();
}

void makeCoinList() {
  coinList = new ArrayList<Coin>();
  coinList.add(new Coin(1000, 605));
}

void makeObstacleList(){
  obstacleList = new ArrayList<Obstacle>();
  obstacleList.add(new Obstacle(400, 500, 50, 50));
}

void makeSpacemenList(){
  spacemenList = new ArrayList<Spacemen>();
}
