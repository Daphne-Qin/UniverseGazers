public class Obstacle{
  float x, y, dy;
  int wid, ht;
  
  public Obstacle(float xval, float yval, int wid, int ht){
    x = xval;
    y = yval;
    this.wid = wid;
    this.ht = ht;
  }
  
  void display(){
    image(obstacleImage, x, y);
    //fill(204, 143, 247);
    //rect(x, y, wid, ht);
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
