public class Missile extends Obstacle {

  public Missile(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
  }

  void display(){
    rect(getX(), getY(), getWidth(), getHeight());
  }

  // Missle inherits Obstacle move()
  // actually nevermind, going to make the missiles bob up and down as they move across the screen
  
  void move(){
    super.move();
    float bob = 30;
    //Missile.getY() += bob;
    if (getX() % 20 == 0){
     bob = -bob;
    }
  }
  
}
