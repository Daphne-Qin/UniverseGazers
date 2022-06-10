public class Player{
  private float x;
  private float y;
  private float dy;
  private float ACCELERATION;
  private float GRAVITY;
  private boolean goingUp;

  public Player(float xval, float yval){
    x = xval;
    y = yval;
    dy = 0;
    ACCELERATION = -0.50;
    GRAVITY = 0.35;
  }

  void display(){
    // just using a circle for the player for now
    //fill(255,0,0);
    //circle(x, y, 50);
    image(playerImage, x-25, y-25);
  }

  void move(){
    boolean atCeiling = y + dy < ceiling + 25;
    boolean atFloor = y + dy > floor - 25;
    
    // set dy to 0 if it's at the ceiling or floor
    if (atCeiling || atFloor) {
      dy = 0;
    }
    
    // modify dy based on direction
    if (keyPressed && key == ' ') {
      dy += ACCELERATION;
      goingUp = true;
    } else {
      dy += GRAVITY;
      goingUp = false;
    }
    
    // change y
    if (atCeiling) {
      y = ceiling + 25;
    } else if (atFloor) {
      y = floor - 25;
    } else { // between ceiling and floor
      y += dy;
    }
  }
  
  boolean isTouchingCoin(Coin c) {
    return (dist(x, y, c.getX(), c.getY()) <= 40);
  }
  
  // may have to edit to accomodate for missile and laser
  boolean isTouchingObstacle(Obstacle o){
    // check for Laser warning time
    String obstacleType = o.getClass().getSimpleName();
    if (obstacleType.equals("Laser")) {
      Laser l = (Laser)o;
      if (l.getCountdown() >= 200) return false;
    }
    
    // check dimensions
    boolean horizontal = (x + 25 >= o.getX() && x - 25 <= o.getX()+o.getWidth());
    boolean vertical = (y + 25 >= o.getY() && y - 25 <= o.getY()+o.getHeight());
    return (horizontal && vertical);
  }

  float getX(){
    return x;
  }

  float getY(){
    return y;
  }

  float getYSpeed(){
    return dy;
  }
  
  boolean getGoingUp(){
    return goingUp;
  }
}
