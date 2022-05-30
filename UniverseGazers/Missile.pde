public class Missile extends Obstacle {

  public Missile(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
  }

  void display(){
    rect(getX(), getY(), getWidth(), getHeight());
  }

  // Missle inherits Obstacle move()
}
