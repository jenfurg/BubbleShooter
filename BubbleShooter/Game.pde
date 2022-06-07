import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
public class Game {
  int score = 0;
  ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
  Shooter shooter = new Shooter();
  boolean awaitingAction = true;
  boolean hexShift = false;
  color[] nextColors = new color[3];
  int newRow = 0;
  boolean showTut; 
  ArrayList<Integer> colors = new ArrayList<Integer>();
  boolean storedMostRecentScore;
  
  color red = color(255,0,0);
  color pink = color(247, 15, 181);
  color dBlue = color(0,0,255);
  color lBlue = color(0,255,255);
  color yellow = color(255, 255, 0);
  color green = color(0,255,0);
  color[] allColors = {red, pink, dBlue, lBlue, yellow, green};
  
  final static float STARTING_X = Bubble.BRADIUS/2; // also to be changed later
  final float ENDING_X = STARTING_X + 700; // to be changed
  final static float STARTING_Y = Bubble.BRADIUS;
  final float ENDING_Y = height - 100;
  

  public Game() {
    colors.add(red);
    colors.add(pink);
    colors.add(dBlue);
    colors.add(yellow);
    colors.add(lBlue);
    colors.add(green);
    
    for (int i = 0; i < 3; i++) {
      nextColors[i] = makeRandomColor(true);
    }
    
    storedMostRecentScore = false;
    // put 3 random colors in nextColors
  }
  
  public color makeRandomColor(boolean initial) {
    
    if (initial) return allColors[(int)random(0,6)];
     
    colors = new ArrayList<Integer>();
     for (int i = 0; i < bubbles.size(); i++) {
       Bubble b = bubbles.get(i);
       if (colors.size() == 0 || !colors.contains(b.col)) {
         colors.add(b.col);
       }
       if (colors.size() == 6) {i = bubbles.size();}
     }

    
    
    int k = (int) random(0,colors.size());
    
    
    return colors.get(k);
  }
  
  public color cycleColors(boolean initial) {
    color c = nextColors[2];
     nextColors[2] = nextColors[1];
     nextColors[1] = nextColors[0];
     nextColors[0] = makeRandomColor(initial);
     return c;
  }
  
  
   public void helpWindow(){
    
   }
   

  public void newBubbleRow(boolean initial) {
    for (int i = 0; i < bubbles.size(); i++) {
      Bubble b = bubbles.get(i);
      b.ycor += Bubble.BRADIUS; // number is subject to change
    }
    
    float p = 0.0;
    if (hexShift) p = Bubble.BRADIUS/2;
    
    for (float i = p+STARTING_X+Bubble.BRADIUS/2; i < ENDING_X; i += Bubble.BRADIUS) {
      bubbles.add(new Bubble(i, STARTING_Y+Bubble.BRADIUS, nextColors[2])); // to be changed later
      cycleColors(initial);

    }
    hexShift = !hexShift;
  }
  
  void start(){
    theGame = new Game();
  
  a = (theGame.STARTING_X + theGame.ENDING_X)/2 + 20;
  b = theGame.ENDING_Y - 200;
  
  for (int i = 0; i < 10; i++) {
    theGame.newBubbleRow(true);
  }
  
  }
  
  
  public boolean gameOver() {
    if (bubbles.size() == 0) return true;
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
  
  public void addHighScore() {
    try {
      File f = new File("./highscores.txt");
      
      FileWriter w = new FileWriter(f, true);
      w.write("\n"+score);
      w.close();
      storedMostRecentScore = true;
      
    } catch (IOException e) {
      System.out.println("couldn't do the file thing");
    }
  }
}
