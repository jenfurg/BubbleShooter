public class Bubble {
  color col;
  Bubble[] adjacents = new Bubble[4];
  float xcor, ycor;
  
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
      }
      
      if (b.ycor == ycor + 20 && b.xcor == xcor && b.col == col) {
        adjacents[1] = b;
      }
      
      if (b.xcor == xcor - 20 && b.ycor == ycor && b.col == col) {
        adjacents[2] = b;
      }
      
      if (b.xcor == xcor + 20 && b.ycor == ycor && b.col == col) {
        adjacents[3] = b;
      }
    
    }
    // loop through adjacent bubbles and add them to the array if they are the same color
  }
  
  public void evaluateCollision() {
  
  }
  
  public void explode() {
  
  }
  
  public void display() {
    fill(col);
    ellipse(xcor, ycor, 20, 20);
  }
}
