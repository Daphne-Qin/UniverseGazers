Player p;

// stat variables
int highScore;
int currentScore;
int coins;
int currentCoins;

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
float scrollLeft; // speed at which game elements moves left
PImage bg; // background

void setup() {
  size(1280, 720);
  background(225);
  highScore = 0;
  coins = 0;
  scrollLeft = -5;
  bg = loadImage("UniverseBackground.png");

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
    makeSpacemenList();
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

  // start screen text
  textAlign(CENTER);
  fill(0);
  textSize(75);
  text("UniverseGazers", width/2, 300);
  textSize(45);
  text("Press space to start!", width/2, 400);
  text("Press 'i' for instructions.", width/2, 480);
}

void instructions() {
  // to implement later

  background(197, 231, 250);
  textAlign(CENTER);
  textSize(30);
  text("The Four General Rules!", 640, 100);
  text("- Hold down the space bar to move towards the top of the screen.", 640, 200);
  text("- Release the space bar to let gravity bring you down.", 640, 300);
  text("- Avoid obstacles! One hit to an obstacle will kill you.", 640, 400);
  text("- Run into coins to collect them!", 640, 500);
  text("(Press space to begin game)", 640, 600);
}

void game() {
  // display floor, ceiling, currentScore, coins
  image(bg, 0, 0);

  // display floor, ceiling, currentScore, coins
  fill(255);
  rect(0, 0, width, ceiling); // ceiling
  rect(0, floor, width, ceiling); // floor
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Current score: " + currentScore, 10, 20);
  text("Coins collected: " + currentCoins, 10, 40);


  // === move all elements ===
  p.move();
  p.display();

  for (Obstacle o : obstacleList) {
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
      currentCoins++;
    }
  }

  for (int j = 0; j < spacemenList.size(); j ++) {
    Spacemen s = spacemenList.get(j);
    s.display();
    s.move();
  }

  // spawn Coins
  if (Math.random() < 0.0025) spawnCoins();

  // spawn Obstacles
  if (Math.random() < 0.015) spawnObstacles();

  // spawn Spacemen
  // frequency TBD
  if (Math.random() < 0.01) spawnSpacemen();


  // === increment score and speed ===
  currentScore++;
  if (scrollLeft > -20) scrollLeft -= 0.005;
}

void end() {
  stroke(0);
  fill(255);
  rect(width/2-500, height/2-250, 1000, 500);

  coins += currentCoins;
  int calc = currentScore + currentCoins * 2;
  currentCoins = 0; // to avoid calculating high score and total coins more than once

  // end screen text
  textAlign(CENTER);
  fill(0);
  textSize(50);
  text("You lost! Try again?", width/2, 230);
  textSize(30);
  text("Raw Score: " + currentScore, width/2, 310);
  text("Final Score: " + calc, width/2, 360);
  fill(255, 0, 0);
  if (calcHighScore(calc)) text("New High Score!", width/2, 410);
  fill(0);
  text("Press space to replay.", width/2, 490);
  textSize(15);
  text("High Score: " + highScore, width/2, 530);
  text("Total Coins: " + coins, width/2, 560);
}

boolean calcHighScore(int calc) {
  if (calc >= highScore) { // highScore changed
    highScore = calc;
    return true;
  }

  return false; // highScore unchanged
}

void addToCoin() {
  currentCoins++;
}

void setMode(int modeNum) {
  mode = modeNum;
}

void makeBulletList() {
  bulletList = new ArrayList<Bullet>();
}

void makeCoinList() {
  coinList = new ArrayList<Coin>();
}

void makeObstacleList() {
  obstacleList = new ArrayList<Obstacle>();
}

void makeSpacemenList() {
  spacemenList = new ArrayList<Spacemen>();
}

void spawnCoins() {
  int[][] layout = CoinLayouts.getArrangement();
  float firstX = 1295;
  float firstY = ( (float)(Math.random()*20) ) * 5 + ceiling + 15; // all layouts have 6 rows or less, so 30 is enough

  // check for Coin or Obstacle overlaps within 200 px
  for (int i = 0; i < layout.length; i++) { // determines y
    for (int j = 0; j < layout[i].length; j++) { // determines x
      float x = firstX + j * 30;
      float y = firstY + i * 30;

      for (Coin c : coinList) { // check for overlap with Coins
        float d = dist(x, y, c.getX(), c.getY());
        if (d <= 200) return;
      }

      for (Obstacle o : obstacleList) { // check for overlap with Obstacles
        float d = dist(x, y, o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2);
        if (d <= 200) return;
      }
    }
  }

  for (int i = 0; i < layout.length; i++) { // determines y
    for (int j = 0; j < layout[i].length; j++) { // determines x
      if (layout[i][j] == 1) {
        float x = firstX + j * 30;
        float y = firstY + i * 30;
        coinList.add(new Coin(x, y));
      }
    }
  }
}

void setScrollLeft(float val) {
  scrollLeft = scrollLeft + val;
}

void spawnObstacles() {
  // set the two Obstacle orientations
  float y1 = (float)(Math.random()*(floor-ceiling-25)) + ceiling;
  float y2 = (float)(Math.random()*(floor-ceiling-100)) + ceiling;
  Obstacle o1 = new Obstacle(1280, y1, 100, 25);
  Obstacle o2 = new Obstacle(1280, y2, 25, 100);

  // determine Obstacle type
  Obstacle o;
  o = (Math.random() < 0.5) ? o1 : o2;

  // check if the Obstacle would overlap with another Coin within a 200 px distance
  for (Coin c : coinList) {
    float d = dist(o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2, c.getX(), c.getY());
    if (d <= 200) return;
  }


  // check if either would overlap with another Obstacle within a 200 px distance
  for (Obstacle obs : obstacleList) {
    float d = dist(o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2, obs.getX()+obs.getWidth()/2, obs.getY()+obs.getHeight()/2);
    if (d <= 200) return;
  }

  // add the Obstacle
  obstacleList.add(o);
}

void spawnSpacemen(){
  Spacemen man = new Spacemen(1280);
  spacemenList.add(man);
}
