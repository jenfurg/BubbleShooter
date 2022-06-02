public class Bubble {
  color col;
  Bubble[] adjacents = new Bubble[4];
  float xcor, ycor;
  final static float BRADIUS = 30;
  boolean marked = false;
  
  public Bubble(float x, float y, color colla) {
    xcor = x;
    ycor = y;
    col = colla;
  }
  
  public void evaluateAdjacents(ArrayList<Bubble> bubbles) {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = bubbles.get(i);
      
      
      
      if (b.ycor == ycor - BRADIUS && b.xcor == xcor) {
        if (b.col == col) {
          adjacents[0] = b;
        } else {
           adjacents[0] = null;
        }
        
      }
        
        if (b.ycor == ycor + BRADIUS && b.xcor == xcor) {
        if (b.col == col) {
          adjacents[1] = b;
        } else {
           adjacents[1] = null;
        }
        
        }
        
        if (b.xcor == xcor - BRADIUS && b.ycor == ycor) {
        if (b.col == col) {
          adjacents[2] = b;
        } else {
           adjacents[2] = null;
        }
        
        }
        
        if (b.xcor == xcor + BRADIUS && b.ycor == ycor) {
        if (b.col == col) {
          adjacents[3] = b;
        } else {
           adjacents[3] = null;
        }
        
        }
        
    
    }
    // loop through adjacent bubbles and add them to the array if they are the same color
  }
  
  public void evaluateCollision(ArrayList<Bubble> allBubbles) {
    ArrayList popList = new ArrayList<Bubble>();
    colHelp(col, popList);
    if (popList.size() < 3) return;
    for (int i = 0; i < allBubbles.size(); i++) {
      if (popList.contains(allBubbles.get(i))) {
        allBubbles.get(i).explode();
        allBubbles.remove(i);
        i--;
      }
    }
    
  }
  
  public void colHelp(color seek, ArrayList<Bubble> popList) {
    if (marked) return;
    if (this.col != seek) return;
    popList.add(this);
    marked = true;
    for (int i = 0; i < adjacents.length; i++) {
      if (adjacents[i] != null) {
        adjacents[i].colHelp(seek, popList);
      }
    }
  }
 
  
  public void snapToGrid() {
    float xR = (xcor)/BRADIUS;
    float yR = ycor/BRADIUS;
    
    int roundedX = round(xR);
    int roundedY = round(yR);
    
    xcor = BRADIUS * roundedX;
    ycor = BRADIUS * roundedY;
    
    // to be written
  }
  
  public void explode() {
  
  }
  
  public void display() {
    fill(col);
    strokeWeight(1);
    ellipse(xcor, ycor, BRADIUS, BRADIUS);
    fill(255);
    strokeWeight(0);
    ellipse(xcor-(BRADIUS/4), ycor-(BRADIUS/4), (BRADIUS/5), (BRADIUS/5));
  }
}
