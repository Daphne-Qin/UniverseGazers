public class Obstacle{
  private float x, y, dx, dy;
  private int wid, ht;
  
  public Obstacle(){
    x = (float)(Math.random()*width);
    y = (float)(Math.random()*height);
    dx = -40;
    wid = (int)(Math.random()*50)+10;
    ht = (int)(Math.random()*50)+10;
  }
  
  public Obstacle(float xval, float yval, int wid, int ht){
    x = xval;
    y = yval;
    this.wid = wid;
    this.ht = ht;
  }
  
  void display(){
    rect(x, y, wid, ht);
  }
  
  void move(){
    x += dx + scrollLeft;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  float getXSpeed(){
    return dx;
  }
  
  float getYSpeed(){
    return dy;
  }
  
  int getWidth() {
    return wid;
  }
  
  int getHeight() {
    return ht;
  } 
}
