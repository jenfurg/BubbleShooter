Game theGame = new Game();
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

void setup() {
  // place a bunch of bubbles
  size(500,displayHeight);
}

void draw() {
   background(157,200,255);
   PVector shooter = new PVector(mouseX,mouseY);
   PVector base = new PVector(width/2,height/2);
   shooter.sub(base);
   shooter.normalize();
   shooter.mult(50);
   translate(width/2,height-200);
   stroke(255);
   strokeWeight(4);   
   line(0,0,shooter.x,shooter.y);
  if (theGame.awaitingAction) {
    // have shooter follow mouse
  } else {
    // trace path of bubble as it moves
  }

}
