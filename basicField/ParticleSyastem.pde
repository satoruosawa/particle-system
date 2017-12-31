class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }

  void update() {
    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.resetForce();
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }
}
