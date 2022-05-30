Game theGame = new Game();
float a,b; // coordinates of base of shooter

void setup() {
  // place a bunch of bubbles
  size(500,displayHeight);
  
  a = width/2;
  b = height-200;
  
  for (int i = 0; i < 10; i++) {
    theGame.newBubbleRow();
  }
}

void draw() {
  
  
   background(157,200,255);
   
   for (int i = 0; i < theGame.bubbles.size(); i++) {
      theGame.bubbles.get(i).display();
    }
   
   strokeWeight(4);   
   
   float bigR = dist(mouseX, mouseY, width/2, height-200);
   float littleR = 100.0; //adjust this to adjust the shooter length
   
   

   
   float mY = mouseY;
   
   if (mY > height - 200) {
     mY = height - 200;
   }
   
   float h = a + (mouseX - a)*(littleR/bigR);
   float k = b + (mY - b)*(littleR/bigR);
   
   line(a, b, h,k);
  
  
  if (theGame.awaitingAction) {
    Bubble base = new Bubble(a, b, theGame.nextColors[2]);
    base.display();
    // have shooter follow mouse
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
  theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, mouseY);
  theGame.awaitingAction = false;
}
