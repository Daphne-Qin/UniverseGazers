public class Laser extends Obstacle{
  final int WARNINGTIME = 3000;
  final int DISPLAYTIME = 1500;
  
  public Laser(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
  }

  void display() {
    fill(255,46,119);
    strokeWeight(10);
    line(140, 600, 1140, 600);
  }

  // move() does nothing here, lasers stay in place
  @Override
  void move() {}
  
  // getX(), getY(), getWidth(), getHeight() are inherited; dy = 0
}
