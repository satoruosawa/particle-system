import java.util.Iterator;

ParticleSystem particleSystem = new ParticleSystem();
PerlinNoiseField perlinNoiseField = new PerlinNoiseField();

void setup() {
  size(500, 500);
}

void update() {
  for (int i = 0; i < 10; i++) {
    Particle p = new Particle();
    p.position(new PVector(random(0, width), random(0, height)));
    p.addField(perlinNoiseField);
    p.life(511);
    p.size(3);
    particleSystem.addParticle(p);
  }

  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
