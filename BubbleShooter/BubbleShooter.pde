Game theGame = new Game();
float a,b;

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
   
   line(width/2, height-200, h,k);
  
  
  if (theGame.awaitingAction) {
    // have shooter follow mouse
  } else {
    Bubble fired = theGame.shooter.shot;
    fired.display();
    if (dist(theGame.shooter.aimX, theGame.shooter.aimY, fired.xcor, fired.ycor) > 5) {
      int mod = 1;
      if (theGame.shooter.aimX < fired.xcor) {
        mod = -1;
      }
      fired.xcor += theGame.shooter.xSpeed * mod;
      fired.ycor -= theGame.shooter.ySpeed;
    } else {
      theGame.bubbles.add(fired);
    }
    // trace path of bubble as it moves
  }

}


void mouseClicked() {
  theGame.shooter.shoot(new Bubble(a-(Bubble.BRADIUS/2), b-(Bubble.BRADIUS/2), theGame.cycleColors()), mouseX, mouseY);
  theGame.awaitingAction = false;
}
