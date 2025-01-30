
void setup() {
  size(1280, 720);
  background(160, 255, 30);

  int xWaarde = 0;
  int yWaarde = 0;


  for (int i = 0; i < 128; i++) {
    for (int j = 0; j < 72; j++) {
      stroke(255);
      strokeWeight(2);
      noFill();
      rect(xWaarde, yWaarde, 20, 20);

      yWaarde = yWaarde + 20;
    }
    yWaarde = 0;
    xWaarde = xWaarde + 20;
  }
}

void draw() {
  xWaarde++;
  yWaarde+=5;

  if (xWaarde >= 500) {
    xWaarde = 0;

    if (yWaarde >= 500) {
      yWaarde = 0;
    }

    rect(xWaarde, yWaarde, 1, 1);
  }
