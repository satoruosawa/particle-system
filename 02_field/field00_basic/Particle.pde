class Particle {
  private ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position;
  private PVector velocity;
  private PVector force;
  private float lifespan;
  private float size;

  public Particle(PVector position) {
    force = new PVector(0.0, 0.0);
    velocity = new PVector(0.0, 0.0);
    this.position = position;
    lifespan = 511.0;
    size = 10;
  }

  public void resetForce() {
    force.set(0., 0.);
  }

  public void update() {
    for (Field f : fields) {
      f.preParticleUpdate(this);
    }
    updatePos();
    for (Field f : fields) {
      f.postParticleUpdate(this);
    }
    lifespan -= 1.0;
  }

  protected void updatePos() {
    velocity.add(force);
    position.add(velocity);
  }

  public void draw() {
    noStroke();
    fill(0, 255 - abs(256 - lifespan));
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

  public void addForce(PVector f) { force.add(f); }

  public void setVelocity(PVector velocity) { this.velocity = velocity; }

  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public float size() { return size; }
}
