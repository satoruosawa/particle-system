class Spring extends MutualFrc {
  protected Particle particleA;
  protected Particle particleB;
  protected float springiness;
  protected float dist;

  public Spring(Particle particleA, Particle particleB, float springiness,
      float dist) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.springiness = springiness;
    this.dist = dist;
  }

  public void update() {
    PVector posBtoA = PVector.sub(particleA.pos(), particleB.pos());
    float springFrc = (springiness * (dist - posBtoA.mag()));
    posBtoA.normalize();
    PVector frcToAdd = posBtoA.mult(springFrc);
    particleA.addFrc(frcToAdd);
    particleB.addFrc(frcToAdd.mult(-1.0));
  }
}
