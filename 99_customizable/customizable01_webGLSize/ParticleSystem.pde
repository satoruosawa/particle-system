class ParticleSystem {
  private ArrayList<Particle> particles = new ArrayList<Particle>();
  private ArrayList<MutualForce> mutualForces = new ArrayList<MutualForce>();

  public void update() {
    for (Particle p : particles) {
      p.resetForce();
    }

    for (MutualForce m : mutualForces) {
      m.willUpdateParticles();
    }

    for (Particle p : particles) {
      p.update();
    }

    for (MutualForce m : mutualForces) {
      m.didUpdateParticles();
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
