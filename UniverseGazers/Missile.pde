public class Missile extends Obstacle {
  int wid;
  int ht;

  public Missile(float x, float y, int wid, int ht){
    super(x, y);
    this.wid = wid;
    this.ht = ht;
  }

  void display(){
    rect(getX(), getY(), wid, ht);
  }

  // Missle inherits Obstacle move()

  int getWidth() {
    return wid;
  }

  int getHeight() {
    return ht;
  }
}
