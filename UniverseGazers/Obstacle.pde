public class Obstacle{
  private float x, y, dy;
  private int wid, ht;
  
  public Obstacle(){
    x = 1280;
    y = (float)(Math.random()*floor-ceiling) + ceiling;
    wid = (int)(Math.random()*50)+20;
    ht = (int)(Math.random()*50)+20;
  }
  
  public Obstacle(float xval, float yval, int wid, int ht){
    x = xval;
    y = yval;
    this.wid = wid;
    this.ht = ht;
  }
  
  void display(){
    fill(204, 143, 247);
    rect(x, y, wid, ht);
  }
  
  void move(){
    x += scrollLeft;
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
  
  int getWidth() {
    return wid;
  }
  
  int getHeight() {
    return ht;
  } 
}
