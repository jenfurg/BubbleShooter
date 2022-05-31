public class Game {
  int score = 0;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  Shooter shooter = new Shooter();
  boolean awaitingAction = true;
  color[] nextColors = new color[3];
  
  final static float STARTING_X = Bubble.BRADIUS/2; // also to be changed later
  final float ENDING_X = STARTING_X + 700; // to be changed
  final static float STARTING_Y = Bubble.BRADIUS;
  final float ENDING_Y = height - 100;
  
  public Game() {
    for (int i = 0; i < 3; i++) {
      nextColors[i] = makeRandomColor();
    }
    // put 3 random colors in nextColors
  }
  
  public color makeRandomColor() {
    int k = (int) random(0,6);
    
    color c;
    
    switch (k) {
      default: c = color(0);
      case 0: 
        c = color(255, 0, 0); // red
        break;
      case 1: 
        c = color(247, 15, 181); //pink
        break;
      case 2: 
        c = color(0, 0, 255); // dark blue
        break;
      case 3: 
        c = color(0, 255, 255);  // light blue
        break;
      case 4: 
        c = color(255, 255, 0); // yellow
        break;
      case 5: 
        c = color(0,255,0); // green
        break;
    }
    
    // red, pink, light blue, dark blue, yellow, green
    return c;
  }
  
  public color cycleColors() {
    color c = nextColors[2];
     nextColors[2] = nextColors[1];
     nextColors[1] = nextColors[0];
     nextColors[0] = makeRandomColor();
     return c;
  }
  
  public void newBubbleRow() {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = bubbles.get(i);
      b.ycor += Bubble.BRADIUS; // number is subject to change
    }
    
    for (float i = STARTING_X+Bubble.BRADIUS/2; i < ENDING_X; i += Bubble.BRADIUS) {
      bubbles.add(new Bubble(i, STARTING_Y+Bubble.BRADIUS, nextColors[2])); // to be changed later
      cycleColors();
    }
  }
  
  public boolean gameOver() {
    for (int i = 0; i < bubbles.size(); i++) {
      if (bubbles.get(i).ycor > ENDING_Y) {
        return true;
      }
    }
    return false;
  }
  
  public boolean checkCollision(Bubble shot) {
    if (shot.xcor < Bubble.BRADIUS || shot.xcor > width - Bubble.BRADIUS) return true;
    if (shot.ycor < 0 || shot.ycor > height - Bubble.BRADIUS) return true;
    for (int i = 0; i < bubbles.size(); i++) {
      if (dist(shot.xcor, shot.ycor, bubbles.get(i).xcor, bubbles.get(i).ycor) < Bubble.BRADIUS) {
        return true;
      }
    }
    return false;
  }
}
