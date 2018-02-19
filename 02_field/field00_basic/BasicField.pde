class BasicField extends Field {
  private float friction;
  private WallBehavior wallBehavior;
  private float cor;

  public BasicField() {
    super();
    this.wallBehavior = WallBehavior.BOUNCE;
    this.friction = 0.0;
    this.cor = 1.0;
  }

  public void preParticleUpdate(Particle particle) {
    particle.addForce(PVector.mult(particle.velocity(), -friction));
  }

  public void postParticleUpdate(Particle particle) {
    wallBehavior(particle);
  }

  public void wallBehavior(Particle particle) {
    switch (wallBehavior) {
      case BOUNCE:
        bounceOfWalls(particle);
        break;
    }
  }

  private void bounceOfWalls(Particle particle) {
    float xmin = 0 + particle.size();
    float xmax = width - particle.size();
    float ymin = 0 + particle.size();
    float ymax = height - particle.size();
    PVector pos = particle.position();
    PVector vel = particle.velocity();
    if (pos.x < xmin) {
      pos.x = xmin + (xmin - pos.x);
      vel.x *= -cor;
    } else if (pos.x > xmax) {
      pos.x = xmax - (pos.x - xmax);
      vel.x *= -cor;
    }
    if (pos.y < ymin) {
      pos.y = ymin + (ymin - pos.y);
      vel.y *= -cor;
    } else if (pos.y > ymax) {
      pos.y = ymax - (pos.y - ymax);
      vel.y *= -cor;
    }
  }

  public void setFriction(float friction) { this.friction = friction; }
  public void setCor(float cor) { this.cor = cor; }
}

enum WallBehavior {
  BOUNCE,
  THROUGH
};
