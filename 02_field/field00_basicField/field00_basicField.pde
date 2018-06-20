ParticleSystem particleSystem = new ParticleSystem();
BasicField basicField = new BasicField();

void setup() {
  size(500, 500);
  basicField.friction(0.02);
}

void update() {
  Particle p = new Particle();
  p.position(new PVector(random(0., width), random(0., height)));
  p.velocity(new PVector(random(-1, 1), random(-1, 1)).mult(10));
  p.lifespan(511);
  p.size(20);
  p.addField(basicField);
  particleSystem.addParticle(p);
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
