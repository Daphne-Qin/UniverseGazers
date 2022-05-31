public class Coin {
  private float x, y;

  public Coin(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    //  we need to make the coins appear in clusters, so we'll need to find a way
    // for rand to only generate values close to each other, so for now i'll be using
    // 0 as a filler value;
    
    stroke(50);
    fill(0);
    textAlign(CENTER);
    text("C", x, y);
    fill(245, 215, 66);
    circle(x, y, 30);
  }
  
  void move() {
    x += scrollLeft;
  }
  
  float getX() {
    return x;
  }
  
  float getY() {
    return y;
  }
}
