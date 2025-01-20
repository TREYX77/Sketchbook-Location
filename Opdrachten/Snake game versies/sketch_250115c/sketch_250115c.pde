int xWaarde = 0;
int yWaarde = 0;

void setup() {
  size(1280, 720);
  background(160, 255, 30);

  
  for (int i = 0; i < 128; i++) {
    for (int j = 0; j < 72; j++) {
      stroke(255);
      strokeWeight(2);
      noFill();
      rect(i * 20, j * 20, 20, 20); 
    }
  }
}

void draw() {
  xWaarde += 2;
  if (xWaarde >= width) { 
    xWaarde = 0;
    yWaarde += 30; 
  }
  if (yWaarde >= height) {
    yWaarde = 0;
  }


  stroke(0, 0, 40); 
  strokeWeight(1);
  fill(255, 255, 0); 
  rect(xWaarde, yWaarde, 10, 10); 
}
