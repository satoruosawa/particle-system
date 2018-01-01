class Particle {
  ArrayList<VectorField> fields = new ArrayList<VectorField>();
  private PVector position;
  PVector velocity;
  PVector force;
  float lifespan;

  Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    lifespan = 511.0;
  }

  void resetForce() {
    force.set(0.0, 0.0);
  }

  void addForce(PVector force) {
    this.force.add(force);
  }

  void update() {
    for (VectorField f : fields) {
      force.add(f.getForce(position));
    }
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1.0;
  }

  void draw() {
    noStroke();
    fill(0, 255 - abs(256 - lifespan));
    ellipse(position.x, position.y, 10, 10);
  }

  void addField(VectorField f) {
    fields.add(f);
  }

  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  PVector position() {
    return position;
  }
}
