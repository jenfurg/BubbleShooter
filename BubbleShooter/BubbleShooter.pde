Game theGame;
float a,b; // coordinates of base of shooter

void setup() {
  // place a bunch of bubbles
  size(1000, 850);
  
  theGame = new Game();
  
  a = (theGame.STARTING_X + theGame.ENDING_X)/2 + 20;
  b = theGame.ENDING_Y - 200;
  
  for (int i = 0; i < 10; i++) {
    theGame.newBubbleRow();
  }
}

void draw() {
  
   background(0);
   
   fill(157,200,255);
   rect(theGame.STARTING_X, theGame.STARTING_Y, theGame.ENDING_X, theGame.ENDING_Y);
  
   //background(157,200,255);
   
   for (int i = 0; i < theGame.bubbles.size(); i++) {
      theGame.bubbles.get(i).display();
      theGame.bubbles.get(i).evaluateAdjacents(theGame.bubbles);
      theGame.bubbles.get(i).marked = false;
    }
   
   strokeWeight(4);   
   
   float bigR = dist(mouseX, mouseY, a, b);
   float littleR = 100.0; //adjust this to adjust the shooter length
   
   

   
   float mY = mouseY;
   
   if (mY > b) {
     mY = b;
   }
   
   float h = a + (mouseX - a)*(littleR/bigR);
   float k = b + (mY - b)*(littleR/bigR);
   
   line(a, b, h,k);
  
  
  if (theGame.awaitingAction) {
    Bubble base = new Bubble(a, b, theGame.nextColors[2]);
    base.display();
  } else {
    Bubble fired = theGame.shooter.shot;
    fired.display();
    if (!theGame.checkCollision(fired)) { 
      fired.xcor += theGame.shooter.xSpeed;
      fired.ycor += theGame.shooter.ySpeed;
    } else {
      fired.snapToGrid();
      theGame.bubbles.add(fired);
      fired.evaluateAdjacents(theGame.bubbles);
      fired.evaluateCollision(theGame.bubbles);
      theGame.awaitingAction = true;
    }
    // trace path of bubble as it moves
  }

}


void mouseClicked() {
  if (!theGame.awaitingAction) return;
  if (mouseY < b) {
     theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, mouseY);
  } else {
    theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, b);
  }
  theGame.awaitingAction = false;
}
