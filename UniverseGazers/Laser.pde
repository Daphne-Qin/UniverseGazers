public class Laser extends Obstacle {  
  private final static int DANGERTIME = 130;
  private final static int WARNINGTIME = DANGERTIME * 2;
  private final static int APPEAR = DANGERTIME * 3;
  private int countdown;

  public Laser(float x, float y, int wid, int ht) {
    super(x, y, wid, ht);
    countdown = APPEAR;
  }

  public Laser(float x, float y) {
    this(x, y, 1180, 20);
  }

  void display() {
    // laser pointers
    fill(150, 150, 150);
    rect(getX(), getY(), 75, getHeight());
    rect(width-getX()-75, getY(), 75, getHeight());
    fill(245, 113, 5);
    rect(getX()+75, getY(), 25, getHeight());
    rect(width-getX()-100, getY(), 25, getHeight());

    // laser beam
    if (countdown < DANGERTIME) { // actual laser beam
      fill(255, 46, 119);
      rect(getX()+100, getY(), width-getX()-250, getHeight());
    } else if (countdown < WARNINGTIME && countdown >= DANGERTIME) { // warning
      noStroke();
      fill(255, 46, 119, 100);
      rect(getX()+100, getY()+15, width-getX()-250, getHeight()-30);
      stroke(0);
    }
    // above WARNINGTIME: only display pointers, no extra code needed
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
  
  int getDangerTime(){
    return DANGERTIME;
  }
}
