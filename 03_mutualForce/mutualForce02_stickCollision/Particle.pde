class Particle {
  private ArrayList<Field> fields = new ArrayList<Field>();
  private PVector position = new PVector(0, 0);
  private PVector velocity = new PVector(0, 0);
  private PVector force = new PVector(0, 0);
  private float size = 1;
  private boolean flagCollide = false;

  public void resetForce() { force.set(0, 0); }
  public void addForce(PVector f) { force.add(f); }

  public void update() {
    flagCollide = false;
    for (Field f : fields) {
      f.willUpdateParticle(this);
    }
    updatePosition();
    for (Field f : fields) {
      f.didUpdateParticle(this);
    }
  }

  protected void updatePosition() {
    velocity.add(force);
    position.add(velocity);
  }

  public void draw() {
    noStroke();
    fill(0);
    ellipse(position.x, position.y, size, size);
  }

  public void collide() { flagCollide = true; }
  public void addField(Field f) { fields.add(f); }

  public void position(PVector p) { position = p; }
  public void velocity(PVector v) { velocity = v; }
  public void size(float s) { size = s; }

  public boolean fragCollide() { return flagCollide; }
  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public float size() { return size; }
}
