class ParticleSystem {
  private ArrayList<Particle> particles = new ArrayList<Particle>();
  private ArrayList<MutualForce> mutualForce = new ArrayList<MutualForce>();

  public void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (MutualForce m : mutualForce) {
      m.update();
    }

    for (Particle p : particles) {
      p.update();
    }
  }

  public void draw() {
    for (Particle p : particles) {
      p.draw();
    }
  }

  public void addParticle(Particle p) { particles.add(p); }
  public void addMutualForce(MutualForce m) { mutualForce.add(m); }
}
