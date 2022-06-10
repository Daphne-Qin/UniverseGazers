public class Bullet {
  private float x, y, dx, dy;

  public Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    dx = (int)(Math.random()*5) * (-1) + 3; // should shoot out in 3 directions but from the same x and y coordinates
    dy = (float)(Math.random()*10)+25;
  }

  void display() {
    fill(230, 219, 190);
    ellipse(x, y, 7.5, 15);
  }

  void move() {
    // move the Bullet
    x += dx + scrollLeft;
    y += dy;
  }

  boolean isTouchingCoin(Coin c) {
    return (dist(x, y, c.getX(), c.getY()) <= 32.5);
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }

  float getXSpeed() {
    return dx;
  }

  float getYSpeed() {
    return dy;
  }
}
