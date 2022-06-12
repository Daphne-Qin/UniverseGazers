public class Bullet {
  private float x, y, dx, dy;
  private int wid, ht;

  public Bullet(float x, float y, int wid, int ht) {
    this.x = x;
    this.y = y;
    dx = (int)(Math.random()*5) * (-1) + 3; // should shoot out in 3 directions but from the same x and y coordinates
    dy = (float)(Math.random()*10)+25;
    this.wid = wid;
    this.ht = ht;
  }

  void display() {
    fill(230, 219, 190);
    ellipse(x, y, wid, ht);
  }

  void move() {
    // move the Bullet
    x += dx + scrollLeft;
    y += dy;
  }

  boolean isTouchingCoin(Coin c) {
    return (dist(x + wid/2, y + ht/2, c.getX(), c.getY()) <= ht/2 + c.getRadius());
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

  int getWidth() {
    return wid;
  }

  int getHeight() {
    return ht;
  }
}
