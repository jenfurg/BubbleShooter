public class Bubble {
  color col;
  Bubble[] adjacents = new Bubble[4];
  float xcor, ycor;
  boolean exists = true;
  
  public Bubble(float x, float y, color colla) {
    xcor = x;
    ycor = y;
    col = colla;
  }
  
  public void evaluateAdjacents(ArrayList<Bubble> bubbles) {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = bubbles.get(i);
      
      if (b.ycor == ycor - 20 && b.xcor == xcor && b.col == col) {
        adjacents[0] = b;
      } else {
        adjacents[0] = null;
      }
      
      if (b.ycor == ycor + 20 && b.xcor == xcor && b.col == col) {
        adjacents[1] = b;
      } else {
        adjacents[1] = null;
      }
      
      if (b.xcor == xcor - 20 && b.ycor == ycor && b.col == col) {
        adjacents[2] = b;
      } else {
        adjacents[2] = null;
      }
      
      if (b.xcor == xcor + 20 && b.ycor == ycor && b.col == col) {
        adjacents[3] = b;
      } else {
        adjacents[3] = null;
      }
    
    }
    // loop through adjacent bubbles and add them to the array if they are the same color
  }
  
  public void evaluateCollision() {
    ArrayList<Bubble> bubblesToPop = new ArrayList<Bubble>();
    collisionHelper(bubblesToPop);
    for (int i = 0; i < bubblesToPop.size(); i++) {
      bubblesToPop.get(i).exists = false;
    }
    
    
  }
  
  public void collisionHelper(ArrayList<Bubble> arr) {
    for (int i = 0; i < adjacents.length; i++) {
      if (adjacents[i] != null) {
        arr.add(adjacents[i]);
        adjacents[i].collisionHelper(arr);
      }
    }
  }
  
  public void explode() {
  
  }
  
  public void display() {
    fill(col);
    ellipse(xcor, ycor, 20, 20);
  }
}
