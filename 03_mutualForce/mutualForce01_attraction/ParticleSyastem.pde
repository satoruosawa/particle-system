class ParticleSystem {
  private ArrayList<Particle> particles = new ArrayList<Particle>();
  private ArrayList<MutualForce> mutualForces = new ArrayList<MutualForce>();

  public void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (int i = mutualForces.size() - 1; i >= 0; i--) {
      MutualForce m = mutualForces.get(i);
      m.update();
      if (m.isDead()) mutualForces.remove(i);
    }

    for (int i = particles.size() - 1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) particles.remove(i);
    }
  }

  public void draw() {
    for (Particle p : particles) {
      p.draw();
    }
    for (MutualForce m : mutualForces) {
      m.draw();
    }
  }

  public void addParticle(Particle p) { particles.add(p); }
  public void addMutualForce(MutualForce m) { mutualForces.add(m); }
}
