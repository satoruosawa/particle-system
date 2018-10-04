ParticleSystem particleSystem = new ParticleSystem();

void setup() {
  size(500, 500);
}

void update() {
  if (random(1) > 0.99) {
    addAttraction();
  }
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}

void addAttraction() {
  Particle pA = new Particle();
  pA.position(new PVector(random(0., width), random(0., height)));
  pA.life(511);
  pA.size(20);
  particleSystem.addParticle(pA);

  float posBAngle = random(0, TWO_PI);
  float posBLength = 60;
  Particle pB = new Particle();
  pB.position(new PVector(random(0., width), random(0., height)));
  pB.life(511);
  pB.size(20);
  particleSystem.addParticle(pB);

  Attraction a = new Attraction(pA, pB);
  a.strength(0.1);
  a.sleshhold(500);
  particleSystem.addMutualForce(a);
}
