import java.util.Iterator;

ParticleSystem particleSystem = new ParticleSystem();
PImage pImage;
PGraphics pGraphics;

void setup() {
  size(500, 500);
  background(255);
  pImage = loadImage("./data/texture.png");
  pGraphics = createGraphics(width, height);
  pGraphics.beginDraw(); {
    pGraphics.background(255);
    pGraphics.image(pImage, 0, 0, pGraphics.width, pGraphics.height);
    pGraphics.loadPixels();
    for (int j = 0; j < pGraphics.height; j++) {
      for (int i = 0; i < pGraphics.width; i++) {
        color c = pGraphics.pixels[j * pGraphics.width + i];
        if (c != -1) {
          Particle p = new Particle();
          p.position(new PVector(i, j));
          p.particleColor(c);
          p.velocity(new PVector(random(-1, 1), random(-1, 1)));
          particleSystem.addParticle(p);
        }
      }
    }
  } pGraphics.endDraw();
}

void update() {
  if (mousePressed)
    particleSystem.update();
}

void draw() {
  update();
  background(255);
  particleSystem.draw();
}
