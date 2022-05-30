public class Obstacle{
  private float x;
  private float y;
  private float dx;
  private float dy;
  
  public Obstacle(){
    float rand1 = (float)(Math.random()*width);
    float rand2 = (float)(Math.random()*height);
    x = rand1;
    y = rand2;
    dx = -40;
  }
  
  public Obstacle(float xval, float yval){
    x = xval;
    y = yval;
  }
  
  void display(){
    rect(x, y, 50, 50);
  }
  
  void move(){
    x += dx;
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
  
}
