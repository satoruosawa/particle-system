class ParticleSystem {
  private ArrayList<Particle> particles;
  private ArrayList<MutualForce> mutuals;

  public ParticleSystem() {
    particles = new ArrayList<Particle>();
    mutuals = new ArrayList<MutualForce>();
  }

  public void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (int i = mutuals.size() - 1; i >= 0; i--) {
      MutualForce m = mutuals.get(i);
      m.update();
      if (m.isDead()) {
        mutuals.remove(i);
      }
    }

    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  public void draw() {
    for (Particle p : particles) {
      p.draw();
    }
    for (MutualForce m : mutuals) {
      m.draw();
    }
  }

  public void addParticle(Particle p) {
    particles.add(p);
  }
}
