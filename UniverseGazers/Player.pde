public class Player{
  private float x;
  private float y;
  private float dy;

  public Player(float xval, float yval){
    x = xval;
    y = yval;
    dy = 20;
  }

  void display(){
    // just using a circle for the player for now
    fill(255);
    circle(x, y, 50);
  }

  void move(){
    // set dy
    if (keyPressed && key == ' ') {
      dy = -14;
    } else {
      dy = 30;
    }
    
    // change y
    if (y + dy < ceiling + 25) { // at ceiling
      y = ceiling + 25;
    } else if (y + dy > floor - 25) { // at floor
      y = floor - 25;
    } else { // between ceiling and floor
      y += dy;
    }
  }

  boolean isTouching(Obstacle o){
    return (o.getX() == this.getX()
            && o.getY() == this.getY());
  }

  float getX(){
    return x;
  }

  float getY(){
    return y;
  }

  float getYSpeed(){
    return dy;
  }

}
