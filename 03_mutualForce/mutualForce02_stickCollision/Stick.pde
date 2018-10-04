class Stick extends MutualForce {
  private float stickLength = 1;

  public Stick(Particle particleA, Particle particleB) {
    super(particleA, particleB);
  }

  public void willUpdateParticles() {
  }

  public void didUpdateParticles() {
    PVector positionAfromB = PVector.sub(
      particleB.position(),
      particleA.position()
    );
    float diff = positionAfromB.mag() - stickLength;
    positionAfromB.normalize();
    PVector positionAToAdd;
    PVector positionBToAdd;
    if (particleA.flagCollide()) {
      positionAToAdd = new PVector(0, 0);
      positionBToAdd = positionAfromB.mult(-diff);
    } else if (particleB.flagCollide()) {
      positionAToAdd = positionAfromB.mult(diff);
      positionBToAdd = new PVector(0, 0);
    } else {
      positionAToAdd = PVector.mult(positionAfromB, diff * 0.5);
      positionBToAdd = PVector.mult(positionAfromB, -diff * 0.5);
    }
    particleA.position().add(positionAToAdd);
    particleA.velocity().add(positionAToAdd);
    particleB.position().add(positionBToAdd);
    particleB.velocity().add(positionBToAdd);
  }

  public void draw() {
    noFill();
    stroke(0);
    PVector pA = particleA.position();
    PVector pB = particleB.position();
    line(pA.x, pA.y, pB.x, pB.y);
  }

  public void stickLength(float s) { stickLength = s; }
}
