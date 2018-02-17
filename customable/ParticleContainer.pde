class ParticleContainer {
  private ArrayList<Particle> particles = new ArrayList<Particle>();
  private ArrayList<MutualFrc> mutualFrcs = new ArrayList<MutualFrc>();

  public void update() {
    for (Particle p : particles) {
      p.resetFrc();
    }

    for (MutualFrc m : mutualFrcs) {
      m.update();
    }

    for (Particle p : particles) {
      p.update();
    }
  }

  public void draw() {
    for (Particle p : particles) {
      ellipse(p.pos().x, p.pos().y, p.size(), p.size());
    }
  }

  public void add(Particle addParticle) {
    particles.add(addParticle);
  }
}
