class BasicField extends Field {
  private float friction;
  private WallBehavior wallBehavior;
  private float coef;

  public BasicField() {
    super();
    wallBehavior = WallBehavior.NOTHING;
    friction = 0;
    coef = 1;
  }

  public void willUpdateParticle(Particle particle) {
    particle.addForce(PVector.mult(particle.velocity(), -friction));
  }

  public void didUpdateParticle(Particle particle) {
    applyWallBehavior(particle);
  }

  public void applyWallBehavior(Particle particle) {
    switch (wallBehavior) {
      case BOUNCE:
        bounceOfWalls(particle);
        break;
      case THROUGH:
        throughOfWalls(particle);
        break;
      default:
        break;
    }
  }

  private void bounceOfWalls(Particle particle) {
    // BUG: don't work properly
    float xmin = -1.0 + particle.size() / 2.0;
    float xmax = 1.0 - particle.size() / 2.0;
    float ymin = -1.0 + particle.size() / 2.0;
    float ymax = 1.0 - particle.size() / 2.0;
    PVector position = particle.position();
    PVector velocity = particle.velocity();
    if (position.x < xmin) {
      position.x = xmin + (xmin - position.x);
      velocity.x *= -coef;
    } else if (position.x > xmax) {
      position.x = xmax - (position.x - xmax);
      velocity.x *= -coef;
    }
    if (position.y < ymin) {
      position.y = ymin + (ymin - position.y);
      velocity.y *= -coef;
    } else if (position.y > ymax) {
      position.y = ymax - (position.y - ymax);
      velocity.y *= -coef;
    }
  }

  private void throughOfWalls(Particle particle) {
    float xmin = -1.0 - particle.size() / 2.0;
    float xmax = 1.0 + particle.size() / 2.0;
    float ymin = -1.0 - particle.size() / 2.0;
    float ymax = 1.0 + particle.size() / 2.0;
    float shiftWidth = 2.0 + particle.size();
    float shiftHeight = 2.0 + particle.size();
    PVector position = particle.position();
    PVector velocity = particle.velocity();
    if (position.x < xmin) {
      position.x += shiftWidth;
      velocity.x *= coef;
    } else if (position.x > xmax) {
      position.x -= shiftWidth;
      velocity.x *= coef;
    }
    if (position.y < ymin) {
      position.y += shiftHeight;
      velocity.y *= coef;
    } else if (position.y > ymax) {
      position.y -= shiftHeight;
      velocity.y *= coef;
    }
  }

  public void friction(float f) { friction = f; }
  public void coef(float c) { coef = c; }
  public void wallBehavior(WallBehavior w) { wallBehavior = w; }
}

enum WallBehavior {
  BOUNCE,
  THROUGH,
  NOTHING
};
