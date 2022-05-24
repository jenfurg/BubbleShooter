public class Bubble {
  color col;
  Bubble[] adjacents = new Bubble[6];
  float xcor, ycor;
  
  public Bubble(float x, float y, color colla) {
    xcor = x;
    ycor = y;
    col = colla;
  }
  
  public void evaluateAdjacents() {
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
