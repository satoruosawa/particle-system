class Stick extends MutualForce {
  private float stickLength = 1;
  private float springiness = 1;

  public Stick(Particle particleA, Particle particleB) {
    super(particleA, particleB);
  }

  public void willUpdateParticles() {
  }

  public void didUpdateParticles() {
    PVector posAtoB = PVector.sub(particleB.position(), particleA.position());
    float diff = posAtoB.mag() - stickLength;
    posAtoB.normalize();
    PVector posToAdd = posAtoB.mult(diff * 0.5);
    particleA.position().add(posToAdd);
    particleA.velocity().add(posToAdd);
    particleB.position().add(posToAdd.mult(-1.0));
    particleB.velocity().add(posToAdd);
  }

  public void draw() {
    noFill();
    stroke(0);
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }

  public void stickLength(float s) { stickLength = s; }
  public void springiness(float s) { springiness = s; }
}
