ParticleSystem particleSystem = new ParticleSystem();

void setup() {
  size(500, 500);
}

void update() {
  Particle p = new Particle(new PVector(250., 250.));
  particleSystem.addParticle(p);
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
