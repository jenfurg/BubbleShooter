public class Game {
  int score = 0;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  Shooter shooter = new Shooter();
  boolean awaitingAction = true;
  color[] nextColors = new color[3];
  
  public Game() {
    for (int i = 0; i < 3; i++) {
      nextColors[i] = makeRandomColor();
    }
    // put 3 random colors in nextColors
  }
  
  public color makeRandomColor() {
    int k = (int) random(0,5);
    
    color c;
    
    switch (k) {
      default: c = color(0);
      case 0: 
        c = color(255, 0, 0);
        break;
      case 1: 
        c = color(213, 101, 234);
        break;
      case 2: 
        c = color(0, 0, 255);
        break;
      case 3: 
        c = color(28, 49, 171);
        break;
      case 4: 
        c = color(255, 255, 0);
        break;
      case 5: 
        c = color(0,255,0);
        break;
    }
    
    // red, pink, light blue, dark blue, yellow, green
    return c;
  }
  
  public void newBubbleRow() {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = bubbles.get(i);
      b.ycor += 20; // number is subject to change
    }
    
    for (int i = 0; i < width; i += 20) {
      bubbles.add(new Bubble(i, 0, nextColors[2]));
      nextColors[2] = nextColors[1];
      nextColors[1] = nextColors[0];
      nextColors[0] = makeRandomColor();
    }
  }
  
  public boolean gameOver() {
    for (int i = 0; i < bubbles.size(); i++) {
      if (bubbles.get(i).ycor > 1000) { // 1000 is subject to change
        return true;
      }
    }
    return false;
  }
}
