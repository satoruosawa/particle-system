ParticleSystem particleSystem = new ParticleSystem();
BasicField basicField = new BasicField();

void setup() {
  size(500, 500);
  smooth();
  rectMode(CENTER);

  basicField.friction(0.0);

  Particle p = new Particle();
  p.addField(basicField);
  p.position(new PVector(10, 10));
  p.velocity(new PVector(1, 1));
  p.size(20);
  particleSystem.addParticle(p);
}

void update() {
  Ticker.update();
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
