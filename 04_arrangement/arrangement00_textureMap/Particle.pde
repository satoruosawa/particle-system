class Particle {
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private PVector force = new PVector(0, 0);
  private float size = 1;
  color particleColor = -1;

  public void update() {
    velocity.add(force);
    position.add(velocity);
  }

  public void draw() {
    noStroke();
    fill(particleColor);
    rect(position.x, position.y, size, size);
  }

  public void resetForce() { force.set(0, 0); }

  public void position(PVector p) { position = p; }
  public void velocity(PVector v) { velocity = v; }
  public void size(float s) { size = s; }
  public void particleColor(color c) { particleColor = c; }
}
