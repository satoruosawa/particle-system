ParticleSystem particleSystem = new ParticleSystem();
BasicField basicField = new BasicField();

void setup() {
  size(500, 500);
  basicField.wallBehavior(WallBehavior.BOUNCE);
}

void update() {
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}

void mouseClicked() {
  addSpring();
}

void addSpring() {
  Particle pA = new Particle();
  pA.position(new PVector(random(0., width), random(0., height)));
  pA.velocity(new PVector(random(-1, 1), random(-1, 1)));
  pA.size(20);
  pA.addField(basicField);
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
  pB.velocity(new PVector(random(-1, 1), random(-1, 1)));
  pB.size(20);
  pB.addField(basicField);
  particleSystem.addParticle(pB);

  Stick s = new Stick(pA, pB);
  s.stickLength(100);
  particleSystem.addMutualForce(s);
}
