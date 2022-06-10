public class Obstacle{
  float x, y, dy;
  int wid, ht;
  
  public Obstacle(float x, float y, int wid, int ht){
    this.x = x;
    this.y = y;
    this.wid = wid;
    this.ht = ht;
  }
  
  void display(){
    if (wid > ht) {
      image(obstacleImageHorizontal, x, y);
    } else {
      image(obstacleImageVertical, x, y);
    }
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
