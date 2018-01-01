class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<Spring> springs;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<Spring>();
  }

  void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (int i = springs.size() - 1; i >= 0; i--) {
      Spring s = springs.get(i);
      s.update();
      if (s.isDead()) {
        springs.remove(i);
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

  void draw() {
    for (Particle p : particles) {
      p.draw();
    }
    for (Spring s : springs) {
      s.draw();
    }
  }

  void addParticle(Particle p) {
    particles.add(p);
  }

  void addSpring(Spring s) {
    springs.add(s);
  }
}
