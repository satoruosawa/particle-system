import java.text.SimpleDateFormat;
import java.util.*;

ParticleSystem particleSystem = new ParticleSystem();
BasicField basicField = new BasicField();

float SCALE = 1;

void setup() {
  size(500, 500);
  SCALE = width / 2.0;
  smooth();

  basicField.friction(0.01);

  for (int i = 0; i < 10; i++) {
    addSpring();
  }
}

void update() {
  Ticker.update();
  Scene.update();
  particleSystem.update();
}

void draw() {
  update();
  // background(255);
  motionBlur();
  particleSystem.draw();
}

void addSpring() {
  Particle pA = new Particle();
  pA.position(calcPos(new PVector(random(0., width), random(0., height))));
  pA.size(20 / SCALE);
  particleSystem.addParticle(pA);

  float posBAngle = random(0, TWO_PI);
  float posBLength = 60 / SCALE;
  Particle pB = new Particle();
  pB.position(
    new PVector(
      pA.position().x + posBLength * cos(posBAngle),
      pA.position().y + posBLength * sin(posBAngle)
    )
  );
  pB.size(20 / SCALE);
  particleSystem.addParticle(pB);

  Spring s = new Spring(pA, pB);
  s.springLength(100 / SCALE);
  s.springiness(0.01);
  particleSystem.addMutualForce(s);
}

void addAttraction() {
  Particle pA = new Particle();
  pA.position(calcPos(new PVector(random(0., width), random(0., height))));
  pA.size(20 / SCALE);
  particleSystem.addParticle(pA);

  float posBAngle = random(0, TWO_PI);
  float posBLength = 60 / SCALE;
  Particle pB = new Particle();
  pB.position(calcPos(new PVector(random(0., width), random(0., height))));
  pB.size(20 / SCALE);
  particleSystem.addParticle(pB);

  Attraction a = new Attraction(pA, pB);
  a.strength(0.01);
  a.sleshhold(500 / SCALE);
  particleSystem.addMutualForce(a);
}

void motionBlur() {
  fill(255, 15);
  noStroke();
  rect(0, 0, width, height);
  noFill();
}

PVector dispPos(PVector calcPos) {
  return new PVector((calcPos.x + 1.0) * SCALE, (-calcPos.y + 1.0) * SCALE);
}

PVector calcPos(PVector dispPos) {
  return new PVector(dispPos.x / SCALE - 1.0, 1.0 - dispPos.y / SCALE);
}

PVector calcMousePos() {
  return new PVector(mouseX / SCALE - 1.0, 1.0 - mouseY / SCALE);
}

void keyPressed() {
  if (key == 's') {
    Date d = new Date();
    String str = new SimpleDateFormat("yyyyMMdd_hhmmss").format(d);
    save(str + ".png");
    println(str);
  }
}
