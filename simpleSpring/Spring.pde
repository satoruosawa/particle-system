class Spring {
  private Particle particleA;
  private Particle particleB;
  private float springLength;
  private float springiness;
  private boolean isDead;

  public Spring(Particle particleA, Particle particleB, float springLength,
      float springiness) {
    this.particleA = particleA;
    this.particleB = particleB;
    this.springLength = springLength;
    this.springiness = springiness;
    isDead = false;
  }

  public void update() {
    if ((particleA == null) || (particleB == null)) {
      isDead = true;
      return;
    }
    PVector posBtoA = PVector.sub(particleA.position(), particleB.position());
    float dist = posBtoA.mag();
    float springForce = (springiness * (springLength - dist));
    posBtoA.normalize();
    particleA.addForce(posBtoA.mult(springForce));
    particleB.addForce(posBtoA.mult(-1.0));
  }

  public void draw() {
    noFill();
    stroke(0,  255 - abs(256 - particleA.lifespan));
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }

  public boolean isDead() {
    return isDead;
  }
}
