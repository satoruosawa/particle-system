class VectorField {
  private ArrayList<PVector> vectors;
  private int fieldWidth;
  private int fieldHeight;

  public VectorField() {
    vectors = new ArrayList<PVector>();
    fieldWidth = 10;
    fieldHeight = 10;
    randomForce();
  }

  public void randomForce() {
    for (int j = 0; j < fieldHeight; j++) {
      for (int i = 0; i < fieldWidth; i++) {
        PVector v = new PVector(random(-1, 1), random(-1, 1));
        v.mult(0.01);
        vectors.add(v);
      }
    }
  }

  public PVector getForce(PVector position) {
    float xPct = position.x / width;
    float yPct = position.y / height;
    if ((xPct < 0 || xPct > 1) || (yPct < 0 || yPct > 1)){
  		return new PVector(0, 0);
  	}
    int fieldPosX = round(xPct * fieldWidth);
    int fieldPosY = round(yPct * fieldHeight);
    fieldPosX = max(0, min(fieldPosX, fieldWidth - 1));
    fieldPosY = max(0, min(fieldPosY, fieldHeight - 1));
    int fieldIndex = fieldPosY * fieldWidth + fieldPosX;
    return vectors.get(fieldIndex);
  }
}
