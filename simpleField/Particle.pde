class Particle {
  private ArrayList<VectorField> fields = new ArrayList<VectorField>();
  private PVector position;
  private PVector velocity;
  private PVector force;
  private float lifespan;
  private float size;

  public Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position.copy();
    lifespan = 511.0;
    size = 10;
  }

  public void resetForce() {
    force.set(0.0, 0.0);
  }

  public void update() {
    for (VectorField f : fields) {
      force.add(f.getForce(position));
    }
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1.0;
  }

  public void draw() {
    noStroke();
    fill(0, 255 - abs(256 - lifespan));
    ellipse(position.x, position.y, size, size);
  }

  public void addField(VectorField f) {
    fields.add(f);
  }

  public boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  public PVector position() {
    return position;
  }
}
