public class Bullet {
  private float x, y, dx, dy;

  public Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    dx = (int)(Math.random()*3) * (-0.05); // should shoot out in 3 directions but from the same x and y coordinates
    dy = 25;
  }

  void display() {
    fill(120, 52, 34);
    ellipse(x, y, 15, 7.5);
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

  float getdx() {
    return dx;
  }

  float getdy() {
    return dy;
  }
}
