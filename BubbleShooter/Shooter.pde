public class Shooter {
  float xSpeed = 1.0;
  float ySpeed = 1.0;
  Bubble shot;
  float aimX, aimY;
  
  public Shooter() {
  
  }
  
  public void shoot(Bubble bub, float xDest, float yDest) {
    shot = bub;
    aimX = xDest;
    aimY = yDest;
    System.out.println("Shooting a " + bub.col + " bubble to " + xDest + ", " + yDest);
  }
  

}
