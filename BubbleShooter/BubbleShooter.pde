Game theGame;
float a,b; // coordinates of base of shooter
int pauseX, pauseY; 
int resetX, resetY; 
int helpX, helpY; 
int modeX, modeY; // coordinates for the buttons 
PImage img;

void setup() {
  // place a bunch of bubbles
  size(1000, 850);
  img = loadImage("Tutorial.png");
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
   //help button
   fill(0,200,200);
   ellipse(875,300,60,60); 
   fill(255,255,255);
   //textFont(mono);
   text("HELP",860,305);
 
   
   text("Points: " + theGame.score, 810, 200); 
  
   
  
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
      int pts = fired.evaluateCollision(theGame.bubbles);
      if (pts == 0) theGame.newRow++;
      theGame.score += 10*pts;
      if (theGame.newRow == 4) { // 4 is subject to change
      theGame.newBubbleRow();
      theGame.newRow = 0;
    };
      theGame.awaitingAction = true;
    }
    // trace path of bubble as it moves
  }
  if (theGame.gameOver()) {
    // end game
  }
  
  // at STARTING_X + 100, ENDING_Y + 100 put nextColors[0]
  Bubble nextNext = new Bubble(theGame.STARTING_X+100, theGame.ENDING_Y+50, theGame.nextColors[0]);
  Bubble next = new Bubble(theGame.STARTING_X+200, theGame.ENDING_Y+50, theGame.nextColors[1]);
  // at STARTING_X + 200, ENDING_Y + 100 put nextColors[1]
  nextNext.display();
  next.display();
  if (theGame.showTut)
  image(img,500,375,width/2-50,height/2);
  
}



void mouseClicked() {
  if (dist(mouseX,mouseY,825,250)<=30)
  setup(); 
  if (dist(mouseX,mouseY,875,300)<=30)
  theGame.showTut = true; 
  if (theGame.showTut & mouseY >360 & mouseY < 420)
  theGame.showTut = false;
  
  
  if (mouseX < theGame.STARTING_X || mouseX > theGame.ENDING_X || mouseY < theGame.STARTING_Y || mouseY > theGame.ENDING_Y) return;

  if (!theGame.awaitingAction) return;
  else if (mouseY < b & mouseY < theGame.ENDING_Y & mouseX < theGame.ENDING_X) {
     theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, mouseY);
  } else {
    theGame.shooter.shoot(new Bubble(a, b, theGame.cycleColors()), mouseX, b);
  }
  theGame.awaitingAction = false;
}
