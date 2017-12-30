class Particle {
  PVector position;
  PVector velocity;
  PVector force;
  float lifespan;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    this.position = position.copy();
    lifespan = 255.0;
  }

  void resetForce() {
    force.set(0.0, 0.0);
  }

  void update() {
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void draw() {
    noStroke();
    fill(0, lifespan);
    ellipse(position.x, position.y, 10, 10);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
