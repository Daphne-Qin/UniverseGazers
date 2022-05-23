public class Coin{
  
  ArrayList<Double[]> coins;
  
  public Coin(){
    coins = new ArrayList<Double[]>();
  }
  
  void display(){
    
    //  we need to make the coins appear in clusters, so we'll need to find a way
    // for rand to only generate values close to each other, so for now i'll be using
    // 0 as a filler value;
    int rand1 = 0;
    int rand2 = 0;
    ellipse(rand1, rand2, 3, 3);
  }
  
  void addCoin(double x, double y){
    coins.add(new Double[]{x, y});
  }
  
  void removeCoin(){
    coins.remove(coins.size()-1);
  }
}
