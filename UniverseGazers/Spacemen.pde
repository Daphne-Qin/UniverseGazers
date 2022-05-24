public class Spacemen{
  
  float x;
  float y;
  float dx;
  
  public Spacemen(float xval, float dxval){
    xval = x;
    dxval = dx;
    y = height - 5;
  }
  
  void display(){
    ellipse(x, y, 5, 5);
  }
  
  void move(){
    x += dx;
    if (x == width){
      x =0;
    }
  }
  
  void setSpeed(float speed){
    dx = speed;
  }
}
