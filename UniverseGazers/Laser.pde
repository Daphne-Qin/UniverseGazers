public class Laser extends Obstacle{
  private final static int WARNINGTIME = 500;
  private final static int DISPLAYTIME = WARNINGTIME/2;
  private int countdown;
  
  public Laser(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
    this.countdown = WARNINGTIME;
  }
  
  public Laser(float x, float y) {
    this(x, y, 1180, 50);
  }

  void display() {
    if (this.countdown >= DISPLAYTIME) { // warning
      fill(150, 150, 150);
      rect(getX(), getY(), 100, getHeight());
      rect(width-getX()-100, getY(), 100, getHeight());
    } else {
      super.display();
    }
  }

  // move() does nothing here, lasers stay in place
  @Override
  void move() {}
  
  // getX(), getY(), getWidth(), getHeight() are inherited; dy = 0
  
  int getCountdown() {
    return countdown;
  }
  
  void decreaseCountdown() {
    countdown--;
  }
}
