ParticleSystem ps;

void setup() {
  size(500, 500);
  ps = new ParticleSystem();
}

void update() {
  if (random(1) > 0.99) {
    add();
  }
  ps.update();
}

void draw() {
  update();
  background(255);
  ps.draw();
}

void add() {
  PVector posA = new PVector(random(0, width), random(0, height));
  Particle pA = new Particle(posA);
  float posBAngle = random(0, TWO_PI);
  float posBLength = 60;
  PVector posB = new PVector(posA.x + posBLength * cos(posBAngle), posA.y + posBLength * sin(posBAngle));
  Particle pB = new Particle(posB);
  ps.addParticle(pA);
  ps.addParticle(pB);
  Spring s = new Spring(pA, pB, 100, 0.01);
  ps.addSpring(s);
}
