ParticleSystem ps;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();
}

void update() {
  Particle p = new Particle(new PVector(250, 250));
  ps.addParticle(p);
  ps.update();
}

void draw() {
  update();
  background(255);
  ps.draw();
}
