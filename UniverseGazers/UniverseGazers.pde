//================================================================================
// VARIABLES
//================================================================================

// Player character
Player p;

// stat variables
int highScore, finalScore, currentScore, coins, currentCoins;

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
private int countdown; // timer for game restart
boolean animations;
String deathMethod;

// assets
PImage bg; // background
PImage[] coinImage; // coins
PImage obstacleImageHorizontal, obstacleImageVertical; // obstacle
PImage missileImage; // missile
PImage playerImage; // player
PImage spacemenImage; // spacemen

//================================================================================
// SKELETON - SETUP, DRAW
//================================================================================

void setup() {
  size(1280, 720);
  background(225);
  highScore = 0;
  coins = 0;
  scrollLeft = -5;
  initializeImages();
  animations = true;

  mode = STARTPAGE;
}

void draw() {
  background(225);

  if (countdown > 0) countdown--;

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
  // toggle animations
  if (key == 'a') {
    animations = (!animations) ? true : false;
  }

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
    p = new Player(200, floor - playerImage.height/2, playerImage.height/2); // width and height are the same value here
    makeLists();
    currentScore = 0;
    currentCoins = 0;
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
  background(5,84,70);
  stroke(0);
  strokeWeight(20);
  fill(175,250,230);
  rect(width/2-500, height/2-250, 1000, 500);

  // start screen text
  textAlign(CENTER);
  fill(0);
  textSize(75);
  text("UniverseGazers", width/2, 300);
  textSize(45);
  text("Press space to start!", width/2, 380);
  text("Press 'i' for instructions.", width/2, 460);
  textSize(30);
  text("Press 'a' to turn off animations at any time during the game.", width/2, 540);
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
  textSize(15);
  text("If the game lags with animations, press \"a\". Press \"a\" again to turn it back on.", 640, 630);
}

void game() {
  // display floor, ceiling, currentScore, coins
  strokeWeight(1);
  image(bg, 0, 0);
  fill(5, 84, 70);
  rect(0, 0, width, ceiling); // ceiling
  rect(0, floor, width, ceiling); // floor
  fill(0);
  textSize(15);
  textAlign(LEFT);
  fill(255);
  text("Current score: " + currentScore, 10, 20);
  text("Coins collected: " + currentCoins, 10, 40);


  // === move all elements ===
  moveElements();

  // === spawn elements ===
  // spawn Coins
  if (Math.random() < 0.003) spawnCoins();
  // spawn Lasers
  if (Math.random() < 0.001) spawnLasers();
  // spawn Missiles
  if (Math.random() < 0.002) spawnMissiles();
  // spawn Obstacles
  if (Math.random() < 0.008) spawnObstacles();
  // spawn Spacemen
  if (Math.random() < 0.01) spawnSpacemen();
  if (p.getGoingUp()) spawnBullets();

  // === increment score and speed ===
  currentScore++;
  if (scrollLeft > -20) scrollLeft -= 0.0025;
}

void end() {
  mode = END;
  coins += currentCoins;
  finalScore = currentScore + currentCoins * 2;
  countdown = 50;
}

void endPage() {
  stroke(0);
  fill(255);
  strokeWeight(1);
  rect(width/2-500, height/2-250, 1000, 500);

  // end screen text
  textAlign(CENTER);
  fill(0);
  textSize(50);
  if (!deathMethod.equals("Obstacle")) {
    text("You hit a" + deathMethod + "! Try again?", width/2, 230);
  } else {
    text("You hit an " + deathMethod + "! Try again?", width/2, 230);
  }
  textSize(30);
  text("Raw Score: " + (currentScore-1), width/2, 310); // it increments by 1 while end() is running so this is to counteract that
  text("Final Score: " + finalScore, width/2, 360);
  fill(255, 0, 0);
  if (calcHighScore(finalScore)) text("New High Score!", width/2, 410);
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

void initializeImages() {
  int w, h, r; // width, height, radus - makes it slightly more convenient/clear to type in variables

  // background
  bg = loadImage("./assets/UniverseBackground.png");

  // Coins
  r = 30;
  coinImage = new PImage[8];
  for (int i = 0; i < coinImage.length; i++) {
    coinImage[i] = loadImage("./assets/Coin" + i + ".png");
    coinImage[i].resize(r, r);
  }

  // Obstacles
  w = 170;
  h = 65;
  obstacleImageHorizontal = loadImage("./assets/ObstacleHorizontal.png");
  obstacleImageHorizontal.resize(w, h);
  obstacleImageVertical = loadImage("./assets/ObstacleVertical.png");
  obstacleImageVertical.resize(h, w);

  // Missiles
  w = 100;
  h = 50;
  missileImage = loadImage("./assets/Missile.png");
  missileImage.resize(w, h); // need to resize

  // Player
  r = 60;
  playerImage = loadImage("./assets/Player.png");
  playerImage.resize(r, r);

  // Spacemen
  w = 50;
  h = 50;
  spacemenImage = loadImage("./assets/Spacemen.png");
  spacemenImage.resize(w, h);
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
  for (int i = 0; i < bulletList.size(); i ++) {
    Bullet b = bulletList.get(i);
    b.move();
    b.display();
    // check if it's touching a Coin
    for (int j = coinList.size()-1; j >= 0; j--) {
      Coin c = coinList.get(j);
      if (b.isTouchingCoin(c)) {
        bulletList.remove(b);
        coinList.remove(c);
        currentCoins++;
      }
    }
    // get rid of it if it's below the floor
    if (b.getY() + b.getYSpeed() >= floor) bulletList.remove(b);
  }
}


// == spawning Objects within their respective ArrayLists ==

void spawnBullets() {
  if (countdown != 0) return;
  Bullet b = new Bullet(p.getX(), p.getY()+25);
  bulletList.add(b);
  countdown = 7;
}

void spawnCoins() {
  int distance = 200;
  
  
  int coinDiameter = coinImage[0].height;

  int[][] layout = CoinLayouts.getArrangement();
  float firstX = width + coinDiameter/2; // spawns directly off-screen
  float firstY = ( (float)(Math.random()*20) ) * 5 + ceiling + coinDiameter/2; // I forgot what exactly this algorithm was and it's imperfect, so I will redo it

  // check for Coin or Obstacle overlaps within "distance" px
  for (int i = 0; i < layout.length; i++) { // determines y
    for (int j = 0; j < layout[i].length; j++) { // determines x
      float x = firstX + j * coinDiameter;
      float y = firstY + i * coinDiameter;

      for (Coin c : coinList) { // check for overlap with Coins
        float d = dist(x, y, c.getX(), c.getY());
        if (d <= distance) return;
      }

      for (Obstacle o : obstacleList) { // check for overlap with Obstacles
        float d = dist(x, y, o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2);
        if (d <= distance) return;
      }
    }
  }

  // add all the coins
  for (int i = 0; i < layout.length; i++) { // determines y
    for (int j = 0; j < layout[i].length; j++) { // determines x
      if (layout[i][j] == 1) {
        float x = firstX + j * coinDiameter;
        float y = firstY + i * coinDiameter;
        coinList.add(new Coin(x, y, coinDiameter/2));
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
  float randY = (float)(Math.random()*(floor-ceiling-missileImage.height)) + ceiling;
  Missile m = new Missile(1280, randY, missileImage.width, missileImage.height);
  missileList.add(m);
}

void spawnObstacles() {
  int distance = 200; // determines distance between Objects
  
  
  // set the two Obstacle orientations
  float y1 = (float)(Math.random()*(floor-ceiling-obstacleImageHorizontal.height)) + ceiling; // horizontal
  float y2 = (float)(Math.random()*(floor-ceiling-obstacleImageVertical.height)) + ceiling; // vertical
  Obstacle o1 = new Obstacle(1280, y1, obstacleImageHorizontal.width, obstacleImageHorizontal.height); // horizontal
  Obstacle o2 = new Obstacle(1280, y2, obstacleImageVertical.width, obstacleImageVertical.height); // vertical

  // determine Obstacle type
  Obstacle o = (Math.random() < 0.5) ? o1 : o2;

  // check if the Obstacle would overlap with another Coin within a "distance" px distance
  for (Coin c : coinList) {
    float d = dist(o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2, c.getX(), c.getY());
    if (d <= distance) return;
  }


  // check if either would overlap with another Obstacle within a "distance" px distance
  for (Obstacle obs : obstacleList) {
    float d = dist(o.getX()+o.getWidth()/2, o.getY()+o.getHeight()/2, obs.getX()+obs.getWidth()/2, obs.getY()+obs.getHeight()/2);
    if (d <= distance) return;
  }

  // add the Obstacle
  obstacleList.add(o);
}

void spawnSpacemen() {
  Spacemen man = new Spacemen(width + spacemenImage.width, spacemenImage.width, spacemenImage.height);

  // check if Spacemen would overlap with other Spacemen within a 50 px distance
  for (Spacemen s : spacemenList) {
    float d = Math.abs(man.getX()+man.getWidth()/2 - s.getX()+s.getWidth()/2);
    if (d <= 50) return;
  }

  // add man
  spacemenList.add(man);
}
