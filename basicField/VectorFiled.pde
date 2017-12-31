class VectorField {
  ArrayList<PVector> vectors;
  int fieldWidth;
  int fieldHeight;

  VectorField() {
    vectors = new ArrayList<PVector>();
    fieldWidth = 10;
    fieldHeight = 10;
    randomForce();
  }

  void randomForce() {
    for (int j = 0; j < fieldHeight; j++) {
      for (int i = 0; i < fieldWidth; i++) {
        PVector v = new PVector(random(-1, 1), random(-1, 1));
        v.mult(0.01);
        vectors.add(v);
      }
    }
  }

  void getForce(Particle particle) {
    float x = particle.position().x;
    float y = particle.position().y;
    float xPct = x / width;
    float yPct = y / height;
    if ((xPct < 0 || xPct > 1) || (yPct < 0 || yPct > 1)){
  		return;
  	}
    int fieldPosX = round(xPct * fieldWidth);
    int fieldPosY = round(yPct * fieldHeight);
    fieldPosX = max(0, min(fieldPosX, fieldWidth - 1));
    fieldPosY = max(0, min(fieldPosY, fieldHeight - 1));
    int fieldIndex = fieldPosY * fieldWidth + fieldPosX;
    particle.addForce(vectors.get(fieldIndex));
  }
}
