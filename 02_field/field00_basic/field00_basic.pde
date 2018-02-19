ParticleSystem particleSystem = new ParticleSystem();
BasicField field = new BasicField();

void setup() {
  size(500, 500);
  field.setFriction(0.05);
}

void update() {
  Particle p = new Particle(new PVector(random(0., width), random(0., height)));
  p.setVelocity(new PVector(random(-1, 1), random(-1, 1)).mult(10));
  p.addField(field);
  particleSystem.addParticle(p);
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
