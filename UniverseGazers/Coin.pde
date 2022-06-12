public class Coin {
  private float x, y;
  private int radius;
  private int imageNum;

  public Coin(float x, float y, int radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    imageNum = 0;
  }

  void display() {
    if (animations) {
      if (currentScore % 7 == 0) {
        imageNum++;
        if (imageNum == coinImage.length) imageNum = 0;
      }
    }
    image(coinImage[imageNum], x-radius, y-radius);
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
