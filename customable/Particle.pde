class Particle {
  protected PVector pos;
  protected PVector vel;
  protected PVector frc;
  protected ArrayList<Field> fields = new ArrayList<Field>();
  protected color pColor;
  protected float size;

  public Particle() {
    pos = new PVector(0, 0);
    vel = new PVector(0, 0);
    frc = new PVector(0, 0);
    pColor = color(0);
    size = 1;
  }

  public void resetFrc() {
    frc.set(0, 0);
  }

  public void addPos(PVector p) {
    pos.add(p);
  }

  public void addVel(PVector v) {
    vel.add(v);
  }

  public void addFrc(PVector f) {
    frc.add(f);
  }

  public void update() {
    if (fields.size() != 0) {
      for (Field f : fields) {
        f.preParticleUpdate(this);
      }
    }
    updatePos();
    if (fields.size() != 0) {
      for (Field f : fields) {
        f.postParticleUpdate(this);
      }
    }
  }

  protected void updatePos() {
    vel.add(frc);
    pos.add(vel);
  }

  // setter
  public void setPos(PVector pos) { this.pos = pos; }
  public void setVel(PVector vel) { this.vel = vel; }
  public void setField(Field field) {
    fields.add(field);
  }
  public void setColor(color pColor) { this.pColor = pColor; }
  public void setSize(float size) { this.size = size; }

  // getter
  public PVector pos() { return pos; }
  public PVector vel() { return vel; }
  public color pColor() { return pColor; }
  public float size() { return size; }
}
