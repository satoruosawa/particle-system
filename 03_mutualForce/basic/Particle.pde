class Particle {
  private ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;
  private PVector velocity;
  private PVector force;
  private float lifespan;
  private float size;

  public Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(random(-1, 1), random(-1, 1));
    this.position = position.copy();
    lifespan = 255.0;
    size = 10;
  }

  public void resetForce() {
    force.set(0.0, 0.0);
  }

  public void update() {
    for (Field f : fields) {
      force.add(f.getForce(this));
    }
    velocity.add(force);
    position.add(velocity);
    lifespan -= 1.0;
  }

  public void draw() {
    noStroke();
    fill(0, lifespan);
    ellipse(position.x, position.y, size, size);
  }

  public void addField(Field f) {
    fields.add(f);
  }

  public boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }

  public float lifespan() {
    return lifespan;
  }
}
