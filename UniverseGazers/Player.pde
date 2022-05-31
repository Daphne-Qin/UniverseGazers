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
    fill(255,0,0);
    circle(x, y, 50);
  }

  void move(){
    // set dy
    if (keyPressed && key == ' ') {
      dy = -7;
    } else {
      dy = 15;
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
  
  boolean isTouchingCoin(Coin c) {
    return (dist(x, y, c.getX(), c.getY()) <= 40);
  }
  
  boolean isTouchingObstacle(Obstacle o){
    boolean horizontal = (x + 25 >= o.getX() && x - 25 <= o.getX()+o.getWidth());
    boolean vertical = (y + 25 >= o.getY() && y - 25 <= o.getY()+o.getHeight());
    return (horizontal && vertical);
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
