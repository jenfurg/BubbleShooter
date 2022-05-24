Game theGame = new Game();

void setup() {
  // place a bunch of bubbles
  
  PImage background = loadImage("background.png");
  image(background,0,displayHeight);
  fill(0);
}

void draw() {
   Pvector shooter = new PVector(mouseX,mouseY);
   Pvector base = new Pvector(width/2,10);
   mouse.sub(base);
   mouse.normalize();
   mouse.mult(50);
   translate(width/2,height/2);
   stroke(255);
   strokeWeight(4);
   line(0,0,mouse.x,mouse.y);
 
  if (theGame.awaitingAction) {
    // have shooter follow mouse
  } else {
    // trace path of bubble as it moves
  }

}
