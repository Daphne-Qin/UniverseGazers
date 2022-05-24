public abstract class Obstacle{
  float x;
  float y;
  float dx;
  float dy;
  
  public Obstacle(){
  }
  
  void display(){
    float rand1 = (float)(Math.random()*width);
    float rand2 = (float)(Math.random()*height);
    rect(x, y, rand1, rand2);
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
