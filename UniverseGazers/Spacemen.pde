public class Spacemen{
  
  float x;
  float y;
  
  public Spacemen(float xval){
    x = xval;
    y = floor - 20;
  }
  
  void display(){
    fill(100);
    ellipse(x, y, 25, 40);
  }
  
  void move(){
    x += scrollLeft;
  }
  
  boolean isTouchingBullet(Bullet b){
    return(b.getX() == x && b.getY() == y);
  }
}
