class Particle {
  protected ArrayList<Field> fields = new ArrayList<Field>();
  protected PVector position = new PVector(0, 0);
  protected PVector velocity = new PVector(0, 0);
  protected PVector force = new PVector(0, 0);
  protected color particleColor = color(0);
  protected float size = 1;

  public void resetForce() { force.set(0, 0); }
  public void addForce(PVector f) { force.add(f); }
  public void addVelocity(PVector v) { velocity.add(v); }
  public void shiftPosition(PVector p) { position.add(p); }

  public void update() {
    for (Field f : fields) {
      f.willParticleUpdate(this);
    }
    updatePosition();
    for (Field f : fields) {
      f.didParticleUpdate(this);
    }
  }

  protected void updatePosition() {
    velocity.add(force);
    position.add(velocity);
  }

  public void draw() {
    noStroke();
    fill(0, 255);
    PVector pos = dispPos(position);
    ellipse(pos.x, pos.y, size * SCALE, size * SCALE);
  }

  public void position(PVector p) { position = p; }
  public void velocity(PVector v) { velocity = v; }
  public void addField(Field f) { fields.add(f); }

  public void particleColor(color c) { particleColor = c; }
  public void size(float s) { size = s; }

  public PVector position() { return position; }
  public PVector velocity() { return velocity; }
  public color particleColor() { return particleColor; }
  public float size() { return size; }
}
