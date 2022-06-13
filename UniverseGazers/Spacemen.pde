public class Spacemen {
  private float x, y, dx;
  private int wid, ht;
  private int imageNum;

  public Spacemen(float x, int wid, int ht) {
    this.x = x;
    this.y = FLOOR;
    this.dx = (float)(Math.random()*3)+5;
    this.wid = wid;
    this.ht = ht;
    imageNum = 0;
  }

  void display() {
    if (animations) {
      if (currentScore % 7 == 0) {
        imageNum++;
        if (imageNum == spacemenImage.length) imageNum = 0;
      }
    }
    image(spacemenImage[imageNum], x-wid, y-ht);
  }

  void move() {
    x += dx + scrollLeft; // they need to move a bit to the right
  }

  float getX() {
    return x;
  }

  int getWidth() {
    return wid;
  }

  int getHeight() {
    return ht;
  }
}
