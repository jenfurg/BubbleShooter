Game theGame = new Game();
ArrayList<Bubble> bubbles = new ArrayList<Bubble>();

void setup() {
  // place a bunch of bubbles
  size(500,displayHeight);
}

void draw() {
   background(157,200,255);
   strokeWeight(4);   
   
   float bigR = dist(mouseX, mouseY, width/2, height-200);
   float littleR = 100.0; //adjust this to adjust the shooter length
   
   float ratio = bigR/littleR;
   
   float a = width/2;
   float b = height-200;
   
   float mX = mouseX;
   float mY = mouseY;
   
   if (mY > height - 200) {
     mY = height - 200;
   }
   
   float h = a + (mX - a)*(littleR/bigR);
   float k = b + (mY - b)*(littleR/bigR);
   
   line(width/2, height-200, h,k);
  
  
  if (theGame.awaitingAction) {
    // have shooter follow mouse
  } else {
    // trace path of bubble as it moves
  }

}
