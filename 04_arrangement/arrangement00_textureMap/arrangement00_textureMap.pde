ParticleSystem particleSystem = new ParticleSystem();
PImage img;

void setup() {
  size(500, 500);
  img = loadImage("./data/texture.png");
  background(255);
  image(img, 0, 0, width, height);
  loadPixels();
  background(0);
  for (int j = 0; j < height; j++) {
    for (int i = 0; i < width; i++) {
      color c = pixels[j * width + i];
      if (c != -1) {
        Particle p = new Particle();
        p.position(new PVector(i, j));
        p.particleColor(c);
        particleSystem.addParticle(p);
      }
    }
  }
}

void update() {
  particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
