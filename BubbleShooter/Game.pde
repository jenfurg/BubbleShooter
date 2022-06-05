public class Game {
  int score = 0;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  Shooter shooter = new Shooter();
  boolean awaitingAction = true;
  boolean hexShift = false;
  color[] nextColors = new color[3];
  int newRow = 0;
  ArrayList<Integer> colors = new ArrayList<Integer>();
  
  color red = color(255,0,0);
  color pink = color(247, 15, 181);
  color dBlue = color(0,0,255);
  color lBlue = color(0,255,255);
  color yellow = color(255, 255, 0);
  color green = color(0,255,0);
  
  final static float STARTING_X = Bubble.BRADIUS/2; // also to be changed later
  final float ENDING_X = STARTING_X + 700; // to be changed
  final static float STARTING_Y = Bubble.BRADIUS;
  final float ENDING_Y = height - 100;
  
  public Game() {
    colors.add(red);
    colors.add(pink);
    colors.add(dBlue);
    colors.add(yellow);
    colors.add(green);
    colors.add(green);
    
    for (int i = 0; i < 3; i++) {
      nextColors[i] = makeRandomColor();
    }
    // put 3 random colors in nextColors
  }
  
  public color makeRandomColor() {
    int k = (int) random(0,6);
    
    
    return colors.get(k);
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
    
    float p = 0.0;
    if (hexShift) p = Bubble.BRADIUS/2;
    
    for (float i = p+STARTING_X+Bubble.BRADIUS/2; i < ENDING_X; i += Bubble.BRADIUS) {
      bubbles.add(new Bubble(i, STARTING_Y+Bubble.BRADIUS, nextColors[2])); // to be changed later
      cycleColors();

    }
    hexShift = !hexShift;
  }
  
  public boolean gameOver() {
    for (int i = 0; i < bubbles.size(); i++) {
      if (bubbles.get(i).ycor >= ENDING_Y) {
        return true;
      }
    }
    return false;
  }
  
  public boolean checkCollision(Bubble shot) {
    if (shot.xcor < STARTING_X + Bubble.BRADIUS || shot.xcor > ENDING_X - Bubble.BRADIUS) return true;
    if (shot.ycor < STARTING_Y + Bubble.BRADIUS || shot.ycor > ENDING_Y - Bubble.BRADIUS) return true;
    for (int i = 0; i < bubbles.size(); i++) {
      if (dist(shot.xcor, shot.ycor, bubbles.get(i).xcor, bubbles.get(i).ycor) < Bubble.BRADIUS) {
        return true;
      }
    }
    return false;
  }
}
