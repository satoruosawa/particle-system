PVector dispPos(PVector calcPos) {
  return new PVector((calcPos.x + 1.0) * SCALE, (-calcPos.y + 1.0) * SCALE);
}

PVector calcPos(PVector dispPos) {
  return new PVector(dispPos.x / SCALE - 1.0, 1.0 - dispPos.y / SCALE);
}

PVector calcMousePos() {
  return new PVector(mouseX / SCALE - 1.0, 1.0 - mouseY / SCALE);
}
