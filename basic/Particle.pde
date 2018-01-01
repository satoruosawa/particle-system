class Particle {
  private PVector position;
  private PVector velocity;
  private PVector force;
  private float lifespan;

  public Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    this.position = position.copy();
    lifespan = 255.0;
  }

  public void resetForce() {
    force.set(0.0, 0.0);
  }

  public void update() {
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1.0;
  }

  public void draw() {
    noStroke();
    fill(0, lifespan);
    ellipse(position.x, position.y, 10, 10);
  }

  public boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
