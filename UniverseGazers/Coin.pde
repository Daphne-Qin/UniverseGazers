public class Coin{
  
  ArrayList<float[]> coins;
  
  public Coin(){
    coins = new ArrayList<float[]>();
  }
  
  void display(){
    
    //  we need to make the coins appear in clusters, so we'll need to find a way
    // for rand to only generate values close to each other, so for now i'll be using
    // 0 as a filler value;
    for (int i = 0; i < coins.size(); i ++){
      fill(245, 215, 66);
      stroke(50);
      text("C", coins.get(i)[0], coins.get(i)[1]);
      ellipse(coins.get(i)[0], coins.get(i)[1], 3.0, 3.0);
    }
  }
  
  void addCoin(float x, float y){
    coins.add(new float[]{x, y});
  }
  
  void removeCoin(){
    coins.remove(coins.size()-1);
  }
}
