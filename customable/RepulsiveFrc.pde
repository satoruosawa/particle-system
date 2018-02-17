class RepulsiveFrc extends MutualFrc {
  protected Particle particleA;
  protected Particle particleB;
  protected float strength;
  protected float dist;

  public RepulsiveFrc(Particle particleA, Particle particleB, float strength,
      float dist) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.strength = strength;
    this.dist = dist;
  }

  public void update() {
    PVector posBtoA = PVector.sub(particleA.pos(), particleB.pos());
    float length = posBtoA.mag();
    if (length < dist) {
      float pct = 1 - (length / dist);
      posBtoA.normalize();
      PVector frcToAdd = posBtoA.mult(pct * strength);
      particleA.addFrc(frcToAdd);
      particleB.addFrc(frcToAdd.mult(-1.0));
    }
  }
}
