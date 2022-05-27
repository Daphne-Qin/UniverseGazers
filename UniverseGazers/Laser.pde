public class Laser extends Obstacle{
  float x1;
  float y1;
  float x2;
  float y2;

  public Laser(float x1, float y1, float x2, float y2){
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
  }

  void display(){
    strokeWeight(10);
    stroke(255, 150, 0);
    line(x1, y1, x2, y2);

    // reset stroke to not mess with other elements
    strokeWeight(1);
    stroke(0);
  }

  // move() does nothing here, lasers stay in place
  @Override
  void move() {}
}
