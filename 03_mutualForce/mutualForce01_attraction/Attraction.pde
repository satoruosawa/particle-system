class Attraction extends MutualForce {
  private float strength = 1;
  private float sleshhold = 1;

  public Attraction(Particle particleA, Particle particleB) {
    super(particleA, particleB);
  }

  public void willUpdateParticles() {
    PVector positionAfromB = PVector.sub(
      particleA.position(),
      particleB.position()
    );
    float distance = positionAfromB.mag();
    if (distance < sleshhold) {
      float coef = 1 - (distance / sleshhold);
      positionAfromB.normalize();
      PVector forceToAdd = positionAfromB.mult(-coef * strength);
      particleA.addForce(forceToAdd);
      particleB.addForce(forceToAdd.mult(-1.0));
    }
  }

  public void didUpdateParticles() {
  }

  public void draw() {
    noFill();
    stroke(0,  255 - abs(256 - particleA.life()));
    PVector pA = particleA.position();
    PVector pB = particleB.position();
    line(pA.x, pA.y, pB.x, pB.y);
  }

  public void strength(float s) { strength = s; }
  public void sleshhold(float s) { sleshhold = s; }
}
