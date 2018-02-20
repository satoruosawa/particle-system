class Particle {
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private PVector force = new PVector(0, 0);
  private float lifespan = 1;
  private float size = 1;

  public void resetForce() { force.set(0, 0); }
  public void addForce(PVector f) { force.add(f); }

  public void update() {
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1;
  }

  public void draw() {
    noStroke();
    fill(0, 255 - abs(256 - lifespan));
    ellipse(position.x, position.y, size, size);
  }

  public boolean isDead() {
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }

  public void position(PVector p) { position = p; }
  public void velocity(PVector v) { velocity = v; }
  public void lifespan(float l) { lifespan = l; }
  public void size(float s) { size = s; }

  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public float size() { return size; }
}
