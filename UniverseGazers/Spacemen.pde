public class Spacemen {
  private float x, y;
  private int wid, ht;

  public Spacemen(float x, int wid, int ht) {
    this.x = x;
    this.y = floor - ht;
    this.wid = wid;
    this.ht = ht;
  }

  void display() {
    image(spacemenImage, x-wid, y);
  }

  void move() {
    x += scrollLeft + (float)(Math.random()*3)+5; // they need to move a bit to the right
  }

  boolean isTouchingBullet(Bullet b) {
    return(b.getX() == x && b.getY() == y);
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
