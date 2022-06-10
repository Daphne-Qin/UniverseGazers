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
    fill(245, 215, 66);
    image(coinImage, x-15, y-15);
    //circle(x, y, 30);
    //fill(204, 102, 0);
    //textAlign(CENTER);
    //textSize(15);
    //text("C", x, y+4.5);
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
