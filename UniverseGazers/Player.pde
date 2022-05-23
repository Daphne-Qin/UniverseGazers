public class Player{

  float x;
  float y;
  float dx;
  float dy;

  public Player(float xval, float yval, float dxval){
    x = xval;
    y = yval;
    dx = dxval;
    dy = 0;
  }

  void display(){
    // just using a circle for the player for now
    ellipse(x, y, 10, 10);
  }

  void move(){
    x += dx;
    if (key == ' '){
      if (y == 0){
        y == 0;
      }
      else{
        y += dy;
      }
    }
    else{
      if (y == width){
        y = width;
      }
      else{
        y -= .10;
      }
    }
  }

  void isTouching(){
    // Obstacle class isn't written yet, so we can't write this method yet.
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

  float getYspeed(){
    return dy;
  }

}
