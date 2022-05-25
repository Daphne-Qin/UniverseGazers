public class Bullet{
  float x;
  float y;
  float dy;
  
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
  
  boolean isTouching(){
    addToCoin();
    return true;
  }
}
