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
    particle.addFrc(PVector.mult(particle.vel(), -friction));
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
    float xmin = -1.0 + particle.size();
    float xmax = 1.0 - particle.size();
    float ymin = -1.0 + particle.size();
    float ymax = 1.0 - particle.size();
    PVector pos = particle.pos();
    PVector vel = particle.vel();
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

  // setter
  public void setFriction(float friction) { this.friction = friction; }
  public void setCor(float cor) { this.cor = cor; }
}

enum WallBehavior {
  BOUNCE,
  THROUGH
};
