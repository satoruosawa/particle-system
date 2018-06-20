class Stick extends MutualForce {
  private float stickLength = 1;

  public Stick(Particle particleA, Particle particleB) {
    super(particleA, particleB);
  }

  public void willUpdateParticles() {
  }

  public void didUpdateParticles() {
    PVector posAtoB = PVector.sub(particleB.position(), particleA.position());
    float diff = posAtoB.mag() - stickLength;
    posAtoB.normalize();
    PVector posAToAdd;
    PVector posBToAdd;
    if (particleA.fragCollide()) {
      posAToAdd = new PVector(0, 0);
      posBToAdd = posAtoB.mult(-diff);
    } else if (particleB.fragCollide()) {
      posAToAdd = posAtoB.mult(diff);
      posBToAdd = new PVector(0, 0);
    } else {
      posAToAdd = PVector.mult(posAtoB, diff * 0.5);
      posBToAdd = PVector.mult(posAtoB, -diff * 0.5);
    }
    particleA.position().add(posAToAdd);
    particleA.velocity().add(posAToAdd);
    particleB.position().add(posBToAdd);
    particleB.velocity().add(posBToAdd);
  }

  public void draw() {
    noFill();
    stroke(0);
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }

  public void stickLength(float s) { stickLength = s; }
}
