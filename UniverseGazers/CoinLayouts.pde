public static class CoinLayouts {
  static final int[][] regular = new int[][]{
    {0, 1, 1, 1, 1, 1, 1, 0}, 
    {1, 1, 1, 1, 1, 1, 1, 1}, 
    {0, 1, 1, 1, 1, 1, 1, 0}
  };

  static final int[][] checkerboard1 = new int[][] {
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}
  };

  static final int[][] checkerboard2 = new int[][] {
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}, 
    {0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1}, 
    {1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0}
  };

  static final int[][] heart = new int[][]{
    {0, 1, 1, 0, 1, 1, 0}, 
    {1, 1, 1, 1, 1, 1, 1}, 
    {1, 1, 1, 1, 1, 1, 1}, 
    {0, 1, 1, 1, 1, 1, 0}, 
    {0, 0, 1, 1, 1, 0, 0}, 
    {0, 0, 0, 1, 0, 0, 0}
  };

  static int[][] getArrangement() {
    int chance = (int)(Math.random()*8)+1;
    if (chance >= 1 && chance <= 5) {
      return regular;
    } else if (chance == 6) {
      return checkerboard1;
    } else if (chance == 7) {
      return checkerboard2;
    } else { // heart
      return heart;
    }
  }
}
