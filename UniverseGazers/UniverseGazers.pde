int highScore;
int currentScore;
int coins;
//ArrayList<Spacemen> spacemenList;
//ArrayList<Obstacle> obstacleList;
//ArrayList<Bullets> bulletList;

void setup() {
  size(1280, 720); // marge is 1600 x 900
  background(255);
  highScore = 0;
  currentScore = 0;
}

void keyPressed() {
  // start the game
  if (key == ' ') start();
  
  // end the game
  if (key == 'e') end();
}

void start() {
  Player p = new Player(40, height-100, 50);
  coins = 0;
}

void end() {
  
}
