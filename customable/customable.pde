BasicField basicField = new BasicField();
ParticleContainer particles = new ParticleContainer();

float SCALE = 1.;

void setup() {
  size(500, 500, P2D);
  smooth(8);
  rectMode(CENTER);

  basicField.setFriction(0.5);

  Particle p = new Particle();
  p.setPos(new PVector(10,10));
  particles.add(p);
}

void update() {
  Ticker.update();
  particles.update();
}

void draw() {
  update();
  background(255);
  noStroke();
  fill(0);
  particles.draw();
}
