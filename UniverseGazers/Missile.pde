public class Missile extends Obstacle {

  public Missile(float x, float y, int wid, int ht){
    super(x, y, wid, ht);
  }

  void display(){
    image(missileImage, x, y);
    //fill(255, 172, 200);
    //ellipse(getX(), getY(), getWidth() + 10, getHeight()+10);
    //fill(255,46,119);
    //ellipse(getX(), getY(), getWidth(),getHeight());
  }

  // Missle inherits Obstacle move()
  // actually nevermind, going to make the missiles bob up and down as they move across the screen
  // and move faster
  
  void move(){
    float newScrollLeft = scrollLeft-10;
    x += newScrollLeft;
    // need to add viable code for bobbing up and down
  }
  
}
