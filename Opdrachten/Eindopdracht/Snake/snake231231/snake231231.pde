ArrayList<PVector> snake; // stukje slang worden als positie ogesglagen
PVector food;     // eten plek spawn
int gridSize = 20;        // grote van vierkanten
int xDir = 1, yDir = 0; // snake positie
boolean gameOver = false;

void setup() {
  size(1280, 720);
  frameRate(15); // game speed als framerate


  snake = new ArrayList<PVector>();
  snake.add(new PVector(gridSize, gridSize));

  // eten spawn
  spawnFood();
}

void draw() {
  background(160, 255, 30);

  // Grid grootte
  drawGrid();

  if (!gameOver) {
    // Snake verplaatsing
    updateSnake();

    // collision gebeurt
    checkCollisions();

    // draw snake en eten
    drawSnake();
    drawFood();
  } else {
    // einde game menu
    textAlign(CENTER, CENTER);
    textSize(50);
    fill(255, 0, 0);
    text("Game Over!", width / 2, height / 2);
    textSize(20);
    text("Press R to restart", width / 2, height / 2 + 50);
  }
}

void drawGrid() {
  stroke(255);
  strokeWeight(1);
  for (int i = 0; i < width; i += gridSize) { //voor verticale lijnen, width is de reso
    for (int j = 0; j < height; j += gridSize) { // voor horizontale lijnenn, height is de reso ook
      noFill();
      rect(i, j, gridSize, gridSize);
    }
  }
}

void updateSnake() {
  // voorkant positie
  PVector head = snake.get(0).copy();
  head.x += xDir * gridSize;
  head.y += yDir * gridSize;

  // nieuwe voorkant
  snake.add(0, head);

  // Check eten 
  if (head.equals(food)) {
    spawnFood(); // nieuwe eten
  } else {
    snake.remove(snake.size() - 1); // verwijder staart als geene eten
  }
}

void checkCollisions() {
  PVector head = snake.get(0); // de collision point

  // muren gameOver
  if (head.x < 0 || head.y < 0 || head.x >= width || head.y >= height) {
    gameOver = true;
  }
}

void drawSnake() {
  fill(0, 0, 255);
  noStroke(); //binnen
  for (PVector part : snake) { //part is positie
    rect(part.x, part.y, gridSize, gridSize);
  }
}

void drawFood() {
  fill(255, 0, 0);
  noStroke(); //binnen
  rect(food.x, food.y, gridSize, gridSize); // zelfde als drawSnake
}

void spawnFood() {
  int cols = width / gridSize; // berekent naar rechts
  int rows = height / gridSize; // berekent naar onder
  food = new PVector(floor(random(cols)) * gridSize, floor(random(rows)) * gridSize); // random is van cols/rows, grid geeft precies locatie van food
}

void keyPressed() {
  // controlss
  if (key == 'w' || keyCode == UP && yDir == 0) { // ==0 beweegt niet gelijk, pas volgende frame maar , telt voor ydir en xdir
    xDir = 0;
    yDir = -1;
  } else if (key == 's' || keyCode == DOWN && yDir == 0) {
    xDir = 0;
    yDir = 1;
  } else if (key == 'a' || keyCode == LEFT && xDir == 0) {
    xDir = -1;
    yDir = 0;
  } else if (key == 'd' || keyCode == RIGHT && xDir == 0) {
    xDir = 1;
    yDir = 0;
  }

  // Restart game
  if (key == 'r' || key == 'R') {
    restartGame();
  }
}

void restartGame() {
  snake.clear(); //weg met de slang
  snake.add(new PVector(gridSize, gridSize)); //snake opnieuw bij start
  spawnFood(); //eten spawned ook
  xDir = 1; //eerst naar rechts
  yDir = 0; // y verplaatst niet
  gameOver = false; // game gaat door
}
