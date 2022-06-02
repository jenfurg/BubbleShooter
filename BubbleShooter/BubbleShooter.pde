Game theGame;
float a,b; // coordinates of base of shooter
int pauseX, pauseY; 
int resetX, resetY; 
int helpX, helpY; 
int modeX, modeY; // coordinates for the buttons 
String messages = "Hello! Welcome to the BubbleShooter game. Here is a quick tutorial"; 
void setup() {
  // place a bunch of bubbles
  size(1000, 850);
  
  //ellipse(800,200,40,40); 
  theGame = new Game();
  
  a = (theGame.STARTING_X + theGame.ENDING_X)/2 + 20;
  b = theGame.ENDING_Y - 200;
  
  for (int i = 0; i < 10; i++) {
    theGame.newBubbleRow();
  }
}


void draw() {
  
   background(155,190,240);
   
   fill(157,200,255);
   rect(theGame.STARTING_X, theGame.STARTING_Y, theGame.ENDING_X, theGame.ENDING_Y);
    //reset button
   fill(0,200,0);
   ellipse(825,250,60,60); 
   fill(255,255,255);
   //textFont(mono);
   text("RESET",810,255);
   
   fill(0,200,200);
   ellipse(875,300,60,60); 
   fill(255,255,255);
   //textFont(mono);
   text("HELP",860,305);
   
  
   
  
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
  if (mouseX>765 && mouseX<885 && mouseY>190 && mouseY<310)
  setup(); 
 
  if (!theGame.awaitingAction & mouseY < theGame.ENDING_Y & mouseX < theGame.ENDING_X) return;
  else if (mouseY < b & mouseY < theGame.ENDING_Y & mouseX < theGame.ENDING_X) {
     theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, mouseY);
  } else {
    theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, b);
  }
  theGame.awaitingAction = false;
}
