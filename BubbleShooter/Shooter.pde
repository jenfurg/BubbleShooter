public class Shooter {
  float xSpeed,ySpeed;
  public Shooter() {
  
  }
  
  public void shoot(Bubble bub, float xDest, float yDest) {
    System.out.println("Shooting a " + bub.col + " bubble to " + xDest + ", " + yDest);
  }
  

}
