import java.util.Iterator;

ParticleSystem particleSystem = new ParticleSystem();

void setup() {
  size(500, 500);
}

void update() {
  Particle p = new Particle();
  p.position(new PVector(width / 2, height / 2));
  p.velocity(new PVector(random(-1, 1), random(-1, 1)));
  p.life(255);
  p.size(20);
  particleSystem.addParticle(p);
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
