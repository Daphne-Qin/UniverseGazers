public class Bullet{
  private float x, y, dx, dy;
  
  public Bullet(float x, float y){
    this.x = x;
    this.y = y;
    dy = 0;
  }
  
  void display(){
    rect(x, y, (int)(Math.random()*30+1), (int)(Math.random()*320+1));
  }
  
  void move(){
  }
  
  boolean isTouchingCoin(){
    addToCoin();
    return true;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
}
