public class Bullet{
  private float x, y, dx, dy;
  
  public Bullet(float x, float y){
    this.x = x;
    this.y = y;
    dy = 0;
  }
  
  void display(){
    fill(120,52,34);
    //not sure why we're using rects
    //rect(x, y, (int)(Math.random()*30+1), (int)(Math.random()*320+1));
    ellipse(x,y,15,7.5);
  }
  
  void move(){
    // should shoot out in 3 directions but from the same x and y coordinates
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
