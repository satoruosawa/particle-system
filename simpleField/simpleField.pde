ParticleSystem ps;
VectorField field;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();
  field = new VectorField();
}

void update() {
  Particle p = new Particle(new PVector(random(0, width), random(0, height)));
  p.addField(field);
  ps.addParticle(p);
  ps.update();
}

void draw() {
  update();
  background(255);
  ps.draw();
}
