public class Shooter {
  float xSpeed,ySpeed;
  float v = 0.005;
  float dt = 0.01;
  public Shooter() {
  
  }
  
  public void shoot(Bubble bub, float xDest, float yDest) {
    ellipse(mouseX + xSpeed, mouseY + ySpeed, width/2, height-200);
    xSpeed += v*dt + (mouseX/8);
    ySpeed += v*dt + (mouseY/8); 
  }
  

}
