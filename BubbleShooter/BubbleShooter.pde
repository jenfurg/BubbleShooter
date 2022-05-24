Game theGame = new Game();

void setup() {
  // place a bunch of bubbles
  
  PImage background = loadImage("background.png");
  image(background,0,displayHeight);
  fill(0);
  PImage arrow = loadImage("arrow.png");
  
}

void draw() {
  
  if (theGame.awaitingAction) {
    // have shooter follow mouse
  } else {
    // trace path of bubble as it moves
  }

}
