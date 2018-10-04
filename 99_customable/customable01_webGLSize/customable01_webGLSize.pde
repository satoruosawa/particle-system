import java.text.SimpleDateFormat;
import java.util.*;

ParticleSystem particleSystem = new ParticleSystem();
BasicField basicField = new BasicField();

float SCALE = 1.0;

void setup() {
  size(500, 500);
  SCALE = width / 2.0;
  smooth();

  basicField.friction(0.01);
  basicField.wallBehavior(WallBehavior.BOUNCE);

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
  pA.addField(basicField);
  pA.position(calcPos(new PVector(random(0., width), random(0., height))));
  pA.size(20.0 / SCALE);
  particleSystem.addParticle(pA);

  float posBAngle = random(0.0, TWO_PI);
  float posBLength = 60.0 / SCALE;
  Particle pB = new Particle();
  pB.addField(basicField);
  pB.position(
    new PVector(
      pA.position().x + posBLength * cos(posBAngle),
      pA.position().y + posBLength * sin(posBAngle)
    )
  );
  pB.size(20.0 / SCALE);
  particleSystem.addParticle(pB);

  Spring s = new Spring(pA, pB);
  s.springLength(100.0 / SCALE);
  s.springiness(0.01);
  particleSystem.addMutualForce(s);
}

void addAttraction() {
  Particle pA = new Particle();
  pA.addField(basicField);
  pA.position(calcPos(new PVector(random(0.0, width), random(0.0, height))));
  pA.size(20.0 / SCALE);
  particleSystem.addParticle(pA);

  float posBAngle = random(0.0, TWO_PI);
  float posBLength = 60.0 / SCALE;
  Particle pB = new Particle();
  pB.addField(basicField);
  pB.position(calcPos(new PVector(random(0.0, width), random(0.0, height))));
  pB.size(20.0 / SCALE);
  particleSystem.addParticle(pB);

  Attraction a = new Attraction(pA, pB);
  a.strength(0.01);
  a.sleshhold(500.0 / SCALE);
  particleSystem.addMutualForce(a);
}

void motionBlur() {
  fill(255, 15);
  noStroke();
  rect(0, 0, width, height);
  noFill();
}

void keyPressed() {
  if (key == 's') {
    Date d = new Date();
    String str = new SimpleDateFormat("yyyyMMdd_hhmmss").format(d);
    save(str + ".png");
    println(str);
  }
}
