ParticleSystem particleSystem;

void setup() {
  size(500, 500);
  particleSystem = new ParticleSystem();
}

void update() {
  if (random(1) > 0.99) {
    addSpring();
  }
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}

void addSpring() {
  Particle pA = new Particle();
  pA.position(new PVector(random(0., width), random(0., height)));
  pA.life(511);
  pA.size(20);
  particleSystem.addParticle(pA);

  float posBAngle = random(0, TWO_PI);
  float posBLength = 60;
  Particle pB = new Particle();
  pB.position(
    new PVector(
      pA.position().x + posBLength * cos(posBAngle),
      pA.position().y + posBLength * sin(posBAngle)
    )
  );
  pB.life(511);
  pB.size(20);
  particleSystem.addParticle(pB);

  Spring s = new Spring(pA, pB);
  s.springLength(100);
  s.springiness(0.01);
  particleSystem.addMutualForce(s);
}
