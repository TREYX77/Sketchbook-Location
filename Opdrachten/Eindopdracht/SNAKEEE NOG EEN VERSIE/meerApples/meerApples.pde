ArrayList<PVector> snake; // Slang positie
ArrayList<PVector> food5; // Meerdere eten plekken
int gridSize = 30; // Grote van vierkanten
int xDir = 1, yDir = 0; // Snake richting
boolean gameOver = false;
int foodAmount = 20; // Aantal voedselitems

void setup() {
  size(1280, 720);
  frameRate(5); // Game speed

  snake = new ArrayList<PVector>();
  snake.add(new PVector(gridSize, gridSize));

  food5 = new ArrayList<PVector>();
  spawnFood(); // Spawn meerdere eten
}

void draw() {
  background(160, 255, 30);
  drawGrid();

  if (!gameOver) {
    updateSnake();
    checkCollisions();
    drawSnake();
    drawFood();
  } else {
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
  for (int i = 0; i < width; i += gridSize) {
    for (int j = 0; j < height; j += gridSize) {
      noFill();
      rect(i, j, gridSize, gridSize);
    }
  }
}

void updateSnake() {
  PVector head = snake.get(0).copy();
  head.x += xDir * gridSize;
  head.y += yDir * gridSize;

  snake.add(0, head);

  // Check of slang een voedsel eet
  boolean ateFood = false;
  for (int i = food5.size() - 1; i >= 0; i--) {
    if (head.equals(food5.get(i))) {
      food5.remove(i); // Verwijder gegeten eten
      spawnFood(); // Nieuw voedsel spawnen
      ateFood = true;
      break;
    }
  }

  if (!ateFood) {
    snake.remove(snake.size() - 1); // Staart verwijderen als geen eten
  }
}

void checkCollisions() {
  PVector head = snake.get(0);

  // Botsing met muren
  if (head.x < 0 || head.y < 0 || head.x >= width || head.y >= height) {
    gameOver = true;
  }

  // Botsing met zichzelf
  for (int i = 1; i < snake.size(); i++) {
    if (head.equals(snake.get(i))) {
      gameOver = true;
    }
  }
}

void drawSnake() {
  fill(0, 0, 255);
  noStroke();
  for (PVector part : snake) {
    rect(part.x, part.y, gridSize, gridSize);
  }
}

void drawFood() {
  fill(255, 0, 0);
  noStroke();
  for (PVector food : food5) {
    rect(food.x, food.y, gridSize, gridSize);
  }
}

void spawnFood() {
  while (food5.size() < foodAmount) {
    int cols = width / gridSize;
    int rows = height / gridSize;
    PVector newFood = new PVector(floor(random(cols)) * gridSize, floor(random(rows)) * gridSize);

    // Voorkom dat voedsel op de slang spawnt
    boolean onSnake = false;
    for (PVector part : snake) {
      if (part.equals(newFood)) {
        onSnake = true;
        break;
      }
    }

    if (!onSnake) {
      food5.add(newFood);
    }
  }
}          //als dit stuk niet bestaat, crashed de code

void keyPressed() {
  if (key == 'w' && yDir == 0 || keyCode == UP && yDir == 0) {
    xDir = 0;
    yDir = -1;
  } else if (key == 's' && yDir == 0 || keyCode == DOWN && yDir == 0) {
    xDir = 0;
    yDir = 1;
  } else if (key == 'a' && xDir == 0 || keyCode == LEFT && xDir == 0) {
    xDir = -1;
    yDir = 0;
  } else if (key == 'd' && xDir == 0 || keyCode == RIGHT && xDir == 0) {
    xDir = 1;
    yDir = 0;
  }

  if (key == 'r' || key == 'R') {
    restartGame();
  }
}

void restartGame() {
  snake.clear();
  snake.add(new PVector(gridSize, gridSize));
  food5.clear();
  spawnFood();
  xDir = 1;
  yDir = 0;
  gameOver = false;
}
