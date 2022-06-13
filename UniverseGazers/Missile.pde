public class Missile extends Obstacle {
  public Missile(float x, float y, int wid, int ht) {
    super(x, y, wid, ht);
  }

  void display() {
    image(missileImage, getX(), getY());
  }

  void move() {
    x += scrollLeft - 10;
  }
}
