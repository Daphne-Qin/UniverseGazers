public class Laser extends Obstacle{
  final int WARNINGTIME = 3000;
  final int DISPLAYTIME = 1500;
  
  public Laser(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
  }

  void display() {
    super.display();
  }

  // move() does nothing here, lasers stay in place
  @Override
  void move() {}
  
  // getX(), getY(), getWidth(), getHeight() are inherited; dy = 0
}
