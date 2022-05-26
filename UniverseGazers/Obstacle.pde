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
  }
  
  public Obstacle(float xval, float yval){
    x = xval;
    y = yval;
  }
  
  void display(){
    rect(x, y, 2, 3);
  }
  
  void move(){
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
