public class Coin {
  private float x, y;
  private int radius;

  public Coin(float x, float y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
  }

  void display() {
    image(coinImage, x-radius, y-radius);
  }

  void move() {
    x += scrollLeft;
  }

  float getX() {
    return x;
  }

  float getY() {
    return y;
  }
  
  int getRadius() {
    return radius;
  }
}
