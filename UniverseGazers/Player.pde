public class Player {
  private float x, y, dy;
  private int radius;
  private float ACCELERATION, GRAVITY;
  private boolean goingUp;

  public Player(float x, float y, int radius) {
    this.radius = radius;
    this.x = x;
    this.y = y;
    dy = 0;
    ACCELERATION = -0.50;
    GRAVITY = 0.35;
  }

  void display() {
    image(playerImage, x-radius, y-radius);
  }

  void move() {
    boolean atCeiling = y + dy < ceiling + radius;
    boolean atFloor = y + dy > floor - radius;

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
      y = ceiling + radius;
    } else if (atFloor) {
      y = floor - radius;
    } else { // between ceiling and floor
      y += dy;
    }
  }

  boolean isTouchingCoin(Coin c) {
    return (dist(x, y, c.getX(), c.getY()) <= radius + c.getRadius());
  }

  // may have to edit to accomodate for missile and laser
  boolean isTouchingObstacle(Obstacle o) {
    // check for Laser warning time
    String obstacleType = o.getClass().getSimpleName();
    if (obstacleType.equals("Laser")) {
      Laser l = (Laser)o;
      if (l.getCountdown() >= l.getDangerTime()) return false;
    }

    // check dimensions
    boolean horizontal = (x + radius >= o.getX() && x - radius <= o.getX()+o.getWidth());
    boolean vertical = (y + radius >= o.getY() && y - radius <= o.getY()+o.getHeight());
    return (horizontal && vertical);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getYSpeed() {
    return dy;
  }

  float getRadius() {
    return radius;
  }

  boolean getGoingUp() {
    return goingUp;
  }
}
