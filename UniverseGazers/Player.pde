public class Player{
  float x;
  float y;
  float dy;

  public Player(float xval, float yval){
    x = xval;
    y = yval;
    dy = 0;
  }

  void display(){
    // just using a circle for the player for now
    fill(255);
    circle(x, y, 50);
  }

  void move(){
    if (key == ' '){
      if (y == 0){
        y = 0;
      }
      else{
        y += dy;
      }
    }
    else{
      if (y == height){
        y = height;
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

  float getYspeed(){
    return dy;
  }

}
