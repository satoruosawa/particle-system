ParticleSystem particleSystem = new ParticleSystem();
VectorField vectorField = new VectorField();

void setup() {
  size(500, 500);
}

void update() {
  Particle p = new Particle();
  p.position(new PVector(random(0, width), random(0, height)));
  p.addField(vectorField);
  p.life(511);
  p.size(20);
  particleSystem.addParticle(p);

  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
