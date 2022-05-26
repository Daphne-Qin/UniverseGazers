public class Player{
  float x;
  float y;
  float dy;

  public Player(float xval, float yval){
    x = xval;
    y = yval;
    dy = 20;
  }

  void display(){
    // just using a circle for the player for now
    fill(255);
    circle(x, y, 50);
  }

  void move(){
    // set dy
    if (keyPressed && key == ' ') {
      dy = -7;
    } else {
      dy = 15;
    }
    
    // change y
    if (y + dy < ceiling + 25) { // at ceiling
      y = ceiling + 25;
    } else if (y + dy > floor - 25) { // at floor
      y = floor - 25;
    } else { // between ceiling and floor
      y += dy;
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

  float getYSpeed(){
    return dy;
  }

}
