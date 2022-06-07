//================================================================================
// VARIABLES
//================================================================================

// Player character
Player p;

// stat variables
int highScore;
int currentScore;
int coins;
int currentCoins;

// game element ArrayLists
ArrayList<Bullet> bulletList;
ArrayList<Coin> coinList;
ArrayList<Laser> laserList;
ArrayList<Missile> missileList;
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
private int countdown; // timer for game restart



//================================================================================
// SKELETON - SETUP, DRAW
//================================================================================

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

  if (countdown > 0) countdown--;
  //System.out.println(countdown);

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
    endPage();
    break;
  }

  // for testing only
  textSize(10);
  fill(0);
  //text("Mode: " + mode, 10, 10);
}



//================================================================================
// USER INPUT + GAMESTART (SPACE KEY)
//================================================================================

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
  if (key == ' ' && mode != GAME && countdown == 0) {
    p = new Player(200, floor - 25);// 50 is the diameter
    makeLists();
    currentScore = 0;
    scrollLeft = -5;
    mode = GAME;
  }

  // end the game
  if (key == 'e' && mode == GAME) end();
}



//================================================================================
// MODES
//================================================================================

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
  fill(255);
  rect(0, 0, width, ceiling); // ceiling
  rect(0, floor, width, ceiling); // floor
  fill(0);
  textSize(15);
  textAlign(LEFT);
  text("Current score: " + currentScore, 10, 20);
  text("Coins collected: " + currentCoins, 10, 40);


  // === move all elements ===
  moveElements();

  // === spawn elements ===
  // spawn Coins
  if (Math.random() < 0.0025) spawnCoins();
  // spawn Lasers
  if (Math.random() < 0.001) spawnLasers();
  // spawn Missiles
  if (Math.random() < 0.002) spawnMissiles();
  // spawn Obstacles
  if (Math.random() < 0.015) spawnObstacles();
  // spawn Spacemen
  if (Math.random() < 0.01) spawnSpacemen();
  if (p.getGoingUp()) spawnBullets();

  // === increment score and speed ===
  currentScore++;
  if (scrollLeft > -20) scrollLeft -= 0.005;
}

void end() {
  mode = END;
  countdown = 100;
}

void endPage() {
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



//================================================================================
// VARIABLES
//================================================================================

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

void setScrollLeft(float val) {
  scrollLeft = scrollLeft + val;
}



//================================================================================
// ARRAYLIST HELPER METHODS
//================================================================================

// initializes the various ArrayLists (new one initialized every game)
void makeLists() {
  bulletList = new ArrayList<Bullet>();
  coinList = new ArrayList<Coin>();
  laserList = new ArrayList<Laser>();
  missileList = new ArrayList<Missile>();
  obstacleList = new ArrayList<Obstacle>();
  spacemenList = new ArrayList<Spacemen>();
}

// moves all Objects within the various ArrayLists
void moveElements() {
  // Player
  p.move();
  p.display();

  // General format: display, move, check if Player is touching it (if so game end or remove), check if it's off the screen and remove to save space

  // Coins
  for (int i = 0; i < coinList.size(); i++) {
    Coin c = coinList.get(i);
    c.move();
    c.display();
    // add coins at the same time
    if (p.isTouchingCoin(c)) {
      coinList.remove(c);
      currentCoins++;
    }
    // get rid of it if it's to the left of the screen
    if (c.getX() == -1000) coinList.remove(c);
  }
  
  // Obstacles
  for (int i = 0; i < obstacleList.size(); i++) {
    Obstacle o = obstacleList.get(i);
    o.move();
    o.display();
    // check for game end at the same time
    if (p.isTouchingObstacle(o)) end();
    // get rid of it if it's to the left of the screen
    if (o.getX() == -1000) obstacleList.remove(o);
  }
  
  // Missles
  for (int i = 0; i < missileList.size(); i++) {
    Missile m = missileList.get(i);
    m.move();
    m.display();
    // check for game end at the same time
    if (p.isTouchingObstacle(m)) end();
    // get rid of it if it's to the left of the screen
    if (m.getX() == -1000) missileList.remove(m);
  }

  // Lasers
  for (int i = 0; i < laserList.size(); i++) {
    Laser l = laserList.get(i);
    l.display();
    // check for game end at the same time
    if (p.isTouchingObstacle(l)) end();

    if (l.getCountdown() == 0) { // get rid of it if its countdown is at 0
      laserList.remove(l);
    } else { // decrease countdown by 1
      l.decreaseCountdown();
    }
  }

  // Spacemen
  for (int i = 0; i < spacemenList.size(); i++) {
    Spacemen s = spacemenList.get(i);
    s.move();
    s.display();
    // get rid of it if it's to the left of the screen
    if (s.getX() == -1000) spacemenList.remove(s);
  }
  
  // Bullets
  for (int i = 0; i < bulletList.size(); i ++){
    Bullet b = bulletList.get(i);
    b.move();
    b.display();
    // check if it's touching a Coin
    for (Coin c : coinList) {
      if (b.isTouchingCoin(c)) {
        bulletList.remove(b);
        //coinList.remove(c);
        currentCoins++;
      }
    }
    // get rid of it if it's below the floor
    if (b.getY() >= floor) bulletList.remove(b);
  }
}


// == spawning Objects within their respective ArrayLists ==

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

void spawnLasers() {
  if (laserList.size() != 0) return;
  // 7 total Laser positionings in total, determine which show up
  for (int i = 0; i < 7; i++) {
    if (Math.random() < Math.pow(0.5, laserList.size()+1)) {
      laserList.add(new Laser(50, ceiling + 25 + 85*i));
    }
  }
}

void spawnMissiles() {
  float randY = (float)(Math.random()*(floor-ceiling-25)) + ceiling;
  Missile missile = new Missile(1280, randY, 100, 20);
  missileList.add(missile);
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

void spawnSpacemen() {
  Spacemen man = new Spacemen(1295);
  spacemenList.add(man);
}

void spawnBullets(){
  Bullet b = new Bullet(p.getX(), p.getY()+25);
  bulletList.add(b);
}
