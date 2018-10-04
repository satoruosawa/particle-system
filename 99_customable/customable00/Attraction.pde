class Attraction extends MutualForce {
  private float strength = 1;
  private float sleshhold = 1;

  public Attraction(Particle particleA, Particle particleB) {
    super(particleA, particleB);
  }

  public void willUpdateParticles() {
    PVector posBtoA = PVector.sub(particleA.position(), particleB.position());
    float distance = posBtoA.mag();
    if (distance < sleshhold) {
      float pct = 1 - (distance / sleshhold);
      posBtoA.normalize();
      PVector frcToAdd = posBtoA.mult(-pct * strength);
      particleA.addForce(frcToAdd);
      particleB.addForce(frcToAdd.mult(-1.0));
    }
  }

  public void didUpdateParticles() {
  }

  public void draw() {
    noFill();
    stroke(0,  255);
    PVector posA = particleA.position();
    PVector posB = particleB.position();
    line(posA.x, posA.y, posB.x, posB.y);
  }

  public void strength(float s) { strength = s; }
  public void sleshhold(float s) { sleshhold = s; }
}
