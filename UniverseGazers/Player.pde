public class Player {
  private float x, y, dy;
  private int radius;
  private float ACCELERATION, GRAVITY;

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
    boolean atCeiling = y + dy < CEILING + radius;
    boolean atFloor = y + dy > FLOOR - radius;

    // set dy to 0 if it's at the CEILING or FLOOR
    if (atCeiling || atFloor) {
      dy = 0;
    }

    // modify dy based on direction
    if (keyPressed && key == ' ') {
      dy += ACCELERATION;
    } else {
      dy += GRAVITY;
    }

    // change y
    if (atCeiling) {
      y = CEILING + radius;
    } else if (atFloor) {
      y = FLOOR - radius;
    } else { // between CEILING and FLOOR
      y += dy;
    }
  }

  boolean isTouchingCoin(Coin c) {
    return (dist(x, y, c.getX(), c.getY()) <= radius + c.getRadius());
  }

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
    if (horizontal && vertical) {
      deathMethod = obstacleType;
      return true;
    } else {
      return false;
    }
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

  int getRadius() {
    return radius;
  }
}
