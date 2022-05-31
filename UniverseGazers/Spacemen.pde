public class Spacemen{
  
  float x;
  float y;
  float dx;
  
  public Spacemen(float xval, float dxval){
    xval = x;
    dxval = dx;
    y = floor - 25;
  }
  
  void display(){
    ellipse(x, y, 25, 40);
  }
  
  void move(){
    x += dx;
    if (x == width){
      x =0;
    }
  }
  
  void setSpeed(float speed){
    dx = speed;
  }
  
  boolean isTouchingBullet(Bullet b){
    return(b.getX() == x && b.getY() == y);
  }
}
